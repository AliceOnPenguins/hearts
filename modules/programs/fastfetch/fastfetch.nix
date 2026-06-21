{ self, inputs, ... }: {
    flake.homeModules.fastfetch = { pkgs, lib, ... }: {

       programs.fastfetch = {
           enable = true;
           settings = {
             "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
             logo = {
               type = "auto";
               source = "nixos";
               color = {
                 "1" = "blue";
               };
               padding = {
                 top = 2;
                 left = 4;
               };
             };
             display = {
               separator = "  ";
             };
             modules = [
               "break"
               "break"
               {
               type = "title";
               format = "┏━━━━━━━━━━━━━━{user-name}@{host-name}━━━━━━━━━━━━━━┓";
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
