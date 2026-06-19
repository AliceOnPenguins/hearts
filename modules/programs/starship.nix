{ self, inputs, ... }: {
    flake.homeModules.starship = { pkgs, lib, ... }: {
      programs.starship = {
          enable = true;
          enableFishIntegration = true;
          settings = {
            palette = "noctalia";
    
            format = "[╭](dimmed white)[─](dimmed white)[ $username](bold yellow)[ in](dimmed white) [$directory](white)$git_branch$git_status\n[╰─❯](dimmed white) ";
                      username = {
                          format = "[$user]($style)";
                          show_always = true;
                          style_user = "bold yellow";
                        };
                      directory = {
                          format = "[ ](yellow)[$path](yellow)";
                          truncation_length = 3;
                          truncate_to_repo = true;
                          style = "";
                        };
                      git_branch = {
                          format = " [[ ](green bold)$branch](lavender)";
                          symbol = "";
                        };
                      git_status = {
                          format = "[ $all_status$ahead_behind](yellow)";
                          conflicted = "=";
                          ahead =	"⇡\${count}";
                          behind = "⇣\${count}";
                          diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
                          up_to_date = " 󰄬 ";
                          untracked = " ?\${count} ";
                          stashed = " 󰏖 ";
                          modified = " !\${count} ";
                          staged = " +\${count} ";
                          renamed = " »\${count} ";
                          deleted = " 󰅖\${count} ";
                        };
                      character = {
                          success_symbol = "";
                          error_symbol = "";
                        };
                      palettes.noctalia = {
                          # Standard colors
                          blue      = "#a8cede";
                          red       = "#e8835a";
                          green     = "#b8d8a0";
                          yellow    = "#f4c97a";
                          cyan      = "#c4e0ee";
                          magenta   = "#7aaec8";
                          white     = "#f0ecec";
                          black     = "#1c1c1c";
                          # Extended palette (Catppuccin-compatible names)
                          rosewater = "#f7dfa0";
                          flamingo  = "#f0a080";
                          pink      = "#a8cede";
                          mauve     = "#7aaec8";
                          maroon    = "#f0a080";
                          peach     = "#f7dfa0";
                          teal      = "#c4e0ee";
                          sky       = "#daf0f8";
                          sapphire  = "#c4e0ee";
                          lavender  = "#a8cede";
                          # Text shades
                          text      = "#f0ecec";
                          subtext1  = "#f0ecec";
                          subtext0  = "#505050";
                          # Surface shades
                          overlay2  = "#505050";
                          overlay1  = "#505050";
                          overlay0  = "#1c1c1c";
                          surface2  = "#1c1c1c";
                          surface1  = "#1c1c1c";
                          surface0  = "#070707";
                          base      = "#070707";
                          mantle    = "#070707";
                          crust     = "#070707";
                        };
            };
      };
    };
  };
}
