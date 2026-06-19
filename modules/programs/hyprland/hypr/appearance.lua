--  █████╗ ██████╗ ██████╗ ███████╗ █████╗ ██████╗  █████╗ ███╗   ██╗ ██████╗███████╗
-- ██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔══██╗████╗  ██║██╔════╝██╔════╝
-- ███████║██████╔╝██████╔╝█████╗  ███████║██████╔╝███████║██╔██╗ ██║██║     █████╗
-- ██╔══██║██╔═══╝ ██╔═══╝ ██╔══╝  ██╔══██║██╔══██╗██╔══██║██║╚██╗██║██║     ██╔══╝
-- ██║  ██║██║     ██║     ███████╗██║  ██║██║  ██║██║  ██║██║ ╚████║╚██████╗███████╗
-- ╚═╝  ╚═╝╚═╝     ╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝
-------------------------------------------------------------------------------------
---

hl.config({
	general = {
		gaps_in = 10,
		gaps_out = 65,
		col = {
			active_border = {
				colors = {
					"rgba(E8974Aff)",
					"rgba(F4C97Aff)",
					"rgba(F0ECECff)",
					"rgba(A8CEDEff)",
					"rgba(7AAEC8ff)",
				},
				angle = 90,
			},
			inactive_border = "rgba(1a1a1aaa)",
		},
		border_size = 3,
		allow_tearing = false,
		layout = "master",
	},

	decoration = {
		rounding = 5,
		rounding_power = 3,
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = false,
			range = 1,
			render_power = 1,
			color = 0xf4346bee,
			color_inactive = 0x000000ee,
		},

		blur = {
			enabled = true,
			size = 2,
			passes = 2,
			vibrancy = 0.1695,
			xray = false,
		},
	},
})
