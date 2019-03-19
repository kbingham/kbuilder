BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

-include packages/*

dtb: linux-dtbs

all: dtb linux

TFTP_SERVER:=pi.nakedgeek.co.uk:/srv/tftp/

rpi: linux-package
	scp linux-package.tgz pi@rpi:/tmp/
	ssh pi@rpi -tC "cd / && sudo tar --no-same-owner -xf /tmp/linux-package.tgz && sudo mv /boot/zImage /boot/kernel7.img"
	ssh pi@rpi -tC "sudo reboot"
	
