/*
 * Intel Edison
 *
 * Provides support for Microchip MRF24J40 IEEE 802.15.4 2.4 GHz transceiver
 * on Intel Edison/Arduino board.
 */
DefinitionBlock ("mrf24j40.aml", "SSDT", 5, "", "MRF24J40", 1)
{
    #define MUX_SPI

#define DIG7_PU_PD_HOG	Name (RFPU, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 7, 0 } }, Package () { "output-high", 1 }, Package () { "line-name", "mrf24j40-pu" }, } })
#define DIG7_PU_PD_REF	Package () { "mrf24j40-pu", "RFPU" },
#define CONF_DIG7_PU_PD

#define MUX32_DIR_HOG	Name (RFMX, Package () { ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"), Package () { Package () { "gpio-hog", 1 }, Package () { "gpios", Package () { 7, 0 } }, Package () { "output-low", 1 }, Package () { "line-name", "mrf24j40-mux" }, } })
#define MUX32_DIR_REF	Package () { "mrf24j40-mux", "RFMX" },
#define CONF_MUX32_DIR

    #include "arduino.asli"
    #include "mrf24j40.asli"
}
