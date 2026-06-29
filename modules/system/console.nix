{ self, inputs, ... }: {
    flake.nixosModules.consoleSetup = { pkgs, lib, ... }: {
        console = {
            font = "ter-132b";
            packages = [ pkgs.terminus_font ];
            keyMap = "us";
          };
      };
  }
