#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-dnscrypt-proxy
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-dnscrypt-proxy
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI Support for dnscrypt-proxy
  DEPENDS:=+libc +dnscrypt-proxy
  PKGARCH:=all
endef

define Package/luci-app-dnscrypt-proxy/description
LuCI Support for dnscrypt-proxy
endef

define Build/Compile
endef

define Package/luci-app-dnscrypt-proxy/install
	$(CP) ./files/* $(1)
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./dnscrypt-proxy.init $(1)/etc/init.d/dnscrypt-proxy
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./dnscrypt-proxy.conf $(1)/etc/config/dnscrypt-proxy
endef

define Package/luci-app-dnscrypt-proxy/postinst
#!/bin/sh
[ -n "${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/luci-dnscrypt-proxy ) && rm -f /etc/uci-defaults/luci-dnscrypt-proxy
	chmod 755 /etc/init.d/dnscrypt-proxy >/dev/null 2>&1
	/etc/init.d/dnscrypt-proxy enable >/dev/null 2>&1
	exit 0
}
endef

define Package/luci-app-dnscrypt-proxy/conffiles
  /etc/config/dnscrypt-proxy
endef

$(eval $(call BuildPackage,luci-app-dnscrypt-proxy))
