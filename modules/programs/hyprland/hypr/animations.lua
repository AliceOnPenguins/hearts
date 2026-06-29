--  █████╗ ███╗   ██╗██╗███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
-- ██╔══██╗████╗  ██║██║████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
-- ███████║██╔██╗ ██║██║██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║
-- ██╔══██║██║╚██╗██║██║██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
-- ██║  ██║██║ ╚████║██║██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
-- ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
--------------------------------------------------------------------------

-- Self explanatory
hl.config({
	animations = {
		enabled = true,
	},
})

hl.curve("smooth", { type = "bezier", points = { {0.22, 1}, {0.36, 1} } })

hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "smooth", style = "slidevert" })
hl.animation({ leaf = "specialWorkspace", enabled = false, speed = 8, bezier = "smooth", style = "slidevert" })
hl.animation({ leaf = "windows",    enabled = true, speed = 3, bezier = "smooth" })
hl.animation({ leaf = "fade",       enabled = true, speed = 3, bezier = "smooth" })
