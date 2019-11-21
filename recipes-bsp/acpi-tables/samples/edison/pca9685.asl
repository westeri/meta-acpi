/*
 * Intel Edison
 *
 * This adds NXP PCA9685 16-channel 12-bit PWM to the first I2C bus available
 * on Intel Edison.
 *
 * In Linux you need to set CONFIG_PWM_PCA9685=y (or m) to be able to use
 * this device.
 *
 * Copyright (C) 2019, Intel Corporation
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
DefinitionBlock ("pca9685.aml", "SSDT", 5, "", "PCA9685", 1)
{
    External (\_SB.PCI0.I2C1, DeviceObj)

    Scope (\_SB.PCI0.I2C1)
    {
        Device (PWM1)
        {
            Name (_HID, "INT3492")
            Name (_DDN, "NXP PCA9685 16-channel 12-bit PWM")
            Name (_CRS, ResourceTemplate () {
                I2cSerialBus (
                    0x40,                   // Bus address
                    ControllerInitiated,    // Don't care
                    400000,                 // 400 kHz
                    AddressingMode7Bit,     // 7-bit addressing
                    "\\_SB.PCI0.I2C1",      // I2C host controller
                    0                       // Must be 0
                )
            })
        }
    }
}
