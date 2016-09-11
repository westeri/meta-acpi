SUMMARY = "Additional ACPI fragments to be included with the image"
DESCRIPTION = "This will generate an initrd including ACPI ASL fragments\
 specified in ACPI_FRAGMENTS variable. The kernel looks for these\
 fragments and if found, loads and parses them. This is useful if\
 you want to add new devices to buses like I2C and SPI but not limited\
 to that."

LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD;md5=3775480a712fc46a69647678acb234cb"

DEPENDS = "acpica-native"

inherit deploy

ACPI_FRAGMENTS ?= ""
ACPI_FRAGMENTS[doc] = "List of ACPI fragments to include with the initrd"

do_compile() {
	# Always clean up the existing fragments
	rm -fr ${WORKDIR}/acpi-fragments/kernel
	install -d ${WORKDIR}/acpi-fragments/kernel/firmware/acpi

	for table in ${ACPI_FRAGMENTS}; do
		# If relative path is given use sample tables if
		# available for the machine in question.
		d=$(dirname $table)
		if [ "$d" = "." ]; then
			table="${THISDIR}/samples/${MACHINE}/$table"
		fi

		[ -f "$table" ] || continue

		dest_table=$(basename $table)
		bbdebug 1 "Including ACPI ASL fragment: ${table}"
		iasl -p ${WORKDIR}/acpi-fragments/kernel/firmware/acpi/$dest_table $table
	done
}

do_deploy() {
	cd ${WORKDIR}/acpi-fragments
	find kernel | cpio -H newc -o > ${DEPLOYDIR}/acpi-fragments.cpio
}

addtask deploy before do_build after do_compile
