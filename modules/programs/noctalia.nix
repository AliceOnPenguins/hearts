{ self, inputs, ... }:{
    flake.homeModules.noctaliav5 = { pkgs, lib, ... }: {
      imports = [ inputs.noctalia.homeModules.default ];
        programs.noctalia = {
            enable = true;
            settings = {

                theme = {
                    mode = "dark";
                    source = "builtin";
                    builtin = "Gruvbox";
                    templates = {
                        builtin_ids = [ "btop" "cava" "foot" "gtk3" "gtk4" "kitty" "qt" ];
                        community_ids = [ "yazi" "discord" ];
                      };
                  };

                wallpaper = {
                    enabled = true;
                    default.path = "\~/mustelid/wallpapers/__arlenbell_and_eillon_rinto_original_drawn_by_tuweibu__45fd21257b571c18e1dafafacbd41c4a.jpg";
                    directory = "\~/mustelid/wallpapers/";
                  };

                bar = {
                    order = [ "uwu" ];
                    uwu = {
                        background_opacity = 0.79;
                        border = "on_primary";
                        capsule_fill = "on_hover";
                        center = [];
                        end = [ "clock" "tray" "notifications" "media" ];
                        font_family = "JetBrainsMono NF";
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
                    font_family = "JetBrainsMono NF";
                    lang = "en";
                    polkit_agent = true;
                    settings_show_advanced = true;
                    show_location = false;
                    ui_scale = 1.5;
                    panel = {
                        launcher_categories = false;
                        launcher_placement = "centered";
                        launcher_compact = false;
                        launcher_sort_by_usage = false;
                        launcher_show_icons = true;
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
                        empty_color = "tertiary";
                        minimal = true;
                        occupied_color = "tertiary";
                      };
                  };
              };
          };
      };
  }
