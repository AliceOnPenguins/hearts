-- ███╗   ███╗ ██████╗ ███╗   ██╗██╗████████╗ ██████╗ ██████╗ ███████╗
-- ████╗ ████║██╔═══██╗████╗  ██║██║╚══██╔══╝██╔═══██╗██╔══██╗██╔════╝
-- ██╔████╔██║██║   ██║██╔██╗ ██║██║   ██║   ██║   ██║██████╔╝███████╗
-- ██║╚██╔╝██║██║   ██║██║╚██╗██║██║   ██║   ██║   ██║██╔══██╗╚════██║
-- ██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██║   ██║   ╚██████╔╝██║  ██║███████║
-- ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝
----------------------------------------------------------------------

-- Monitors
hl.monitor({ output = "DP-1", mode = "3840x2160@240", position = "5000x2030", scale = 1.0 })
hl.monitor({ output = "DP-2", mode = "1920x1080@239", position = "5960x950", scale = 1.0 })
--hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@144", position = "auto", scale = 1.0 })

hl.workspace_rule({ workspace = "1", monitor = "DP-1" })
hl.workspace_rule({ workspace = "2", monitor = "DP-1" })
hl.workspace_rule({ workspace = "3", monitor = "DP-1" })
hl.workspace_rule({ workspace = "4", monitor = "DP-1" })
hl.workspace_rule({ workspace = "5", monitor = "DP-1" })
hl.workspace_rule({ workspace = "6", monitor = "DP-2" })
hl.workspace_rule({ workspace = "7", monitor = "DP-2" })
hl.workspace_rule({ workspace = "8", monitor = "DP-2" })
hl.workspace_rule({ workspace = "9", monitor = "DP-2" })
hl.workspace_rule({ workspace = "10", monitor = "DP-2" })

-- hl.workspace_rule({ workspace = "11", monitor = "DP-2" })
-- hl.workspace_rule({ workspace = "12", monitor = "DP-2" })
-- hl.workspace_rule({ workspace = "13", monitor = "DP-2" })
-- hl.workspace_rule({ workspace = "14", monitor = "DP-2" })
-- hl.workspace_rule({ workspace = "15", monitor = "DP-2" })
-- hl.workspace_rule({ workspace = "16", monitor = "DP-2" })
-- hl.workspace_rule({ workspace = "17", monitor = "DP-2" })
-- hl.workspace_rule({ workspace = "18", monitor = "DP-2" })
-- hl.workspace_rule({ workspace = "19", monitor = "DP-2" })
-- hl.workspace_rule({ workspace = "20", monitor = "DP-2" })
