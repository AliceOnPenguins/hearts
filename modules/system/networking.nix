{ self, inputs, ... }:{
    flake.nixosModules.networking = { pkgs, lib, ... }: {
        networking = {
          hostName = "hearts";
          networkmanager = {
            enable = true;
          };
        };
      };
  }
