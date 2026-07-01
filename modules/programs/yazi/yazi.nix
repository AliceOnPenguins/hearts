{ self, inputs, ... }: {
    flake.homeModules.yazi = { pkgs, lib, ... }: {
        programs.yazi = {
            enable = true;
          };
        xdg.configFile."yazi/keymap.toml".source = ./yazi/keymap.toml;
        xdg.configFile."yazi/theme.toml".source = ./yazi/theme.toml;
        xdg.configFile."yazi/yazi.toml".source = ./yazi/yazi.toml;
        xdg.configFile."yazi/package.toml".source = ./yazi/package.toml;
      };
  }
