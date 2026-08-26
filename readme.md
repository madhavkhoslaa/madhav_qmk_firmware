# Clone of my QMK

## Post Clone
`make git-submodule`

## To Flask
` qmk flash -c -kb ferris/sweep -km default -e CONVERT_TO=rp2040_ce`
Uses `keyboards/ferris/sweep/keymaps/default/keymap.json`

## Mount RP2040 (BOOTSEL)
Hold BOOTSEL while plugging in, then check it shows up:
`lsblk -f`
Mount (no sudo needed):
`udisksctl mount -b /dev/sda1`
Mounts at `/run/media/$USER/RPI-RP2`

Note: the device disappears right after flashing since the MCU reboots out of BOOTSEL — mount again if needed.
To flash manually: copy the `.uf2` to `/run/media/$USER/RPI-RP2`