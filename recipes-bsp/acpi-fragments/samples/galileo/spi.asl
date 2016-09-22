/*
 * Intel Galileo
 *
 * This configures the Quark SPI host controller to use pin II10/SS as
 * GPIO chip select.
 *
 * Include this from each SPI device using the SPI host controller.
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
External (_SB_.PCI0.SPI1, DeviceObj)
External (_SB_.PCI0.GIP0.GPO, DeviceObj)

Scope (\_SB.PCI0.SPI1)
{
    Name (_CRS, ResourceTemplate () {
        GpioIo (Exclusive, PullUp, 0, 0, IoRestrictionOutputOnly,
                "\\_SB.PCI0.GIP0.GPO", 0) {2} // MUX6_IO
    })

    /*
     * See Documentation/acpi/gpio-properties.txt for more information
     * about GPIO bindings.
     */
    Name (_DSD, Package () {
        ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
        Package () {
            Package () {
                "cs-gpios", Package () {^SPI1, 0, 0, 0},
            },
        }
    })
}
