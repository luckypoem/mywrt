#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#


include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-xunlei
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-xunlei
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=xware web UI
  DEPENDS:=+libc +wget
  PKGARCH:=all
  MAINTAINER:=OpenWrt Developers Team <openwrt-devel@openwrt.org>
endef

define Package/luci-app-xunlei/description
xware web UI
endef

define Build/Compile
endef

define Package/luci-app-xunlei/install
	$(CP) ./files/* $(1)
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/xunlei $(1)/etc/init.d/xunlei
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/etc/config/xunlei $(1)/etc/config/xunlei
endef

define Package/luci-app-xunlei/postinst
#!/bin/sh
[ -n "${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/luci-xunlei ) && rm -f /etc/uci-defaults/luci-xunlei
	chmod 755 /etc/init.d/xunlei >/dev/null 2>&1
	/etc/init.d/xunlei enable >/dev/null 2>&1
	exit 0
}
endef

$(eval $(call BuildPackage,luci-app-xunlei))
