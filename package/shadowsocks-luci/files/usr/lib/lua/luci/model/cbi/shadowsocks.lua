--[[
RA-MOD
]]--

local fs = require "nixio.fs"

local sslocal =(luci.sys.call("pidof ss-local > /dev/null") == 0)
local ssredir =(luci.sys.call("pidof ss-redir > /dev/null") == 0)
if sslocal or ssredir then	
	m = Map("shadowsocks", translate("ShadowSocks"), translate("shadowsocks is running"))
else
	m = Map("shadowsocks", translate("ShadowSocks"), translate("shadowsocks is not running"))
end

server = m:section(TypedSection, "shadowsocks", translate("Server Setting"))
server.anonymous = true

remote_server = server:option(Value, "remote_server", translate("Server Address"))
remote_server.datatype = ipaddr
remote_server.optional = false

remote_port = server:option(Value, "remote_port", translate("Server Port"))
remote_port.datatype = "range(0,65535)"
remote_port.optional = false

password = server:option(Value, "password", translate("Password"))
password.password = true

cipher = server:option(ListValue, "cipher", translate("Cipher Method"))
cipher:value("table")
cipher:value("rc4")
cipher:value("aes-128-cfb")
cipher:value("aes-192-cfb")
cipher:value("aes-256-cfb")
cipher:value("bf-cfb")
cipher:value("cast5-cfb")
cipher:value("des-cfb")
cipher:value("camellia-128-cfb")
cipher:value("camellia-192-cfb")
cipher:value("camellia-256-cfb")
cipher:value("idea-cfb")
cipher:value("rc2-cfb")
cipher:value("seed-cfb")
cipher.default = "aes-256-cfb"

socks5 = m:section(TypedSection, "shadowsocks", translate("SOCKS5 Proxy"))
socks5.anonymous = true

switch = socks5:option(Flag, "enabled", translate("Enable"))
switch.rmempty = false

local_port = socks5:option(Value, "local_port", translate("Local Port"))
local_port.datatype = "range(0,65535)"
local_port.optional = false
local_port.default = "10000"

redir = m:section(TypedSection, "shadowsocks", translate("Transparent Proxy"))
redir.anonymous = true

redir_enable = redir:option(Flag, "redir_enabled", translate("Enable"))
redir_enable.default = false

redir_port = redir:option(Value, "redir_port", translate("Local Port"))
redir_port.datatype = "range(0,65535)"
redir_port.optional = false
redir_port.default = "10086"

redir_model = redir:option(ListValue, "redir_model", translate("Proxy Model"))
redir_model:value("whitelist")
redir_model:value("blacklist")
redir_model:value("ipset")
redir_model.default = "ipset"

whitelist = redir:option(TextValue, "whitelist", " ", translate("Only proxy in list"))
whitelist.template = "cbi/tvalue"
whitelist.size = 30
whitelist.rows = 10
whitelist.wrap = "off"
whitelist:depends("redir_model", "whitelist")

function whitelist.cfgvalue(self, section)
	return fs.readfile("/etc/ipset/gfw") or ""
end
function whitelist.write(self, section, value)
	if value then
		value = value:gsub("\r\n?", "\n")
		fs.writefile("/tmp/gfw", value)
		fs.mkdirr("/etc/ipset")
		if (fs.access("/etc/ipset/gfw") ~= true or luci.sys.call("cmp -s /tmp/gfw /etc/ipset/gfw") == 1) then
			fs.writefile("/etc/ipset/gfw", value)
		end
		fs.remove("/tmp/gfw")
	end
end

blacklist = redir:option(TextValue, "blacklist", " ", translate("Not proxy in list"))
blacklist.template = "cbi/tvalue"
blacklist.size = 30
blacklist.rows = 10
blacklist.wrap = "off"
blacklist:depends("redir_model", "blacklist")

function blacklist.cfgvalue(self, section)
	return fs.readfile("/etc/ipset/cdn") or ""
end
function blacklist.write(self, section, value)
	if value then
		value = value:gsub("\r\n?", "\n")
		fs.writefile("/tmp/cdn", value)
		fs.mkdirr("/etc/ipset")
		if (fs.access("/etc/ipset/cdn") ~= true or luci.sys.call("cmp -s /tmp/cdn /etc/ipset/cdn") == 1) then
			fs.writefile("/etc/ipset/cdn", value)
		end
		fs.remove("/tmp/cdn")
	end
end

return m
