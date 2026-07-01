{ self, inputs, ... }: {
    flake.homeModules.fastfetch = { pkgs, lib, ... }: {
       programs.fastfetch = {
           enable = true;
           settings = {
             "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
             logo = {
               type = "auto";
               source = "~/bias/modules/programs/fastfetch/assets/yunah.webp";
               height = 20;
               width = 32;
               padding = {
                 top = 1;
                 left = 2;
               };
             };
             display = {
               separator = "  ";
             };
             modules = [
               "break"
               {
               type = "title";
               format = "┏━━━━━━━━━━━━━━━{user-name}@{host-name}━━━━━━━━━━━━━━━┓";
               }
               "break"
               {
               type = "os";
               key = "    ";
               keyColor = "blue";
               }
               {
               type = "kernel";
               key = "    ";
               keyColor = "blue";
               }
               {
               type = "packages";
               key = "   󰮯 ";
               format = "{nix-all} (nix) {flatpak-all} (flatpak)";
               keyColor = "blue";
               }
               {
               type = "wm";
               key = "   󰨇 ";
               keyColor = "blue";
               }
               {
               type = "terminal";
               key = "    ";
               keyColor = "blue";
               }
               {
               type = "shell";
               key = "    ";
               keyColor = "blue";
               }
               {
               type = "localip";
               key = "   󰈀 ";
               keyColor = "blue";
               }
               "break"
               {
               type = "custom";
               format = "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫";
               }
               "break"
               {
               type = "host";
               key = "    ";
               keyColor = "blue";
               }
               {
               type = "gpu";
               key = "   󱤓 ";
               keyColor = "blue";
               }
               {
               type = "display";
               key = "   󰍹 ";
               keyColor = "blue";
               }
               {
               type = "memory";
               key = "   󰍛 ";
               keyColor = "blue";
               }
               {
               type = "disk";
               key = "    ";
               keyColor = "blue";
               }
               "break"
               {
               type = "custom";
               format = "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛";
               }
            ];
          };
       };
    };
}
