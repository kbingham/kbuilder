BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

./vmlinux:
	ln -f -s $(LINUX_BUILD)/vmlinux

uvc: CONFIG_USB_VIDEO_CLASS=m
uvc: M=$(LINUX_SRC)/drivers/media/usb/uvc
uvc: module-current
