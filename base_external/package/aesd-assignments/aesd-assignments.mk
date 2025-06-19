################################################################################
# aesd-assignments.mk - Buildroot package file for assignments-3-and-later
################################################################################

AESD_ASSIGNMENTS_VERSION = 665cec9d75da71b02753f0316accc2f27c0f7b5d
AESD_ASSIGNMENTS_SITE = $(call github,cu-ecen-aeld,assignments-3-and-later-alemuraa,$(AESD_ASSIGNMENTS_VERSION))
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/finder.sh $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/writer $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-test.sh $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))

