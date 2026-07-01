{ self, inputs, ... }: {
    flake.homeModules.noctaliav5 = { pkgs, lib, config, ... }: {
      imports = [ inputs.noctalia.homeModules.default ];
        programs.noctalia = {
            enable = true;
            settings = {

                theme = {
                    mode = "dark";
                    source = "community";
                    community_palette = "Vesper";
                    builtin = "Kanagawa";
                    templates = {
                        builtin_ids = [ "btop" "cava" "foot" "gtk3" "gtk4" "kitty" "qt" ];
                        community_ids = [ "yazi" "discord" ];
                      };
                  };

                wallpaper = {
                    enabled = true;
                    default.path = "\~/bias/wallpapers/illit2.jpeg";
                    directory = "\~/Pictures/";
                  };

                bar = {
                    order = [ "uwu" ];
                    uwu = {
                        background_opacity = 0.79;
                        border = "on_primary";
                        capsule_fill = "on_hover";
                        center = [];
                        end = [ "clock" "tray" "notifications" "media" ];
                        font_family = config.theme.font.nerdFont;
                        margin_edge = 0;
                        margin_ends = 0;
                        padding = 15;
                        radius = 0;
                        scale = 1.7;
                        start = [ "workspaces" "active_window" ];
                        thickness = 30;
                        widget_spacing = 10;
                      };
                  };

                desktop_widgets = {
                    enabled = false;
                  };

                keybinds = {
                    left = [ "Ctrl+h" ];
                    down = [ "Ctrl+j" ];
                    up = [ "Ctrl+k" ];
                    right = [ "Ctrl+l" ];
                  };

                notification = {
                    background_opacity = 0.79;
                    offset_x = 10.0;
                    offset_y = 10.0;
                    scale = 0.75;
                  };

                osd = {
                    background_opacity = 0.79;
                    scale = 0.75;
                  };

                shell = {
                    clipboard_auto_paste = "off";
                    clipboard_history_max_entries = 100;
                    corner_radius_scale = 0.55;
                    date_format = "{:%A}, {:/%d/%m/%Y}";
                    font_family = config.theme.font.nerdFont;
                    lang = "en";
                    polkit_agent = true;
                    settings_show_advanced = true;
                    show_location = false;
                    ui_scale = 1.5;
                    panel = {
                        categories = false;
                        placement = "centered";
                        compact = false;
                        sort_by_usage = false;
                        show_icons = true;
                      };
                  };

                weather = {
                    enable = true;
                  };

                location = {
                    address = "Uhersky Brod, Czech Republic"; # i dont actually live here
                  };

                widget = {
                    workspaces = {
                        focused_color = "secondary";
                        empty_color = "on_surface_variant";
                        minimal = true;
                        occupied_color = "on_surface_variant";
                      };
                  };
              };
          };
      };
  }
