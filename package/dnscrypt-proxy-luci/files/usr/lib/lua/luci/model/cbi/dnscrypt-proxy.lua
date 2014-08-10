local fs = require "nixio.fs"
local util = require "nixio.util"
local button=""

local running=(luci.sys.call("pidof dnscrypt-proxy > /dev/null") == 0)
if running then	
	m = Map("dnscrypt-proxy", translate("DNSCrypt-Proxy"), translate("DNSCrypt-Proxy is running"))
else
	m = Map("dnscrypt-proxy", translate("DNSCrypt-Proxy"), translate("DNSCrypt-Proxy is not running"))
end

s = m:section(TypedSection, "dnscrypt-proxy", translate("DNSCrypt-Proxy"))
s.anonymous = true

s:tab("basic",  translate("Basic"))

enable = s:taboption("basic", Flag, "enabled", translate("Enable"))

address = s:taboption("basic", Value, "address", translate("Address"),translate("Default Server is 127.0.0.1"))

port = s:taboption("basic", Value, "port", translate("Port"),translate("Default Port is 2053"))

resolvers_list = s:taboption("basic", Value, "resolvers_list", translate("Resolvers list"))

resolver = s:taboption("basic", Value, "resolver", translate("Resolver"))

s:tab("editconf_resolv", translate("Resolv.conf"))
editconf_resolv = s:taboption("editconf_resolv", Value, "_editconf_resolv", 
	translate("Edit your resolv.conf file"), 
	translate("Comment by #"))
editconf_resolv.template = "cbi/tvalue"
editconf_resolv.rows = 20
editconf_resolv.wrap = "off"

function editconf_resolv.cfgvalue(self, section)
	return fs.readfile("/etc/resolv.conf") or ""
end

function editconf_resolv.write(self, section, value)
	if value then
		value = value:gsub("\r\n?", "\n")
		fs.writefile("/tmp/resolv.conf", value)
		if (luci.sys.call("cmp -s /tmp/resolv.conf /etc/resolv.conf") == 1) then
			fs.writefile("/etc/resolv.conf", value)
		end
		fs.remove("/tmp/resolv.conf")
	end
end

s:tab("editconf_dhcp", translate("DHCP"))
editconf_dhcp = s:taboption("editconf_dhcp", Value, "_editconf_dhcp", 
	translate("Edit your DHCP config"), 
	translate("Comment by #"))
editconf_dhcp.template = "cbi/tvalue"
editconf_dhcp.rows = 20
editconf_dhcp.wrap = "off"

function editconf_dhcp.cfgvalue(self, section)
	return fs.readfile("/etc/config/dhcp") or ""
end

function editconf_dhcp.write(self, section, value)
	if value then
		value = value:gsub("\r\n?", "\n")
		fs.writefile("/tmp/dhcp", value)
		if (luci.sys.call("cmp -s /tmp/dhcp /etc/config/dhcp") == 1) then
			fs.writefile("/etc/config/dhcp", value)
		end
		fs.remove("/tmp/dhcp")
	end
end

return m
