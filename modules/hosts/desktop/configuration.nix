{ self, inputs, ... }: {
    flake.nixosModules.heartsConfiguration = { pkgs, lib, ... }: {
        imports = [
        self.nixosModules.heartsHardware
        ];

         nix.settings = {
         experimental-features = [ "nix-command" "flakes" ];
         trusted-users = [ "root" "alice" "@wheel" ];
         # noctalia + cachy kernel + hyprland
        substituters = [
           "https://hyprland.cachix.org"
         ];
         extra-substituters = [
           "https://noctalia.cachix.org"
           "https://attic.xuyh0120.win/lantian"
           "https://hyprland.cachix.org"
         ];
         extra-trusted-public-keys = [ 
           "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
           "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" 
           "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
         ];
       };
       
         nixpkgs.config = {
           rocmSupport = true;
           permittedInsecurePackages = [
              "electron-39.8.10"
           ];
           allowUnfree = true;
         };
       
         # DO NOT CHANGE THIS VALUE MANUALLY
         system.stateVersion = "26.11"; # Did you read the comment?
    };
}
