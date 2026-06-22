{ self, inputs, ... }: {
  flake.nixosModules.home-manager = { pkgs, lib, ... }: {
    imports = [ inputs.home-manager.nixosModules.home-manager ];
    home-manager = {        
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs self; };
      users.ferret = {
        home.username = "ferret";
        home.homeDirectory = lib.mkForce "/home/ferret";
        home.stateVersion = "26.11";
        imports = builtins.attrValues self.homeModules;
        home.packages = with pkgs; [
            neovim
            ncdu
            eza
            yazi
            tree
            protonplus
            prismlauncher
            hyprshot
            hyprpicker
            grim
            slurp
            faugus-launcher
            bitwarden-desktop
            inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
            inputs.helium.packages.${system}.default
            filezilla
            proton-vpn
            ];
      };

    };

  };
}
