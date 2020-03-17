/*
 * Intel Edison
 *
 * Provides support for SSD1331 96x64 display device, 0.95inch, 65535 color
 * OLED on Intel Edison/Arduino board.
 */
DefinitionBlock ("ssd1331.aml", "SSDT", 5, "", "SSD1331", 1)
{
    #define MUX_SPI

#define DIG7_PU_PD_HOG	Name (REPU, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 7, 0 } }, Package () { "input", 1 }, Package () { "line-name", "CLED-reset-pu" }, } })
#define DIG7_PU_PD_REF	Package () { "CLED-reset-pu", "REPU" },
#define CONF_DIG7_PU_PD

#define MUX32_DIR_HOG	Name (REMX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 7, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "CLED-reset-mux" }, } })
#define MUX32_DIR_REF	Package () { "CLED-reset-mux", "REMX" },
#define CONF_MUX32_DIR

#define DIG8_PU_PD_HOG  Name (DCPU, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 8, 0 } }, Package () { "input", 1 }, Package () { "line-name", "CLED-dc-pu" }, } })
#define DIG8_PU_PD_REF  Package () { "CLED-dc-pu", "DCPU" },
#define CONF_DIG8_PU_PD

#define MUX30_DIR_HOG	Name (DCMX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 8, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "CLED-dc-mux" }, } })
#define MUX30_DIR_REF	Package () { "CLED-dc-mux", "DCMX" },
#define CONF_MUX30_DIR

   #include "arduino.asli"
   #include "ssd1331.asli"
}
