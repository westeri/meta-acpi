/*
 * Intel Joule
 *
 * This adds Aosong AM2315 temperature and humidity sensor to the
 * first I2C bus available on Intel Joule breakout #1 header:
 *
 *   pin name           pin number
 *   -----------------------------
 *   I2C_0_SDA_LS       11
 *   I2C_0_SCL_LS       13
 *
 * In Linux you need to set CONFIG_AM2315=y (or m) to be able to use
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
DefinitionBlock ("adc.aml", "SSDT", 5, "", "ADC", 1)
{
    External (_SB_.PCI0.I2C1, DeviceObj)

    Scope (\_SB.PCI0.I2C1)
    {
        Device (TEMP)
        {
            Name (_HID, "AOS2315")
            Name (_DDN, "Aosong AM2315 Temperature & Humidity sensor")
            Name (_CRS, ResourceTemplate () {
                I2cSerialBus (
                    0x5c,                   // Bus address
                    ControllerInitiated,    // Don't care
                    400000,                 // Fast mode (400 kHz)
                    AddressingMode7Bit,     // 7-bit addressing
                    "\\_SB.PCI0.I2C1",      // I2C host controller
                    0                       // Must be 0
                )
            })
        }
    }
}
