# ACPI table upgrade was introduced in v4.6
PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto-dev"

# Include ACPI ASL fragments with the initrd
EXTRA_IMAGEDEPENDS_append = " acpi-fragments"
INITRD_LIVE_prepend = "${DEPLOY_DIR_IMAGE}/acpi-fragments.cpio "

IMAGE_INSTALL_append = " acpidump"
