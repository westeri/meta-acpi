SUMMARY = "ACPICA tools for the development and debug of ACPI tables"
HOMEPAGE = "https://www.acpica.org/"
DEPENDS = "bison-native flex-native"

LICENSE = "GPLv2 | BSD"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD;md5=3775480a712fc46a69647678acb234cb"

SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz"
SRC_URI[md5sum] = "e995cb7856473afe3bba1514d363a577"
SRC_URI[sha256sum] = "1e4cfdb27792329e0eda6880b7cec0af542e6de33d0719f3448b13e0411ee4b1"

INSANE_SKIP_${PN} += "already-stripped"

S = "${WORKDIR}/${BPN}-unix2-${PV}"

EXTRA_OEMAKE = "'CC=${CC}' 'OPT_CFLAGS=${CFLAGS}'"

do_install () {
	oe_runmake install INSTALLDIR=${STAGING_BINDIR}
}

BBCLASSEXTEND = "native"
