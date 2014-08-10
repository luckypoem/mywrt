module("luci.controller.overthewall", package.seeall)

function index()
	
	if not nixio.fs.access("/etc/config/overthewall") then
		return
	end

	local page
	page = entry({"admin", "services", "overthewall"}, cbi("overthewall"), _("OverTheWall"), 38)
	page.dependent = true
end
