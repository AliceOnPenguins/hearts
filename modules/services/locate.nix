{ self, inputs, ... }: {
    flake.nixosModules.locateService = { pkgs, lib, ... }: {
        services.locate = {
            enable = true;
            interval = "hourly";
            output = "/var/cache/locatedb";
          };
      };
  }
