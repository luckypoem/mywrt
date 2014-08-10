#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=quick-setup-packages
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/quick-setup/Default
  SECTION:=quick-setup
  CATEGORY:=quick-setup
  TITLE:=quick-setup's Packages
  PKGARCH:=all
endef

define Package/quick-setup
  $(call Package/quick-setup/Default)
  VARIANT:=basic
  TITLE=Basic
  DEPENDS:=+block-mount +kmod-fs-ext4 +kmod-fs-vfat +ntfs-3g +kmod-usb-storage +kmod-usb-storage-extras +kmod-nls-utf8 +ip +ipset +kmod-ipt-ipopt +luci +luci-app-upnp +wget
endef

define Package/quick-setup-other
  $(call Package/quick-setup/Default)
  VARIANT:=other
  TITLE=Other
  DEPENDS:=+quick-setup +luci-app-hd-idle +luci-app-ntpc +luci-app-webshell
endef

define Package/quick-setup-proxy
  $(call Package/quick-setup/Default)
  VARIANT:=proxy
  TITLE=Proxy
  DEPENDS:=+quick-setup +luci-app-overthewall +luci-app-dnscrypt-proxy +luci-app-redsocks2 +luci-app-shadowsocks
endef

define Package/quick-setup-download
  $(call Package/quick-setup/Default)
  VARIANT:=download
  TITLE=Download
  DEPENDS:=+quick-setup +luci-app-aria2 +yaaw-aria2 +webui-aria2 +transmission-daemon +transmission-web +luci-app-transmission +luci-app-xunlei
endef

define Package/quick-setup-server
  $(call Package/quick-setup/Default)
  VARIANT:=server
  TITLE=Server
  DEPENDS:=+quick-setup +luci-app-samba +luci-app-vsftpd
endef

define Package/quick-setup-wireless-crack
  $(call Package/quick-setup/Default)
  VARIANT:=wireless-crack
  TITLE=Wireless Crack
  DEPENDS:=+quick-setup +kmod-rt2800-usb +kmod-rt2x00-lib +kmod-rtl8187 +wireless-tools +aircrack-ng +aircrack-ptw +mdk3 +reaver +libcap +screen
endef

define Package/quick-setup-usb
  $(call Package/quick-setup/Default)
  VARIANT:=usb-tool
  TITLE=USB Tools
  DEPENDS:=+quick-setup +badblocks +e2fsprogs +fdisk +usbutils
endef

define Package/quick-setup-iptables
  $(call Package/quick-setup/Default)
  VARIANT:=iptables
  TITLE=iptables
  DEPENDS:=+iptables +iptables-mod-account +iptables-mod-chaos +iptables-mod-condition +iptables-mod-conntrack-extra +iptables-mod-delude +iptables-mod-dhcpmac +iptables-mod-dnetmap +iptables-mod-extra +iptables-mod-filter +iptables-mod-fuzzy +iptables-mod-geoip +iptables-mod-hashlimit +iptables-mod-iface +iptables-mod-ipmark +iptables-mod-ipopt +iptables-mod-ipp2p +iptables-mod-iprange +iptables-mod-ipsec +iptables-mod-ipv4options +iptables-mod-led +iptables-mod-length2 +iptables-mod-logmark +iptables-mod-lscan +iptables-mod-lua +iptables-mod-nat-extra +iptables-mod-psd +iptables-mod-quota2 +iptables-mod-rawnat +iptables-mod-steal +iptables-mod-sysrq +iptables-mod-tarpit +iptables-mod-tee +iptables-mod-tproxy +iptables-mod-u32 +iptables-mod-ulog +iptables-snmp
endef

define Package/quick-setup-test
  $(call Package/quick-setup/Default)
  VARIANT:=test
  TITLE=Test
  DEPENDS:=+quick-setup +dnsmasq-full +luci-app-webshell +luci-app-dnscrypt-proxy +luci-app-shadowsocks +luci-app-overthewall +luci-app-adbyby +luci-app-aria2 +yaaw-aria2 +webui-aria2 +luci-app-xunlei
endef

$(eval $(call BuildPackage,quick-setup))
$(eval $(call BuildPackage,quick-setup-other))
$(eval $(call BuildPackage,quick-setup-proxy))
$(eval $(call BuildPackage,quick-setup-download))
$(eval $(call BuildPackage,quick-setup-server))
$(eval $(call BuildPackage,quick-setup-wireless-crack))
$(eval $(call BuildPackage,quick-setup-usb))
$(eval $(call BuildPackage,quick-setup-iptables))
$(eval $(call BuildPackage,quick-setup-test))
