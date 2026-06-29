{ self, inputs, ... }: {
    flake.nixosModules.boot = { pkgs, lib, ... }: {
        boot = {
            loader.systemd-boot.enable = true;
            loader.efi.canTouchEfiVariables = true;
            kernelPackages = pkgs.linuxPackages_zen;
          };
      };
  }
