#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-overthewall
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-overthewall
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI Support for overthewall list
  DEPENDS:=+curl +iptables-mod-filter
  PKGARCH:=all
endef

define Package/luci-app-overthewall/description
LuCI Support for overthewall list
endef

define Build/Compile
endef

define Package/luci-app-overthewall/install
	$(CP) ./files/* $(1)
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./overthewall.init $(1)/etc/init.d/overthewall
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./overthewall.conf $(1)/etc/config/overthewall
endef

define Package/luci-app-overthewall/postinst
#!/bin/sh
[ -n "${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/luci-overthewall ) && rm -f /etc/uci-defaults/luci-overthewall
	chmod 755 /etc/init.d/overthewall >/dev/null 2>&1
	/etc/init.d/overthewall enable >/dev/null 2>&1
	exit 0
}
endef

define Package/luci-app-overthewall/conffiles
  /etc/config/overthewall
endef

$(eval $(call BuildPackage,luci-app-overthewall))
