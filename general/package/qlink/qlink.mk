################################################################################
#
# Adaptive Link
#
################################################################################
QLINK_SITE = $(call github,Vulpisfoglia-dev,QLink,$(QLINK_VERSION))
QLINK_VERSION = '921b73d25fd5b9123b454d7c80790036d7a59728'
QLINK_DEPENDENCIES = yaml-cli-multi

QLINK_LICENSE = GPL-3.0


ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
	QLINK_OPTIONS = "-rdynamic -s -Os -lm"
else
	QLINK_OPTIONS = "-rdynamic -s -Os"
endif

define Q_BUILD_CMDS
	@echo "Building QLink"
	$(MAKE) CC=$(TARGET_CC) OPT=$(QLINK_OPTIONS) -C $(@D)
endef

define QLINK_INSTALL_TARGET_CMDS
	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc
	$(INSTALL) -m 755 -d $(TARGET_DIR)/usr/bin

	$(INSTALL) -m 644 -t $(TARGET_DIR)/etc $(@D)/alink.conf
	$(INSTALL) -m 644 -t $(TARGET_DIR)/etc $(@D)/wlan_adapters.yaml
	$(INSTALL) -m 644 -t $(TARGET_DIR)/etc $(@D)/txprofiles/txprofiles.conf
	$(INSTALL) -m 755 -t $(TARGET_DIR)/usr/bin $(@D)/alink_drone
endef

$(eval $(generic-package))
