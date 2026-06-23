{ self, inputs, ... }: {
    flake.homeModules.fish = { pkgs, lib, ... }: {
      programs.fish = {
        enable = true;
        shellAliases = {
          vi = "nvim";
          ls = "eza --icons -a";
          nrs = "sudo nixos-rebuild switch --flake ~/mustelid#mustelid";
          nru = "sudo nix flake update --flake ~/mustelid && sudo nixos-rebuild switch --flake ~/mustelid#mustelid";
          nsp = "nix search nixpkgs";
          ngc = "sudo nix-collect-garbage -d";
          nem = "yazi ~/mustelid/";
        };
        interactiveShellInit = ''
          set fish_greeting
          fastfetch 
        '';
      };

    };
}
