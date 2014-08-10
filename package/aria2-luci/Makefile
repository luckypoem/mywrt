#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-aria2
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-aria2
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI Support for aria2
  DEPENDS:=+aria2 +libc
  PKGARCH:=all
endef

define Package/luci-app-aria2/description
LuCI Support for aria2
endef

define Build/Compile
endef

define Package/luci-app-aria2/install
	$(CP) ./files/* $(1)
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./aria2.init $(1)/etc/init.d/aria2
	$(INSTALL_BIN) ./aria2delaystarter.init $(1)/etc/init.d/aria2delaystarter
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./aria2.config $(1)/etc/config/aria2
endef

define Package/luci-app-aria2/postinst
#!/bin/sh
[ -n "${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/luci-aria2 ) && rm -f /etc/uci-defaults/luci-aria2
	chmod 755 /etc/init.d/aria2 >/dev/null 2>&1
	chmod 755 /etc/init.d/aria2delaystarter >/dev/null 2>&1
	/etc/init.d/aria2 enable >/dev/null 2>&1
	/etc/init.d/aria2delaystarter enable >/dev/null 2>&1
	rm -rf /tmp/luci-modulecache
	rm -rf /tmp/luci-indexcache
	exit 0
}
endef

define Package/luci-app-aria2/postrm
#!/bin/sh
rm -rf /tmp/luci-modulecache
rm -rf /tmp/luci-indexcache
endef

define Package/luci-app-aria2/prerm
#!/bin/sh
/etc/init.d/aria2 stop
/etc/init.d/aria2 disable
/etc/init.d/aria2delaystarter disable
endef

$(eval $(call BuildPackage,luci-app-aria2))
