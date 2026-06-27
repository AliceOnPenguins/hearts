{ self, inputs, ... }: {
  flake.nixosModules.home-manager = { pkgs, lib, ... }: {
    imports = [ inputs.home-manager.nixosModules.home-manager ];
    home-manager = {        
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs self; };
      users.alice = {
        home.username = "alice";
        home.homeDirectory = lib.mkForce "/home/alice";
        home.stateVersion = "26.11";
        imports = builtins.attrValues self.homeModules;
        home.packages = with pkgs; [
            neovim
            # rembg
            _7zz
            oculante
            lxqt.pavucontrol-qt
            obs-studio
            gimp
            mpv
            adw-gtk3
            papirus-icon-theme
            nwg-look
            qt6Packages.qt6ct
            ncdu
            eza
            yazi
            tree
            protonplus
            prismlauncher
            hyprpicker
            grim
            slurp
            faugus-launcher
            bitwarden-desktop
            filezilla
            proton-vpn
            ];
      };
    };
  };
}
