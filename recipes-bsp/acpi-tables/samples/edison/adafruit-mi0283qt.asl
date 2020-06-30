/*
 * Intel Edison
 *
 * Provides support for Adafruit 2.8" TFT display with capacitive
 * touchscreen and micro-SD card slot on Intel Edison/Arduino board.
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
DefinitionBlock ("mi0283qt.aml", "SSDT", 5, "", "MI0283QT", 1)
{
    #define MUX_I2C
    #define MUX_SPI

#define DIG7_PU_PD_HOG	Name (TSPU, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 7, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "touchscreen-pu" }, } })
#define DIG7_PU_PD_REF	Package () { "touchscreen-pu", "TSPU" },
#define CONF_DIG7_PU_PD

#define MUX32_DIR_HOG	Name (TSMX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 7, 0 } }, Package () { "output-low", 1 }, Package () { "line-name", "touchscreen-mux" }, } })
#define MUX32_DIR_REF	Package () { "touchscreen-mux", "TSMX" },
#define CONF_MUX32_DIR

#define MUX21_DIR_HOG	Name (BLMX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 5, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "backlight-mux" }, } })
#define MUX21_DIR_REF	Package () { "backlight-mux", "BLMX" },
#define CONF_MUX21_DIR

#define MUX28_DIR_HOG	Name (DCMX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 9, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "data-cmd-mux" }, } })
#define MUX28_DIR_REF	Package () { "data-cmd-mux", "DCMX" },
#define CONF_MUX28_DIR

    #include "arduino.asli"
    #include "mi0283qt.asli"
    #include "ft6236.asli"
}
