/*
Copyright 2021 Pierre Chevalier <pierrechevalier83@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#undef DIRECT_PINS
#define DIRECT_PINS { \
    { D7, F7, F6, F5, F4 }, \
    { B1, B3, B2, B6, D3 }, \
    { D1, D0, D4, C6, E6 }, \
    { B4, B5, NO_PIN, NO_PIN, NO_PIN } \
}
#undef DIRECT_PINS_RIGHT
#define DIRECT_PINS_RIGHT { \
    { F4, F5, F6, F7, D7 }, \
    { D3, B6, B2, B3, B1 }, \
    { E6, C6, D4, D0, D1 }, \
    { B5, B4, NO_PIN, NO_PIN, NO_PIN } \
}

#pragma once

/* LED Drivers */
#define IS31FL3731_I2C_ADDRESS_1 IS31FL3731_I2C_ADDRESS_GND
#define IS31FL3731_I2C_ADDRESS_2 IS31FL3731_I2C_ADDRESS_SCL

#define RGB_MATRIX_LED_COUNT 14
