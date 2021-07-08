#
# Copyright (C) 2021 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=alpine-fan-control
PKG_VERSION:=1
PKG_RELEASE:=1
PKG_LICENSE:=GPL-3.0

PKG_MAINTAINER:=Kenneth Kasilag <kenneth@kasilag.me>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/alpine-fan-control
	SECTION:=utils
	CATEGORY:=Utilities
	DEPENDS:=bash
	TITLE:=Fan control daemon for Annapurna Alpine devices (Netgear R9000, XR700)
	PKGARCH:=all
endef

define Package/alpine-fan-control/conffiles
  /etc/config/alpine-fan-control
endef

define Package/alpine-fan-control/description
  Fan control daemon for Annapurna Alpine devices (Netgear R9000, XR700)
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/alpine-fan-control/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/alpine-fan-controller $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/alpine-fan-control.config $(1)/etc/config/alpine-fan-control
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/alpine-fan-control.init $(1)/etc/init.d/alpine-fan-control
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/alpine-fan-control.uci-defaults $(1)/etc/uci-defaults/99_alpine-fan-control
endef

$(eval $(call BuildPackage,alpine-fan-control))
