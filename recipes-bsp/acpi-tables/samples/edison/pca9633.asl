/*
 * Intel Edison
 *
 * NXP PCA9633 LED controller.
 *
 * In Linux you need to set CONFIG_LEDS_PCA963X=y (or m)
 * to be able to use this device.
 */
DefinitionBlock ("pca9633.aml", "SSDT", 5, "", "PCA9633", 1)
{
    #include "pca9633.asli"
}
