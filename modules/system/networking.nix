{ self, inputs, ... }:{
    flake.nixosModules.networkmanager = { pkgs, lib, ... }: {
        networking = {
          hostName = "mustelid";
          networkmanager = {
            enable = true;
          };
        };
      };
  }
