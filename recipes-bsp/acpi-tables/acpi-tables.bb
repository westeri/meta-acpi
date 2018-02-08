SUMMARY = "Additional ACPI tables to be included with the image"
DESCRIPTION = "This will generate an initrd including ACPI tables\
 specified in ACPI_TABLES variable. The kernel looks for these\
 tables and if found, loads and parses them. This is useful if\
 you want to add new devices to buses like I2C and SPI but not limited\
 to that."

LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD;md5=3775480a712fc46a69647678acb234cb"

DEPENDS = "acpica-native"

FILESEXTRAPATHS_prepend := "${THISDIR}/files/${BPN}:"

SRC_URI = "\
	file://acpi-tables-load.service \
	file://acpi-tables-load \
"

B = "${WORKDIR}/acpi-tables"

inherit deploy

RDEPENDS_${PN}_edison = "libgpiod"

ACPI_TABLES ?= ""
ACPI_TABLES[doc] = "List of ACPI tables to include with the initrd"
ACPI_FEATURES_edison ?= "uart_2w spi i2c"
IASLFLAGS = " \
    ${@bb.utils.contains('ACPI_FEATURES', 'uart_2w', '-DMUX_UART_2WIRE', '', d)} \
    ${@bb.utils.contains('ACPI_FEATURES', 'uart_4w', '-DMUX_UART_4WIRE', '', d)} \
    ${@bb.utils.contains('ACPI_FEATURES', 'i2c', '-DMUX_I2C', '', d)} \
    ${@bb.utils.contains('ACPI_FEATURES', 'spi', '-DMUX_SPI', '', d)} \
    ${@bb.utils.contains('ACPI_FEATURES', 'uart0', '-DMUX_UART0', '', d)} \
"

do_compile() {
	# Always clean up the existing tables
	rm -fr ${WORKDIR}/acpi-tables/kernel
	install -d ${WORKDIR}/acpi-tables/kernel/firmware/acpi

	for table in ${ACPI_TABLES}; do
		# If relative path is given use sample tables if
		# available for the machine in question.
		d=$(dirname $table)
		if [ "$d" = "." ]; then
			table="${THISDIR}/samples/${MACHINE}/$table"
		fi

		[ -f "$table" ] || continue

		dest_table=$(basename $table)
		bbdebug 1 "Including ACPI table: ${table}"
		bbdebug 1 "Setting iasl compiler defines: ${IASLFLAGS}"
		iasl ${IASLFLAGS} -p ${WORKDIR}/acpi-tables/kernel/firmware/acpi/$dest_table $table
	done
}

do_install() {

	install -d ${D}/kernel/firmware/acpi
	for table in ${ACPI_TABLES}; do
		dest_table=$(basename $table .asl)
		install -m 644 ${B}/kernel/firmware/acpi/${dest_table}.aml ${D}/kernel/firmware/acpi/${dest_table}.aml
	done
	install -d ${D}${bindir}
	install -m 0755 ${WORKDIR}/acpi-tables-load ${D}${bindir}
	install -d ${D}/${systemd_unitdir}/system
        install -m 644 ${WORKDIR}/acpi-tables-load.service ${D}/${systemd_unitdir}/system

}

FILES_${PN} = "/kernel/firmware/acpi"
FILES_${PN} += "${systemd_unitdir}/system/*"
FILES_${PN} += "${bindir}/*"

do_deploy() {
	cd ${WORKDIR}/acpi-tables
	find kernel | cpio -H newc -o > ${DEPLOYDIR}/acpi-tables.cpio
}
addtask deploy before do_build after do_compile
