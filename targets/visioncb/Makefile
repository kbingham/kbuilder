BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

-include packages/*

dtb: linux-dtbs

all: dtb linux

tftp-visioncb8m: $(BOOTSCRIPT) $(LINUX_IMAGE)

to-debix: linux
	scp $(LINUX_IMAGE) user@debix.lab.linuxembedded.co.uk:/tmp/
	ssh user@debix.lab.linuxembedded.co.uk -tC "sudo mv /tmp/Image /boot/; sudo reboot"

boot-notes:
	@echo "	setenv ethaddr ce:1f:45:14:74:5c; dhcp && source"


visioncb8m-on: boot-notes

vision: linux tftp-visioncb8m visioncb8m-reboot

SPACE_DTB=$(LINUX_BUILD)/arch/arm64/boot/dts/freescale/spacesom-8mplus-cb-adv.dtb

tftp-spacecb: bootcmd.spacecb.scr $(LINUX_IMAGE) $(SPACE_DTB)

$(eval $(call fram,visioncb8m,visioncb8m@lab.linuxembedded.co.uk))
$(eval $(call fram,spacecb,spacecb@lab.linuxembedded.co.uk))
$(eval $(call fram,debix,debix@lab.linuxembedded.co.uk))
