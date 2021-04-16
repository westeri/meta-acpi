/*
 * Intel Edison
 *
 * This adds STMicro LSM9DS0 9DOF to the I2C1 bus available
 * on Intel Edison header.
 *
 * In Linux you need to set CONFIG_IIO_ST_GYRO_3AXIS=y (or m) and
 * CONFIG_IIO_ST_LSM9DS0=y (or m) to be able to use this device.
 */
DefinitionBlock ("lsm9ds0.aml", "SSDT", 5, "", "LSM9DS0", 1)
{
    #include "lsm9ds0.asli"
}
