/*
 * Intel Edison
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
DefinitionBlock ("hd44780.aml", "SSDT", 5, "", "HD44780", 1)
{
    #define MUX_I2C
    #define MUX_SPI

#define MUX33_DIR_HOG	Name (D7MX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 0, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "LCD-data7-mux" }, } })
#define MUX33_DIR_REF	Package () { "LCD-data7-mux", "D7MX" },
#define CONF_MUX33_DIR

#define MUX31_DIR_HOG	Name (D6MX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 1, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "LCD-data6-mux" }, } })
#define MUX31_DIR_REF	Package () { "LCD-data6-mux", "D6MX" },
#define CONF_MUX31_DIR

#define MUX29_DIR_HOG	Name (D5MX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 2, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "LCD-data5-mux" }, } })
#define MUX29_DIR_REF	Package () { "LCD-data5-mux", "D5MX" },
#define CONF_MUX29_DIR

#define MUX24_DIR_HOG	Name (D4MX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 4, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "LCD-data4-mux" }, } })
#define MUX24_DIR_REF	Package () { "LCD-data4-mux", "D4MX" },
#define CONF_MUX24_DIR

#define MUX21_DIR_HOG	Name (LEMX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 5, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "LCD-ena-mux" }, } })
#define MUX21_DIR_REF	Package () { "LCD-ena-mux", "LEMX" },
#define CONF_MUX21_DIR

#define MUX27_DIR_HOG	Name (RSMX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 3, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "LCD-rs-mux" }, } })
#define MUX27_DIR_REF	Package () { "LCD-rs-mux", "RSMX" },
#define CONF_MUX27_DIR

    #include "arduino.asli"
    #include "hd44780.asli"
}
