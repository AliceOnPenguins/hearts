{ self, inputs, ... }: {
    flake.homeModules.fish = { pkgs, lib, ... }: {
      programs.fish = {
        enable = true;
        shellAliases = {
          vi = "nvim";
          ls = "eza --icons -a";
          nrs = "sudo nixos-rebuild switch --flake ~/bias#bias";
          nru = "sudo nix flake update --flake ~/bias && sudo nixos-rebuild switch --flake ~/bias#bias";
          nsp = "nix search nixpkgs";
          ngc = "sudo nix-collect-garbage -d";
          nem = "yazi ~/bias/";
        };
        interactiveShellInit = ''
          set fish_greeting
          fastfetch
        '';
      };

    };
}
