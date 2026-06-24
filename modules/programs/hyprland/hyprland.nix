{ self, inputs, config, lib, ... }: {
    flake.homeModules.hyprland = { pkgs, lib, config, ... }: {
        wayland.windowManager.hyprland = {
            enable = true;
            package = null;
            portalPackage = null;
            systemd.enable = false;
          };
        xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink "/home/alice/hearts/modules/programs/hyprland/hypr";
      };
  }
