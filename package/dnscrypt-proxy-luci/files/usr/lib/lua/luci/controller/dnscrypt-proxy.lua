module("luci.controller.dnscrypt-proxy", package.seeall)

function index()
	
	if not nixio.fs.access("/etc/config/dnscrypt-proxy") then
		return
	end

	local page
	page = entry({"admin", "services", "dnscrypt-proxy"}, cbi("dnscrypt-proxy"), _("DNSCrypt-Proxy"), 38)
	page.dependent = true
end
