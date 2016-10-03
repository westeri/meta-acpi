SUMMARY = "Tianocore EDK2 UEFI Shell"
HOMEPAGE = "http://www.tianocore.org/edk2"

LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://License.txt;md5=ffd52cf9a8e0e036b9a61a0de2dc87ed"

inherit deploy

PV = "UDK2015"
EDK2_SHELL_URI = "https://svn.code.sf.net/p/edk2/code/branches/${PV}/EdkShellBinPkg"

SRC_URI = " \
  ${EDK2_SHELL_URI}/MinimumShell/Ia32/Shell.efi;md5sum=5feefd49ef93746711b77dc9feb40007;downloadfilename=Shell32.efi \
  ${EDK2_SHELL_URI}/MinimumShell/X64/Shell.efi;md5sum=f5c3c2c7d3c12e6b03b72a13dc514c4f;downloadfilename=Shell64.efi \
  ${EDK2_SHELL_URI}/License.txt;md5sum=ffd52cf9a8e0e036b9a61a0de2dc87ed \
  "
S = "${WORKDIR}"

do_deploy () {
        install ${B}/Shell*.efi ${DEPLOYDIR}
}
addtask deploy before do_build after do_compile
