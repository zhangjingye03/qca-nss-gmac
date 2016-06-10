#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=qca-nss-gmac
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define KernelPackage/qca-nss-gmac
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Qualcomm Network Sub System (NSS)
  TITLE:=Qualcomm NSS GMAC driver
  FILES:=$(PKG_BUILD_DIR)/ipq806x/qca-nss-gmac.ko
  KCONFIG:=
  AUTOLOAD:=$(call AutoLoad,32, qca-nss-gmac)
  DEPENDS:=@TARGET_ipq806x +kmod-qca-nss-drv
endef

define KernelPackage/qca-nss-gmac/Default/description
 This package contains the proprietary gmac driver for QCA chipset.
endef

EXTRA_KCONFIG:= \
	CONFIG_QCA-NSS-GMAC=m

EXTRA_CFLAGS:= \
	$(patsubst CONFIG_%, -DCONFIG_%=1, $(patsubst %=m,%,$(filter %=m,$(EXTRA_KCONFIG)))) \
	$(patsubst CONFIG_%, -DCONFIG_%=1, $(patsubst %=y,%,$(filter %=y,$(EXTRA_KCONFIG)))) \
	-I$(PKG_BUILD_DIR)/ipq806x/include \
	-DCONFIG_NSS_DEBUG_LEVEL=4

MAKE_OPTS:= \
	ARCH="$(LINUX_KARCH)" \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	SUBDIRS="$(PKG_BUILD_DIR)" \
	EXTRA_CFLAGS="$(EXTRA_CFLAGS)" \
	$(EXTRA_KCONFIG)


define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	$(MAKE) -C "$(LINUX_DIR)" \
		$(MAKE_OPTS) \
		modules
endef

$(eval $(call KernelPackage,qca-nss-gmac))
