BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

-include packages/*

dtb: $(DTBS)

all: dtb linux

%.scr: %
	mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
		-n 'Execute uImage.bin' -d $^ $@

TFTP_SERVER:=pi@lab.linuxembedded.co.uk:/srv/tftp/

$(eval $(call power,acme-power,salvator-x))
$(eval $(call power,energenie-power,salvator-xs))
$(eval $(call power,energenie-power,port1))
$(eval $(call power,energenie-power,8camera))

$(eval $(call target-helpers,salvator-x))
$(eval $(call target-helpers,salvator-xs))

$(eval $(call power,energenie-power.banoffee,salvator-xs-m3n))
$(eval $(call target-helpers,salvator-xs-m3n))

$(eval $(call magnus-farm,9013-draak,9013,r8a77995-draak.dtb))

$(eval $(call fram,eagle-v3m,eagle-v3m@lab.linuxembedded.co.uk))
$(eval $(call fram,ebisu,ebisu@gate.glider.be))
$(eval $(call fram,falcon-v3u,falcon-v3u@lab.linuxembedded.co.uk))
$(eval $(call fram,whitehawk-v4h,whitehawk-v4h@lab.linuxembedded.co.uk))
$(eval $(call fram,spider-s4,spider-s4@lab.linuxembedded.co.uk))
$(eval $(call fram,kakip,kakip@lab.linuxembedded.co.uk))


tftp-kakip: $(LINUX_IMAGES) $(LINUX_DTBS) bootcmd.kakip.scr

salvator-x-on: port1-on 8camera-on
salvator-x-off: port1-off 8camera-off
