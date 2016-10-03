PREFERRED_PROVIDER_virtual/kernel ?= "linux-kernel"
# EFI capable systems do not require any special boot loader
#EFI_PROVIDER ?= ""

# Include ACPI ASL fragments with the initrd
EXTRA_IMAGEDEPENDS_append = " acpi-fragments"
INITRD_LIVE_prepend = "${DEPLOY_DIR_IMAGE}/acpi-fragments.cpio "

IMAGE_INSTALL_append = " acpidump"
