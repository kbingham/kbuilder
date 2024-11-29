BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

-include packages/*

$(eval $(call power,energenie-power.banoffee,rpi))
$(eval $(call power,energenie-power.banoffee,earth))
$(eval $(call power,energenie-power.banoffee,venus))

$(eval $(call fram,beehive,beehive@lab.linuxembedded.co.uk))

dtb: linux-dtbs

all: dtb linux

TFTP_SERVER:=pi.nakedgeek.co.uk:/srv/tftp/

F=/boot/config.txt
K=Image
rpi-configure-config.txt:
	ssh rpi -tC \
		"if (grep -sq kernel $F);\
		 then \
			sudo sed -i 's/kernel=.*/kernel=$K/' $F; \
		 else \
			echo kernel=$K | sudo tee -a $F; \
		 fi"

rpi: linux-package rpi-install-kernel-package #rpi-configure-config.txt

rpi-install-kernel-package:
	scp linux-package.tgz rpi:/tmp/
	ssh rpi -tC "cd / && sudo tar --no-same-owner -xf /tmp/linux-package.tgz"
	-ssh rpi -tC "sudo reboot"

rpi-libcamera: libcamera libcamera-package
	scp libcamera.tgz rpi:/tmp/
	ssh rpi -tC "sudo tar xfv /tmp/libcamera.tgz -C /"

rpi-libcamera-native:
	rsync -arv --exclude build* $(libcamera_SRC) rpi:
	

venus mercury earth: linux-package
	echo $@
	scp linux-package.tgz $@:/tmp/
	ssh $@ -tC "cd / && sudo tar --keep-directory-symlink --no-same-owner -xhf /tmp/linux-package.tgz"
	-ssh $@ -tC "sudo reboot"


beehive: linux-package
	echo $@
	scp $(LINUX_PACKAGE_TGZ) $@:/tmp/
	ssh $@ -tC "cd / && sudo tar --keep-directory-symlink --no-same-owner -xhf /tmp/$(LINUX_PACKAGE_TGZ)"
	-ssh $@ -tC "sudo reboot"


off:
	energenie-power.banoffee rpi off

on:
	energenie-power.banoffee rpi on

serial:
	serial rpi
