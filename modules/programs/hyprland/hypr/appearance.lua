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
		gaps_out = 50,
		col = {
			active_border = {
				colors = {
					-- "rgba(d65d0eff)",
					-- "rgba(d79921ff)",
					-- "rgba(f9f5d7ff)",
					-- "rgba(5b9cd0ff)",
					"rgba(f4d78cff)",
				},
				angle = 90,
			},
			inactive_border = "rgba(1a1a1aaa)",
		},
		border_size = 2,
		allow_tearing = false,
		layout = "master",
	},

	decoration = {
		rounding = 20,
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
			size = 1,
			passes = 2,
			vibrancy = 0.1695,
			xray = false,
		},
	},
})
