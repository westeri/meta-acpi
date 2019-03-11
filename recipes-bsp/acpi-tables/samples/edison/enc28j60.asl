/*
 * Intel Edison
 *
 * Provides support for Microchip ENC28J60 ethernet on Intel Edison/Arduino
 * board.
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
DefinitionBlock ("enc28j60.aml", "SSDT", 5, "", "ENC28J60", 1)
{
    #define MUX_SPI

#define DIG7_PU_PD_HOG	Name (ETPU, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 7, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "eth-pu" }, } })
#define DIG7_PU_PD_REF	Package () { "eth-pu", "ETPU" },
#define CONF_DIG7_PU_PD

#define MUX32_DIR_HOG	Name (ETMX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 7, 0 } }, Package () { "output-low", 1 }, Package () { "line-name", "eth-mux" }, } })
#define MUX32_DIR_REF	Package () { "eth-mux", "ETMX" },
#define CONF_MUX32_DIR

    #include "arduino.asli"
    #include "enc28j60.asli"
}
