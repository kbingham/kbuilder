##
## Welcome to $(BUILDSYS_ROOT)/build-common/Makefile
## Where all your build desires are made.
##

BUILDSYS_COMMON := $(BUILDSYS_ROOT)/build-common

include $(BUILDSYS_COMMON)/config.dirs

##
## BUILDSYS_TARGET_CONF should already be defined to locate Target Variables
##

BUILDSYS_TARGET_CONF ?= $(error This build system needs to be run from a configured directory)

## Catch all rules

all:


## Provide useful information if asked

help:
	@echo "Buildsystem Configuration"
	@echo "BUILDSYS_TARGET_CONF: " $(BUILDSYS_TARGET_CONF)



## Manage the target configuration file

BUILDSYS_TARGET_CONFIG_IN := $(BUILDSYS_TARGET_CONF)/config.in
$(BUILDSYS_TARGET_CONFIG_IN):
	$(error $(BUILDSYS_TARGET_CONFIG_IN) required to provide target details)

include $(BUILDSYS_TARGET_CONFIG_IN)


## Package support rules

PACKAGES:=$(BUILDSYS_COMMON)/packages

include $(PACKAGES)/linux
