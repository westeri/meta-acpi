/*
 * Intel Minnowboard
 *
 * http://wiki.minnowboard.org/MinnowBoard
 *
 * This adds GPIO buttons device for the 4 switches found on Intel
 * Minnowboard available for users.
 *
 *   GPIO name           GPIO number  switch
 *   ---------------------------------------
 *   E6XX_GPIO_S0        0            S0
 *   E6XX_GPIO_S1        1            S1
 *   E6XX_GPIO_S2        2            S2
 *   E6XX_GPIO_S3        3            S3
 *
 * In Linux you need to set CONFIG_KEYBOARD_GPIO_POLLED=y (or m) to be
 * able to use this device.
 *
 * Copyright (C) 2016, Intel Corporation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
DefinitionBlock ("buttons.aml", "SSDT", 5, "", "BUTTONS", 1)
{
    External (_SB_.PCI0.LPC, DeviceObj)

    Scope (\_SB.PCI0.LPC)
    {
        Device (BTNS)
        {
            Name (_HID, "PRP0001")
            Name (_DDN, "GPIO buttons device")

            Name (_CRS, ResourceTemplate () {
                GpioIo (
                    Exclusive,                  // Not shared
                    PullUp,                     // Pull up the line
                    0,                          // Debounce timeout
                    0,                          // Drive strength
                    IoRestrictionInputOnly,     // Only used as input
                    "\\_SB.PCI0.LPC",           // GPIO controller
                    0)                          // Must be 0
                {
                    0,                         // E6XX_GPIO_S0
                    1,                         // E6XX_GPIO_S1
                    2,                         // E6XX_GPIO_S2
                    3,                         // E6XX_GPIO_S3
                }
            })

            Name (_DSD, Package () {
                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "compatible", Package() { "gpio-keys-polled" } },
                    Package () { "poll-interval", 100 },
                    Package () { "autorepeat", 1 }
                },
                ToUUID("dbb8e3e6-5886-4ba6-8795-1319f52a966b"),
                Package () {
                    Package () {"button-0", "BTN0"},
                    Package () {"button-1", "BTN1"},
                    Package () {"button-2", "BTN2"},
                    Package () {"button-3", "BTN3"}
                }
            })

            /*
             * For more information about these bindings see:
             * Documentation/devicetree/bindings/input/gpio-keys-polled.txt
             * and Documentation/acpi/gpio-properties.txt.
             */
            Name (BTN0, Package () {
                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () {"linux,code", 105},
                    Package () {"linux,input-type", 1},
                    Package () {"gpios", Package () {^BTNS, 0, 0, 1}}
                }
            })

            Name (BTN1, Package () {
                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () {"linux,code", 108},
                    Package () {"linux,input-type", 1},
                    Package () {"gpios", Package (4) {^BTNS, 0, 1, 1}}
                }
            })

            Name (BTN2, Package () {
                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () {"linux,code", 103},
                    Package () {"linux,input-type", 1},
                    Package () {"gpios", Package () {^BTNS, 0, 2, 1}}
                }
            })

            Name (BTN3, Package () {
                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () {"linux,code", 106},
                    Package () {"linux,input-type", 1},
                    Package () {"gpios", Package () {^BTNS, 0, 3, 1}}
                }
            })
        }
    }
}
