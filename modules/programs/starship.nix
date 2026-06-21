{ self, inputs, ... }: {
    flake.homeModules.starship = { pkgs, lib, ... }: {
      programs.starship = {
          enable = true;
          enableFishIntegration = true;
          settings = {
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
            };
      };
    };
}
