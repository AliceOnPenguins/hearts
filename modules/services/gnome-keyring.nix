{ self, inputs, ... }: {
    flake.nixosModules.gnome-keyring = { pkgs, lib, ... }: {
        services.gnome.gnome-keyring = {
            enable = true;
          };
      };
  }
