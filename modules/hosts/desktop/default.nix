{ self, inputs, ... }: {
    flake.nixosConfigurations.hearts = inputs.nixpkgs.lib.nixosSystem {
        modules = [

        ({ ... }: {
          imports = [ inputs.aagl.nixosModules.default ];
          nix.settings = inputs.aagl.nixConfig;
          programs.anime-game-launcher.enable = true;
        })

        self.nixosModules.heartsConfiguration
        self.nixosModules.home-manager
        self.nixosModules.gnome-keyring
        self.nixosModules.defaultShell
        self.nixosModules.cups-printing
        self.nixosModules.pipewire
        self.nixosModules.networking
        self.nixosModules.time-locale
        self.nixosModules.boot
        self.nixosModules.usersAlice
        self.nixosModules.systemPackages
        self.nixosModules.consoleSetup
        self.nixosModules.fontSetup
        self.nixosModules.flatpak
        self.nixosModules.locateService
        ];
        specialArgs = { inherit inputs; };
      };
  }
