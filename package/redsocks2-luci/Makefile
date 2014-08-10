#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-redsocks2
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-redsocks2
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI Support for redsocks2
  DEPENDS:=+redsocks2 +libc
  PKGARCH:=all
endef

define Package/luci-app-redsocks2/description
LuCI Support for redsocks2
endef

define Build/Compile
endef

define Package/luci-app-redsocks2/install
	$(CP) ./files/* $(1)
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./redsocks2.init $(1)/etc/init.d/redsocks2
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./redsocks2.config $(1)/etc/config/redsocks2
	$(INSTALL_DIR) $(1)/etc/hotplug.d/iface
	$(INSTALL_BIN) ./redsocks2.hotplug $(1)/etc/hotplug.d/iface/99-redsocks2
endef

define Package/luci-app-redsocks2/postinst
#!/bin/sh
[ -n "${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/luci-redsocks2 ) && rm -f /etc/uci-defaults/luci-redsocks2
	chmod 755 /etc/init.d/redsocks2 >/dev/null 2>&1
	/etc/init.d/redsocks2 enable >/dev/null 2>&1
	exit 0
}
endef

$(eval $(call BuildPackage,luci-app-redsocks2))
