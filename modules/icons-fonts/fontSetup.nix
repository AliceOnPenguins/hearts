{ self, inputs, ... }: {
    flake.nixosModules.fontSetup = { pkgs, lib, ... }: {
        fonts = {
            packages = with pkgs; [
              nerd-fonts.jetbrains-mono
              noto-fonts
              noto-fonts-cjk-sans
              noto-fonts-color-emoji
            ];
          };
      };
  }
