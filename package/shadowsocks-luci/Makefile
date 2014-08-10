#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-shadowsocks
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-shadowsocks
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI Support for shadowsocks
  DEPENDS:=+shadowsocks-libev +libc
  PKGARCH:=all
endef

define Package/luci-app-shadowsocks/description
LuCI Support for shadowsocks
endef

define Build/Compile
endef

define Package/luci-app-shadowsocks/install
	$(CP) ./files/* $(1)
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./shadowsocks.init $(1)/etc/init.d/shadowsocks
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./shadowsocks.conf $(1)/etc/config/shadowsocks
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/etc/uci-defaults/luci-shadowsocks $(1)/etc/uci-defaults/luci-shadowsocks
	$(INSTALL_DIR) $(1)/etc/hotplug.d/iface
	$(INSTALL_BIN) ./shadowsocks.hotplug $(1)/etc/hotplug.d/iface/99-shadowsocks
	$(INSTALL_DIR) $(1)/www/cgi-bin
	$(INSTALL_BIN) ./files/www/cgi-bin/shadowsocks $(1)/www/cgi-bin/shadowsocks
endef

define Package/luci-app-shadowsocks/postinst
#!/bin/sh
[ -n "${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/luci-shadowsocks ) && rm -f /etc/uci-defaults/luci-shadowsocks
	chmod 755 /etc/init.d/shadowsocks >/dev/null 2>&1
	/etc/init.d/shadowsocks enable >/dev/null 2>&1
	exit 0
}
endef

$(eval $(call BuildPackage,luci-app-shadowsocks))
