################################################################################
#
# rtl88x2cu-openipc
#
################################################################################

ifeq ($(LOCAL_DOWNLOAD),y)
RTL88X2CU_OPENIPC_SITE_METHOD = git
RTL88X2CU_OPENIPC_SITE = https://github.com/libc0607/rtl88x2cu-20230728
RTL88X2CU_OPENIPC_VERSION = $(shell git ls-remote $(RTL88X2CU_OPENIPC_SITE) HEAD | head -1 | cut -f1)
else
RTL88X2CU_OPENIPC_SITE = https://github.com/libc0607/rtl88x2cu-20230728/archive
RTL88X2CU_OPENIPC_SOURCE = master.tar.gz
endif

RTL88X2CU_OPENIPC_LICENSE = GPL-2.0
RTL88X2CU_OPENIPC_LICENSE_FILES = COPYING

RTL88X2CU_OPENIPC_MODULE_MAKE_OPTS = CONFIG_RTL8822CU=m \
	KVER=$(LINUX_VERSION_PROBED) \
	KSRC=$(LINUX_DIR)

$(eval $(kernel-module))
$(eval $(generic-package))
