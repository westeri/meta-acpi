/*
 * Intel Edison
 *
 * This adds Himax HX8347d 2.8" TFT display to the GPIOs available
 * on Intel Edison/Arduino header.
 *
 * In Linux you need to set CONFIG_FB_TFT_HX8347D=y (or m) to be able to use
 * this device.
 *
 * Note, due to Edison/Arduino hardware limitations and specifics of Linux
 * kernel fbtft framework the display works only in output mode. It means
 * there is no support for resistive touchscreen.
 *
 * TODO: SD card support is under (slow) development, though.
 */
DefinitionBlock ("hx8347d.aml", "SSDT", 5, "", "HX8347D", 1)
{
    #define MUX_UART_2WIRE
    #define MUX_SPI

#define MUX30_DIR_HOG	Name (D0MX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 8, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "TFT-data0-mux" }, } })
#define MUX30_DIR_REF	Package () { "TFT-data0-mux", "D0MX" },
#define CONF_MUX30_DIR

#define MUX28_DIR_HOG	Name (D1MX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 9, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "TFT-data1-mux" }, } })
#define MUX28_DIR_REF	Package () { "TFT-data1-mux", "D1MX" },
#define CONF_MUX28_DIR

#define MUX29_DIR_HOG	Name (D2MX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 2, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "TFT-data2-mux" }, } })
#define MUX29_DIR_REF	Package () { "TFT-data2-mux", "D2MX" },
#define CONF_MUX29_DIR

#define MUX27_DIR_HOG	Name (D3MX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 3, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "TFT-data3-mux" }, } })
#define MUX27_DIR_REF	Package () { "TFT-data3-mux", "D3MX" },
#define CONF_MUX27_DIR

#define MUX24_DIR_HOG	Name (D4MX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 4, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "TFT-data4-mux" }, } })
#define MUX24_DIR_REF	Package () { "TFT-data4-mux", "D4MX" },
#define CONF_MUX24_DIR

#define MUX21_DIR_HOG	Name (D5MX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 5, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "TFT-data5-mux" }, } })
#define MUX21_DIR_REF	Package () { "TFT-data5-mux", "D5MX" },
#define CONF_MUX21_DIR

#define MUX19_DIR_HOG	Name (D6MX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 6, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "TFT-data6-mux" }, } })
#define MUX19_DIR_REF	Package () { "TFT-data6-mux", "D6MX" },
#define CONF_MUX19_DIR

#define MUX32_DIR_HOG	Name (D7MX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 7, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "TFT-data7-mux" }, } })
#define MUX32_DIR_REF	Package () { "TFT-data7-mux", "D7MX" },
#define CONF_MUX32_DIR

#define MUX15_DIR_HOG	Name (RDMX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 0, 0 } }, Package () { "output-low", 1 }, Package () { "line-name", "TFT-rd-mux" }, } })
#define MUX15_DIR_REF	Package () { "TFT-rd-mux", "RDMX" },
#define CONF_MUX15_DIR
#define MUX14_DIR_HOG	Name (RDOE, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 0, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "TFT-rd-oe" }, } })
#define MUX14_DIR_REF	Package () { "TFT-rd-oe", "RDOE" },
#define CONF_MUX14_DIR

#define MUX13_DIR_HOG	Name (WRMX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 1, 0 } }, Package () { "output-low", 1 }, Package () { "line-name", "TFT-wr-mux" }, } })
#define MUX13_DIR_REF	Package () { "TFT-wr-mux", "WRMX" },
#define CONF_MUX13_DIR
#define MUX12_DIR_HOG	Name (WROE, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 1, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "TFT-wr-oe" }, } })
#define MUX12_DIR_REF	Package () { "TFT-wr-oe", "WROE" },
#define CONF_MUX12_DIR

#define MUX11_DIR_HOG	Name (RSMX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 2, 0 } }, Package () { "output-low", 1 }, Package () { "line-name", "TFT-rs-mux" }, } })
#define MUX11_DIR_REF	Package () { "TFT-rs-mux", "RSMX" },
#define CONF_MUX11_DIR
#define MUX10_DIR_HOG	Name (RSOE, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 2, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "TFT-rs-oe" }, } })
#define MUX10_DIR_REF	Package () { "TFT-rs-oe", "RSOE" },
#define CONF_MUX10_DIR

#define MUX9_DIR_HOG	Name (CSMX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 3, 0 } }, Package () { "output-low", 1 }, Package () { "line-name", "TFT-cs-mux" }, } })
#define MUX9_DIR_REF	Package () { "TFT-cs-mux", "CSMX" },
#define CONF_MUX9_DIR
#define MUX8_DIR_HOG	Name (CSOE, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 3, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "TFT-cs-oe" }, } })
#define MUX8_DIR_REF	Package () { "TFT-cs-oe", "CSOE" },
#define CONF_MUX8_DIR

#define MUX7_DIR_HOG	Name (REMX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 4, 0 } }, Package () { "output-low", 1 }, Package () { "line-name", "TFT-reset-mux" }, } })
#define MUX7_DIR_REF	Package () { "TFT-reset-mux", "REMX" },
#define CONF_MUX7_DIR
#define MUX6_DIR_HOG	Name (REOE, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 4, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "TFT-reset-oe" }, } })
#define MUX6_DIR_REF	Package () { "TFT-reset-oe", "REOE" },
#define CONF_MUX6_DIR

    #include "arduino.asli"
    #include "hx8347d.asli"
}
