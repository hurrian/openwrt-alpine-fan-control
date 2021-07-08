#
# Copyright (C) 2021 Kenneth Kasilag <kenneth@kasilag.me>
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-alpine-fan-control
PKG_VERSION:=1
PKG_RELEASE:=1
PKG_LICENSE:=GPL-3.0

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

LUA_LIBRARYDIR = /usr/lib/lua
LUCI_LIBRARYDIR = $(LUA_LIBRARYDIR)/luci

define Package/luci-app-alpine-fan-control
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	DEPENDS:= +alpine-fan-control
	TITLE:=luci-app-alpine-fan-control
	PKGARCH:=all
endef

define Package/luci-app-alpine-fan-control/description
	 LuCI web-interface for alpine-fan-control
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./* $(PKG_BUILD_DIR)/
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)$(LUCI_LIBRARYDIR)
	cp -pR $(PKG_BUILD_DIR)/luasrc/* $(1)$(LUCI_LIBRARYDIR)/
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d/
	cp -pR $(PKG_BUILD_DIR)/files/luci-app-alpine-fan-control.json $(1)/usr/share/rpcd/acl.d/luci-app-alpine-fan-control.json
endef

define Package/$(PKG_NAME)/postinst
[ -n "$${IPKG_INSTROOT}" ] || {$(foreach script,$(LUCI_DEFAULTS),
	(. /etc/uci-defaults/$(script)) && rm -f /etc/uci-defaults/$(script))
	rm -f /tmp/luci-indexcache
	rm -rf /tmp/luci-modulecache/
	killall -HUP rpcd 2>/dev/null
	exit 0
}
endef

$(eval $(call BuildPackage,luci-app-alpine-fan-control))
