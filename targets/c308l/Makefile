BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

ARCH:=aarch64
SUBARCH:=armv8
LINUX_DEFAULT_TARGET=linux-Image.gz

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

dtb: amlogic/amlogic-c3-c308l-aw419.dtb
all: dtb linux

$(eval $(call fram,c308,c308@lab.linuxembedded.co.uk))

bootcmd.c308.scr: bootcmd.c308
	mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
		-n 'Execute uImage.bin' -d $^ $@
	rsync $@ c308@lab.linuxembedded.co.uk:bootcmd.scr
