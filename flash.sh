#!/usr/bin/env bash
set -euo pipefail

KEYMAP_JSON="keyboards/ferris/sweep/keymaps/default/keymap.json"
cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "[1/4] Compiling..."
qmk compile "$KEYMAP_JSON" -e CONVERT_TO=rp2040_ce >/dev/null
UF2=$(ls -t ferris_sweep_*_rp2040_ce.uf2 | head -n 1)
echo "Built: $UF2"

echo "[2/4] Waiting for RPI-RP2 (plug in with BOOTSEL held)..."
DEV=""
for _ in $(seq 1 30); do
    DEV=$(lsblk -rno NAME,LABEL | awk '$2 == "RPI-RP2" {print $1; exit}')
    [ -n "$DEV" ] && break
    sleep 1
done
if [ -z "$DEV" ]; then
    echo "ERROR: no RPI-RP2 device found"
    exit 1
fi

echo "[3/4] Mounting /dev/$DEV..."
udisksctl mount -b "/dev/$DEV" >/dev/null 2>&1 || true
MNT=$(lsblk -rno MOUNTPOINT "/dev/$DEV" | head -n 1)
if [ -z "$MNT" ] || [ ! -d "$MNT" ]; then
    echo "ERROR: mount failed"
    exit 1
fi

echo "[4/4] Flashing to $MNT ..."
cp "$UF2" "$MNT/"
sync

for _ in $(seq 1 15); do
    if [ ! -f "$MNT/$UF2" ]; then
        echo "Done - board rebooted into new firmware"
        exit 0
    fi
    sleep 1
done
echo "WARNING: UF2 not consumed after 15s - check the board/cable"
