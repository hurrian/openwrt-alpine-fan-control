module("luci.controller.alpine-fan-control", package.seeall)

function index()
	if nixio.fs.access("/etc/config/alpine-fan-control") then
		local page
		page = entry({"admin", "system", "alpine-fan-control"}, cbi("alpine-fan-control"), _("Fan Control"))
		page.dependent = true
	end
end
