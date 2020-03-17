/*
 * Intel Edison
 *
 * Provides support for Bosch Sensortec BMP085 pressure and temperature sensor
 * on Intel Edison/Arduino board.
 *
 * Copyright (C) 2020, Intel Corporation
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
DefinitionBlock ("bmp085.aml", "SSDT", 5, "", "BMP085", 1)
{
    #define MUX_I2C

#define DIG5_PU_PD_HOG	Name (PSPU, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 5, 0 } }, Package () { "input", 1 }, Package () { "line-name", "pressure-sensor-pu" }, } })
#define DIG5_PU_PD_REF	Package () { "pressure-sensor-pu", "PSPU" },
#define CONF_DIG5_PU_PD

#define MUX19_DIR_HOG	Name (PSMX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 6, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "pressure-sensor-mux" }, } })
#define MUX19_DIR_REF	Package () { "pressure-sensor-mux", "PSMX" },
#define CONF_MUX19_DIR

    #include "arduino.asli"
    #include "bmp085.asli"
}

