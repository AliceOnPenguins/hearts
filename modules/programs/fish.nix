{ self, inputs, ... }: {
    flake.homeModules.fish = { pkgs, lib, ... }: {
      programs.fish = {
        enable = true;
        shellAliases = {
          vi = "nvim";
          ls = "eza --icons -a";
          nrs = "sudo nixos-rebuild switch --flake ~/hearts#hearts";
          nru = "sudo nix flake update --flake ~/hearts && sudo nixos-rebuild switch --flake ~/hearts#hearts";
          nsp = "nix search nixpkgs";
          ngc = "sudo nix-collect-garbage -d";
          nem = "yazi ~/hearts/";
        };
        interactiveShellInit = ''
          set fish_greeting
          hyfetch
        '';
      };

    };
}
