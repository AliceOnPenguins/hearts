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
          "rgba(f6b26bff)",
          "rgba(ffe597ff)",
          "rgba(ffffffff)",
          "rgba(86c8ffff)",
          "rgba(5b96faff)",
        },
        angle = 90,
      },
      inactive_border = "rgba(1a1a1aaa)",
    },
    border_size = 2,
    allow_tearing = false,
    layout = "scrolling",
  },

  decoration = {
    rounding = 9,
    rounding_power = 4,
    active_opacity = 1.0,
    inactive_opacity = 1.0,

  shadow = {
    enabled      = true,
    range        = 12,
    render_power = 6,
    sharp        = false,
    color        = "rgba(0,0,0,0.19)",
    offset       = {0, 0},
    scale        = 1,
  },

    blur = {
      enabled = true,
      xray = false,
      special = false,
      new_optimizations = true,
      size = 2,
      passes = 2,
      noise = 0.05,
      contrast = 0.89,
    },
  },
})
