{ self, inputs, ... }: {
    flake.homeModules.fish = { pkgs, lib, ... }: {
      programs.fish = {
        enable = true;
        shellAliases = {
          vi = "nvim";
          ls = "eza --icons -a";
          nrs = "sudo nixos-rebuild switch --flake ~/nixos-dots#mustelid";
          nru = "sudo nix flake update --flake ~/nixos-dots && sudo nixos-rebuild switch --flake ~/nixos-dots#mustelid";
          neh = "nvim ~/nixos-dots/home.nix";
          nef = "nvim ~/nixos-dots/flake.nix";
          nec = "nvim ~/nixos-dots/configuration.nix";
          nsp = "nix search nixpkgs";
          ngc = "sudo nix-collect-garbage -d";
          nem = "yazi ~/nixos-dots/";
        };
        interactiveShellInit = ''
          set fish_greeting
          hyfetch
        '';
      };

    };
}
