BUILDSYS_ROOT   ?=$(abspath ../../)

# Define this current target directory.
BUILDSYS_TARGET_CONF := $(abspath $(PWD))

TARGET:=$(shell basename $(BUILDSYS_TARGET_CONF))

# Pull in the main makefile for packages
include $(BUILDSYS_ROOT)/build-common/Makefile

-include packages/*

dtb: linux-dtbs

all: dtb linux

TFTP_SERVER:=pi@lab.linuxembedded.co.uk:/srv/tftp/

$(eval $(call power,acme-power,salvator-x))
$(eval $(call power,energenie-power,salvator-xs))
$(eval $(call power,energenie-power,port1))
$(eval $(call power,energenie-power,8camera))
$(eval $(call power,energenie-power,eagle-v3m))

$(eval $(call target-helpers,salvator-x))
$(eval $(call target-helpers,salvator-xs))
$(eval $(call target-helpers,eagle-v3m))

$(eval $(call power,energenie-power.banoffee,salvator-xs-m3n))
$(eval $(call target-helpers,salvator-xs-m3n))

$(eval $(call magnus-farm,9013-draak,9013,r8a77995-draak.dtb))

$(eval $(call fram,falcon-v3u,falcon-v3u@lab.linuxembedded.co.uk))

salvator-x-on: port1-on 8camera-on
salvator-x-off: port1-off 8camera-off
