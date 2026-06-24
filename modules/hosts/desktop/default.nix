{ self, inputs, ... }: {
    flake.nixosConfigurations.hearts = inputs.nixpkgs.lib.nixosSystem {
        modules = [

        ({ ... }: {
          imports = [ inputs.aagl.nixosModules.default ];
          nix.settings = inputs.aagl.nixConfig;
          programs.anime-game-launcher.enable = true;
        })


        # cachy kernel
        ({ pkgs, ... }: {
          nixpkgs.overlays = [ inputs.nix-cachyos-kernel.overlays.default ];
          boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-bore-x86_64-v3;
        })

        self.nixosModules.heartsConfiguration
        self.nixosModules.home-manager
        self.nixosModules.gnome-keyring
        self.nixosModules.defaultShell
        self.nixosModules.cups-printing
        self.nixosModules.pipewire
        self.nixosModules.networking
        self.nixosModules.time-locale
        self.nixosModules.bootloader
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
