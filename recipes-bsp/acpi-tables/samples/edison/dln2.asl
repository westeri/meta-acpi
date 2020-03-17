/*
 * Intel Edison
 *
 * This adds Diolan DLN-2 USB interface adapter to the high speed port
 * available on Intel Edison header.
 *
 * In Linux you need to set CONFIG_MFD_DLN2=y (or m) and at least
 * one of the CONFIG_GPIO_DLN2=y (or m), CONFIG_I2C_DLN2=y (or m),
 * and CONFIG_SPI_DLN2=y (or m) to be able to use this device.
 *
 * Additionally you may enable ADC with CONFIG_DLN2_ADC=y (or m).
 */
DefinitionBlock ("dln2.aml", "SSDT", 5, "", "DLN2", 1)
{
    External (\_SB.PCI0.DWC3.RHUB.HS01, DeviceObj)
    External (\_SB.PCI0.DWC3.RHUB.GPLD, MethodObj)

    /*
     * We set the port to hard wired state to get the connected device
     * enumerated properly. See more details here:
     * https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/other-acpi-namespace-objects#acpi-namespace-hierarchy-and-_adr-for-embedded-usb-devices
     */

    Scope (\_SB.PCI0.DWC3.RHUB.HS01)
    {
        Name (_UPC, Package ()
        {
            0xFF,
            0xFF,
            Zero,
            Zero,
        })

        Method (_PLD, 0, NotSerialized)
        {
                Return (GPLD (Zero))
        }

        Device (GPIO)
        {
            Name (_ADR, Zero)
            Name (_STA, 0x0F)
        }

        Device (I2C)
        {
            Name (_ADR, One)
            Name (_STA, 0x0F)
        }

        Device (SPI)
        {
            Name (_ADR, 0x02)
            Name (_STA, 0x0F)
        }
    }
}
