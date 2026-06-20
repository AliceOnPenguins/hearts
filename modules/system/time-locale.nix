{ self, inputs, ... }: {
    flake.nixosModules.time-locale = { pkgs, lib, ... }: {
        time = {
          timeZone = "Europe/Prague";
        };
        i18n.defaultLocale = "en_US.UTF-8";
      };
  }
