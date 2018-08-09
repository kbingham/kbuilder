BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

-include packages/*

all: linux-nanopi4-images

nanopi4-images: linux-nanopi4-images
nanodtb: rockchip/rk3399-nanopi4-rev00.dtb

RESOURCE_IMG=$(shell realpath --relative-to=. $(LINUX_BUILD)/resource.img)
KERNEL_IMG=$(shell realpath --relative-to=. $(LINUX_BUILD)/kernel.img)

flash-resource.img:
	sudo bin/upgrade_tool di resource $(RESOURCE_IMG)

flash-kernel.img:
	sudo bin/upgrade_tool di kernel $(KERNEL_IMG)

flash-reboot:
	sudo bin/upgrade_tool RD


flash-kernel: nanopi4-images flash-kernel.img flash-reboot
flash-dtb: nanopi4-images flash-resource.img flash-reboot
flash-all: nanopi4-images flash-resource.img flash-kernel.img flash-reboot
