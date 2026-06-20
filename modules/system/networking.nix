{ self, inputs, ... }:{
    flake.nixosModules.networking = { pkgs, lib, ... }: {
        networking = {
          hostName = "mustelid";
          networkmanager = {
            enable = true;
          };
        };
      };
  }
