/*
 * Intel Joule
 *
 * This adds Intersil isl29125 RGB color sensor to the
 * I2C2 bus available on Intel Joule Gumstix Sensor board
 *
 */
DefinitionBlock ("isl.aml", "SSDT", 5, "", "ADC", 1)
{
    External (\_SB_.PCI0.I2C2, DeviceObj)

    Scope (\_SB.PCI0.I2C2)
    {
        Device (RGB)
        {
            Name (_HID, "PRP0001")
            Name (_DDN, "Intersil ISL29125 Color Sensor")
            Name (_CRS, ResourceTemplate () {
                I2cSerialBus (
                    0x44,                   // Bus address
                    ControllerInitiated,    // Don't care
                    400000,                 // Fast mode (400 kHz)
                    AddressingMode7Bit,     // 7-bit addressing
                    "\\_SB.PCI0.I2C2",      // I2C host controller
                    0                       // Must be 0
                )
            })

			Name (_DSD, Package () {
				ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
				Package () {
					Package () {"compatible", "isil,isl29125"},
				}
			})
        }
    }
}
