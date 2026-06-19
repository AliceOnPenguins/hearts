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

hl.animation({ leaf = "fadeSwitch", enabled = false })
hl.animation({ leaf = "fadeDim", enabled = false })

hl.curve("mangoOpen", { type = "bezier", points = { { 0.46, 1.0 }, { 0.29, 1 } } })
hl.curve("mangoClose", { type = "bezier", points = { { 0.08, 0.92 }, { 0.0, 1 } } })
hl.curve("mangoSpring", { type = "spring", mass = 0.6, stiffness = 25, dampening = 9 })

hl.animation({ leaf = "windowsIn", enabled = true, speed = 5.5, spring = "mangoSpring", style = "slide left" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 18.0, bezier = "mangoClose", style = "popin" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5.5, spring = "mangoSpring" })
hl.animation({ leaf = "fadeIn", enabled = false, speed = 5.5, bezier = "mangoOpen" })
hl.animation({ leaf = "fadeOut", enabled = false, speed = 8.0, bezier = "mangoClose" })
hl.animation({ leaf = "fadeSwitch", enabled = false })
hl.animation({ leaf = "fadeDim", enabled = false })
hl.animation({ leaf = "fadeLayers", enabled = true, speed = 5.5, bezier = "mangoOpen" })
hl.animation({ leaf = "layers", enabled = false })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4.5, bezier = "mangoOpen", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 4.5, bezier = "mangoOpen", style = "slidevert" })
