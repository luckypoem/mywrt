--[[
RA-MOD
]]--

module("luci.controller.redsocks2", package.seeall)

function index()

	local page
	page = entry({"admin", "services", "redsocks2"}, cbi("redsocks2"), _("Redsocks2"), 50)
	page.i18n = "redsocks2"
	page.dependent = true
end
