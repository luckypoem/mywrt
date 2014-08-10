include $(TOPDIR)/rules.mk

PKG_NAME:=adbyby
PKG_VERSION:=2.1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/adbyby
   SECTION:=net
   CATEGORY:=Network
   SUBMENU:=Routing and Redirection
   DEPENDS:=
   TITLE:=AD Bye Bye
   PKGARCH:=all
endef

define Package/adbyby/description
   ADBYBY is a tools to remove AD from internet browsing.
endef

define Build/Compile
endef

define Package/adbyby/install
	$(CP) ./files/* $(1)
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/usr/bin/adbyby $(1)/usr/bin/adbyby
endef

$(eval $(call BuildPackage,adbyby))
