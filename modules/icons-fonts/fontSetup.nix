{ self, inputs, ... }: {
    flake.nixosModules.fontSetup = { pkgs, lib, ... }: {
        fonts = {
            packages = [
              pkgs.nerd-fonts.jetbrains-mono
            ];
          };
      };
  }
