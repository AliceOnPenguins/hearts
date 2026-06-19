{ self, inputs, ... }: {
  flake.nixosModules.home-manager = { pkgs, lib, ... }: {
    imports = [ inputs.home-manager.nixosModules.home-manager ];
    home-manager = {        
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs self; };
      users.ferret = {
        home.username = "ferret";
        home.homeDirectory = "/home/ferret";
        home.stateVersion = "26.11";
        imports = builtins.attrValues self.homeModules;
        home.packages = with pkgs; [
            neovim
            ncdu
            eza
            hyfetch
            yazi
            protonplus
            prismlauncher
            hyprshot
            hyprpicker
            grim
            slurp
            equibop
            faugus-launcher
            bitwarden-desktop
            inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
            ];
      };

    };

  };
}
