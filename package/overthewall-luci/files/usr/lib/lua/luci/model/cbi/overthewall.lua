local fs = require "nixio.fs"
local util = require "nixio.util"

m = Map("overthewall", translate("Over The Wall"))

update = m:section(TypedSection, "overthewall", translate("Global Setting"))
update.anonymous = true

autoupdate_enable = update:option(Flag, "autoupdate_enabled", translate("Auto Update"))
autoupdate_enable.default = false

update_url = update:option(Value, "update_url", translate("URL"))
update_url.default = "http://leenchan.sourceforge.net/file/index.php"
update_url.optional = false

update_now = update:option(Button, "_button", "Update Now")
update_now.inputtitle = translate("Update")
update_now.inputstyle = "apply"
function update_now.write(self, section, value)
        update_now.inputtitle = translate("Updating...")
        luci.sys.exec("/etc/init.d/overthewall start update")
        update_now.inputtitle = translate("Update")
end

reset = update:option(Button, "_reset", "Reset All")
reset.inputtitle = translate("Reset")
reset.inputstyle = "apply"
function reset.write(self, section, value)
        reset.inputtitle = translate("Reseting...")
        luci.sys.exec("/etc/init.d/overthewall start reset")
        reset.inputtitle = translate("Reset")
end

gfwlist = m:section(TypedSection, "overthewall", translate("Update Domain List"))
gfwlist.anonymous = true

gfwlist_dns_enable = gfwlist:option(Flag, "gfwlist_dns_enabled", translate("DNS Server"))
gfwlist_dns_enable.default = false

gfwlist_dns_address = gfwlist:option(Value, "gfwlist_dns_address", translate("DNS Address"))
gfwlist_dns_address.default = "127.0.0.1"
gfwlist_dns_address.optional = false
gfwlist_dns_address:depends("gfwlist_dns_enabled", "1")

gfwlist_dns_port = gfwlist:option(Value, "gfwlist_dns_port", translate("DNS Port"))
gfwlist_dns_port.datatype = "range(0,65535)"
gfwlist_dns_port.default = "2053"
gfwlist_dns_port.optional = false
gfwlist_dns_port:depends("gfwlist_dns_enabled", "1")

gfwlist_ipset_enable = gfwlist:option(Flag, "gfwlist_ipset_enabled", translate("IPSET"))
gfwlist_ipset_enable.default = false

gfwlist_ipset_name = gfwlist:option(Value, "gfwlist_ipset_name", translate("IPSET Name"))
gfwlist_ipset_name.default = "gfwlist"
gfwlist_ipset_name.optional = true
gfwlist_ipset_name:depends("gfwlist_ipset_enabled", "1")

gfwlist_enable = gfwlist:option(Flag, "gfwlist_enabled", translate("GFWlist"))
gfwlist_enable.default = false

gfwlist_url = gfwlist:option(Value, "gfwlist_url", translate("File Name"))
gfwlist_url.default = "gfwlist.txt"
gfwlist_url.optional = false
gfwlist_url:depends("gfwlist_enabled", "1")

gfwlist_user_enable = gfwlist:option(Flag, "gfwlist_user_enabled", translate("GFW User List"))
gfwlist_user_enable.default = false

gfwlist_user_url = gfwlist:option(Value, "gfwlist_user_url", translate("File Name"))
gfwlist_user_url.default = "gfw_user.txt"
gfwlist_user_url.optional = false
gfwlist_user_url:depends("gfwlist_user_enabled", "1")


ip_list = m:section(TypedSection, "overthewall", translate("Update IP List"))
ip_list.anonymous = true

ip_gfw_enable = ip_list:option(Flag, "ip_gfw_enabled", translate("GFW IP"))
ip_gfw_enable.default = false

ip_gfw_url = ip_list:option(Value, "ip_gfw_url", translate("File Name"))
ip_gfw_url.default = "ip_gfw.txt"
ip_gfw_url.optional = false
ip_gfw_url:depends("ip_gfw_enabled", "1")

ip_cdn_enable = ip_list:option(Flag, "ip_cdn_enabled", translate("China IP"))
ip_cdn_enable.default = false

ip_cdn_url = ip_list:option(Value, "ip_cdn_url", translate("File Name"))
ip_cdn_url.default = "ip_cdn.txt"
ip_cdn_url.optional = false
ip_cdn_url:depends("ip_cdn_enabled", "1")

ip_spurious_enable = ip_list:option(Flag, "ip_spurious_enabled", translate("Spurious IP"))
ip_spurious_enable.default = false

ip_spurious_url = ip_list:option(Value, "ip_spurious_url", translate("File Name"))
ip_spurious_url.default = "spurious_ips.conf"
ip_spurious_url.optional = false
ip_spurious_url:depends("ip_spurious_enabled", "1")

return m
