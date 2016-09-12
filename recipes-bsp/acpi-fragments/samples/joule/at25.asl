/*
 * Intel Joule
 *
 * This adds Atmel AT25 compatible serial EEPROM to the SPI host controller
 * available on Intel Joule breakout #1 header using chip select 0:
 *
 *   pin name           pin number
 *   -----------------------------
 *   SPI_1_MISO_LS      2
 *   SPI_1_MOSI_LS      4
 *   SPI_1_FS0_LS       6
 *   SPI_1_CLK_LS       10
 *
 * In Linux you need to set CONFIG_EEPROM_AT25=y (or m) to be able to use
 * this device.
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
DefinitionBlock ("at25.aml", "SSDT", 5, "", "AT25", 1)
{
    External (_SB_.PCI0.SPI2, DeviceObj)

    Scope (\_SB.PCI0.SPI2)
    {
        Device (EEP0) {
            Name (_HID, "PRP0001")
            Name (_DDN, "Atmel AT25 compatible EEPROM")
            Name (_CRS, ResourceTemplate () {
                SpiSerialBus (
                    0,                      // Chip select
                    PolarityLow,            // Chip select is active low
                    FourWireMode,           // Full duplex
                    8,                      // Bits per word is 8 (byte)
                    ControllerInitiated,    // Don't care
                    1000000,                // 1 MHz
                    ClockPolarityLow,       // SPI mode 0
                    ClockPhaseFirst,        // SPI mode 0
                    "\\_SB.PCI0.SPI2",      // SPI host controller
                    0                       // Must be 0
                )
            })

            /*
             * See Documentation/devicetree/bindings/eeprom/at25.txt for
             * more information about these bindings.
             */
            Name (_DSD, Package () {
                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () {"compatible", Package () {"atmel,at25"}},
                    Package () {"size", 1024},
                    Package () {"pagesize", 32},
                    Package () {"address-width", 16},
                }
            })
        }
    }
}
