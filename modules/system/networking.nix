{ self, inputs, ... }:{
    flake.nixosModules.networking = { pkgs, lib, ... }: {
        networking = {
          hostName = "bias";
          networkmanager = {
            enable = true;
          };
        };
      };
  }
