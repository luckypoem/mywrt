#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-webshell
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-webshell
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI Support for webshell
  DEPENDS:=+luci +libc
  PKGARCH:=all
endef

define Package/luci-app-webshell/description
LuCI Support for webshell
endef

define Build/Compile
endef

define Package/luci-app-webshell/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,luci-app-webshell))
