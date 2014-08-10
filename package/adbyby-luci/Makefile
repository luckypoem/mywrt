#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-adbyby
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-adbyby
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI Support for adbyby
  DEPENDS:=+libc +adbyby
  PKGARCH:=all
endef

define Package/luci-app-adbyby/description
LuCI Support for adbyby
endef

define Build/Compile
endef

define Package/luci-app-adbyby/install
	$(CP) ./files/* $(1)
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./adbyby.init $(1)/etc/init.d/adbyby
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./adbyby.conf $(1)/etc/config/adbyby
endef

define Package/luci-app-adbyby/postinst
#!/bin/sh
[ -n "${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/luci-adbyby ) && rm -f /etc/uci-defaults/luci-adbyby
	chmod 755 /etc/init.d/adbyby >/dev/null 2>&1
	/etc/init.d/adbyby enable >/dev/null 2>&1
	exit 0
}
endef

define Package/luci-app-adbyby/conffiles
  /etc/config/adbyby
endef

$(eval $(call BuildPackage,luci-app-adbyby))
