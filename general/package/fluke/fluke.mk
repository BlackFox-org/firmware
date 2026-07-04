################################################################################
#
# qlink
#
################################################################################

# Use the specific commit hash or branch name (e.g., master)
FLUKE_VERSION = f81082cc05236d4a8229a0ad01db2c80617225fb
FLUKE_SITE = $(call github,Texas-Lupo,fluke,$(FLUKE_VERSION))

FLUKE_LICENSE = GPL-3.0
FLUKE_LICENSE_FILES = LICENSE

# TARGET_CONFIGURE_OPTS automatically passes the correct ARM cross-compiler, 
# as well as the -Os, -mcpu, and -mfloat-abi flags defined in your defconfig.
define FLUKE_BUILD_CMDS
	@echo "Building fluke for ARM target"
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

# Installs the compiled binary into the drone's /usr/bin directory and makes it executable
define FLUKE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/fluke $(TARGET_DIR)/usr/bin/fluke
endef

$(eval $(generic-package))
