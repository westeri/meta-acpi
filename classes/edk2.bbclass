# Released under the MIT license (see COPYING.MIT)

# gummiboot.bbclass - equivalent of grub-efi.bbclass
# Set EFI_PROVIDER = "edk2" to use edk2 on your live images instead of grub-efi
# (images built by image-live.bbclass or image-vm.bbclass)

do_bootimg[depends] += "${MLPREFIX}edk2:do_deploy"
do_bootdirectdisk[depends] += "${MLPREFIX}edk2:do_deploy"

EFIDIR = "/EFI/BOOT"

efi_populate() {
        DEST=$1

        EFI_IMAGE="Shell32.efi"
        DEST_EFI_IMAGE="bootia32.efi"
        if [ "${TARGET_ARCH}" = "x86_64" ]; then
            EFI_IMAGE="Shell64.efi"
            DEST_EFI_IMAGE="bootx64.efi"
        fi

        install -d ${DEST}${EFIDIR}
        install -m 0644 ${DEPLOY_DIR_IMAGE}/${EFI_IMAGE} ${DEST}${EFIDIR}/${DEST_EFI_IMAGE}

	# The EDK2 shell expects the binary name ends with .efi
	cp ${DEST}/vmlinuz ${DEST}/vmlinuz.efi

	echo "vmlinuz.efi initrd=initrd${APPEND}" > ${DEST}/startup.nsh
}

efi_iso_populate() {
        iso_dir=$1
        efi_populate $iso_dir
        mkdir -p ${EFIIMGDIR}/${EFIDIR}
        cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
        cp $iso_dir/vmlinuz ${EFIIMGDIR}
        if [ -f "$iso_dir/initrd" ] ; then
            cp $iso_dir/initrd ${EFIIMGDIR}
        fi
}

efi_hddimg_populate() {
        efi_populate $1
}

python build_efi_cfg() {
        pass
}
