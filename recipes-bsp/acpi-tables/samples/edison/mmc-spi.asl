/*
 * Intel Edison
 *
 * Provides support for MMC SPI slot on Intel Edison/Arduino board.
 */
DefinitionBlock ("mmc-spi.aml", "SSDT", 5, "", "MMC-SPI", 1)
{
    #define MUX_SPI

    #include "arduino.asli"
    #include "mmc-spi.asli"
}
