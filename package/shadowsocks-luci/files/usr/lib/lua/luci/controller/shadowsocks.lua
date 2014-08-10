--[[
RA-MOD
]]--

module("luci.controller.shadowsocks", package.seeall)

function index()
	
	if not nixio.fs.access("/etc/config/shadowsocks") then
		return
	end

	local page
	page = entry({"admin", "services", "shadowsocks"}, cbi("shadowsocks"), _("ShadowSocks"), 45)
	page.i18n = "shadowsocks"
	page.dependent = true
end
