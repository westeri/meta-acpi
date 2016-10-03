PREFERRED_PROVIDER_virtual/kernel ?= "linux-kernel"
# EFI capable systems do not require any special boot loader
#EFI_PROVIDER ?= ""

# Include additional ACPI tables with the initrd
EXTRA_IMAGEDEPENDS_append = " acpi-tables"
INITRD_LIVE_prepend = "${DEPLOY_DIR_IMAGE}/acpi-tables.cpio "

IMAGE_INSTALL_append = " acpidump"
