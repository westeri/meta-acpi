SUMMARY = "JavaScript runtime"
HOMEPAGE = "http://nodejs.org"
DESCRIPTION = "Node.js is a platform built on Chrome's JavaScript runtime for easily building fast, scalable network applications. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient, perfect for data-intensive real-time applications that run across distributed" 
#DEPENDS = "bison-native flex-native"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENCE;md5=8e3c01094f0fcb889b13f0354e52f914"

SRC_URI = "https://nodejs.org/dist/v4.5.0/node-v4.5.0.tar.gz"
SRC_URI[sha256sum] = "74ced83b8d890d90e2a8b0d54b0d0e9b5e01d6fd6148cec6e9911ff6eaf0cf21"

#EXTRA_OEMAKE = "'CC=${CC}' 'OPT_CFLAGS=${CFLAGS}'"
