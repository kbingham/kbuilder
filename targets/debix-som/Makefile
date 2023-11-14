BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

-include packages/*

dtb: # $(DTB) #linux-dtbs

$(BOOTSCRIPT): bootcmd.debix
	mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
		-n 'Execute uImage.bin' -d $^ $@


%.scr: %
	mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
		-n 'Execute uImage.bin' -d $^ $@

%.its: $(LINUX_IMAGES) $(LINUX_DTBS)
	@echo "TOUCHING $@" Rebuild?
	touch $@

Image.gz: $(LINUX_BUILD)/arch/arm64/boot/Image.gz
	cp $(LINUX_BUILD)/arch/arm64/boot/Image.gz .

%.itb: %.its
	echo " ************************ Build $@ from $^"
	mkimage -f $^ $@

DEBIX_SOM_DTB:=freescale/imx8mp-debix-som-a-bmb-08.dtb
DEBIX_SOM_DTBOS+=freescale/imx8mp-isp1.dtbo
DEBIX_SOM_DTBOS+=freescale/imx8mp-debix-som-a-isp0-imx283.dtbo
DEBIX_SOM_DTBOS+=freescale/imx8mp-isp2.dtbo
DEBIX_SOM_DTBOS+=freescale/imx8mp-debix-som-a-isp1-imx335.dtbo
#DEBIX_SOM_DTBS+=freescale/imx8mp-isp2.dtbo

imx8mp-debix-som-a-bmb-08.dtb: dtb
	fdtoverlay -o $@ \
       		-i $(LINUX_BUILD)/arch/arm64/boot/dts/$(DEBIX_SOM_DTB) \
		$(addprefix $(LINUX_BUILD)/arch/arm64/boot/dts/,$(DEBIX_SOM_DTBOS))

fitImage-beluga.bin: imx8mp-debix-som-a-bmb-08.dtb Image.gz debix-som.itb
	mv debix-som.itb $@

test: rm-itb linux dtb debix-som.itb debix-som

TFTP_SOURCES:=fitImage-beluga.bin

tftp-debix-som: fitImage-beluga.bin

objects:
	@echo LINUX_BUILD: $(LINUX_BUILD)
	@echo IMAGE:
	@echo $(LINUX_IMAGES) | xargs -n1 realpath --relative-to=$(LINUX_BUILD)
	@echo DTBS:
	@echo $(LINUX_DTBS) | xargs -n1 realpath --relative-to=$(LINUX_BUILD)
	@echo OVERLAYS:
	@echo $(LINUX_DTB_OVERLAYS) | xargs -n1 realpath --relative-to=$(LINUX_BUILD)

objects-local: LINUX_BUILD:=$(PWD)
objects-local: objects

all: dtb linux

$(eval $(call fram,debix-som,debix-som@lab.linuxembedded.co.uk))

on: debix-som-on
off: debix-som-off
reboot: debix-som-reboot
console: debix-som-console
release: debix-som-release
