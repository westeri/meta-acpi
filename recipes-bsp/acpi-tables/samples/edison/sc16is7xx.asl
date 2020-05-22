/*
 * Intel Edison
 *
 * This adds NXP SC16IS7XX I2C-UART converter to the
 * I2C#6  bus available on Intel Edison:
 *
 *   pin name           pin number
 *   -----------------------------
 *   I2C_6_SDA       112
 *   I2C_6_SCL       111
 *
 * In Linux you need to set CONFIG_SERIAL_SC16IS7XX_CORE=y (or m) to be able to use
 * this device.
 *
 * Copyright (C) 2018, Emlid Limited
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
DefinitionBlock ("serial.aml", "SSDT", 5, "", "SERIAL", 1)
{
    External (\_SB.PCI0.I2C6, DeviceObj)

    Scope (\_SB.PCI0.I2C6)
    {
        Device (SER)
        {
            Name (_HID, "PRP0001")
            Name (_DDN, "SC16IS7XX I2C-SERIAL")
            Name (_CRS, ResourceTemplate () {
                I2cSerialBus (
                    0x4d,                   // Bus address
                    ControllerInitiated,    // Don't care
                    400000,                 // 400 kHz
                    AddressingMode7Bit,     // 7-bit addressing
                    "\\_SB.PCI0.I2C6",      // I2C host controller
                    0                       // Must be 0
                )

                GpioInt(Level, ActiveLow, Exclusive, PullDefault, 0x0000,
                        "\\_SB.PCI0.GPIO", 0x00, ResourceConsumer, , ) { 15 }

            })

            Name (_DSD, Package () {
                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "compatible", Package () { "nxp,sc16is750" } },
                    Package () { "clock-frequency", 14745600 },
                }
            })
        }
    }
}
