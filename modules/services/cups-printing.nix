{ self, inputs, ... }: {
    flake.nixosModules.cups-printing = { pkgs, lib, ... }: {
        services.printing = {
            enable = true;
          };
      };
  }
