--  █████╗ ██╗   ██╗████████╗ ██████╗ ███████╗████████╗ █████╗ ██████╗ ████████╗
-- ██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝
-- ███████║██║   ██║   ██║   ██║   ██║███████╗   ██║   ███████║██████╔╝   ██║
-- ██╔══██║██║   ██║   ██║   ██║   ██║╚════██║   ██║   ██╔══██║██╔══██╗   ██║
-- ██║  ██║╚██████╔╝   ██║   ╚██████╔╝███████║   ██║   ██║  ██║██║  ██║   ██║
-- ╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝
------------------------------------------------------------------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --all")
	hl.exec_cmd("bash -c 'sleep 1 && dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP'")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("ydotoold")
	hl.exec_cmd("hyprctl setcursor Remus-White 32")
	hl.exec_cmd("noctalia")
	hl.exec_cmd("easyeffects")
	hl.exec_cmd("mpd-discord-rpc")
	-- hl.exec_cmd("hyprpm reload -n")
end)
