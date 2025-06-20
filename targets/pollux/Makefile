BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

-include packages/*

dtb: $(DTB)

all: dtb linux

%.scr: %
	mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
		-n 'Execute uImage.bin' -d $^ $@

$(eval $(call fram,pollux,pollux@lab.linuxembedded.co.uk))
$(eval $(call fram,kastor,kastor@lab.linuxembedded.co.uk))
$(eval $(call fram,blubbel,blubbel@lab.linuxembedded.co.uk))

blubbel: blubbel.dtb

LINUX_DTBS+=blubbel.dtb

tftp-pollux: $(LINUX_IMAGES) $(LINUX_DTBS) bootcmd.scr
tftp-kastor: $(LINUX_IMAGES) $(LINUX_DTBS) bootcmd.kastor.scr
tftp-blubbel: $(LINUX_IMAGES) $(LINUX_DTBS) bootcmd.blubbel.scr
