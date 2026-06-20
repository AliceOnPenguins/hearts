{ self, inputs, ... }: {
    flake.nixosModules.mustelidConfiguration = { pkgs, lib, ... }: {
        imports = [
        self.nixosModules.mustelidHardware
        ];

         nix.settings = {
         experimental-features = [ "nix-command" "flakes" ];
         trusted-users = [ "root" "ferret" "@wheel" ];
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
       
         networking.hostName = "mustelid";

         users.defaultUserShell = pkgs.fish;
       
         boot.loader.systemd-boot.enable = true;
         boot.loader.efi.canTouchEfiVariables = true;
       
         networking.networkmanager.enable = true;
       
         time.timeZone = "Europe/Prague";
         i18n.defaultLocale = "en_US.UTF-8";
       
         console = {
            font = "${pkgs.terminus_font}/share/consolefonts/ter-132b.psf.gz";
            keyMap = "us";
         };
       
         fonts.packages = [
           pkgs.nerd-fonts.jetbrains-mono
         ];
       
         programs.fish.enable = true;
         programs.steam.enable = true;
       
         programs.hyprland = {
            enable = true;
            withUWSM = true;
            xwayland.enable = true;
            };
       
         environment.systemPackages = with pkgs; [
           git
           wget
           gcc
           inputs.helium.packages.${system}.default
           tree-sitter
           psmisc
           terminus_font
         ];
       
       
          users.users.ferret = {
            isNormalUser = true;
            extraGroups = [ "wheel" "video" "audio" "input" "networkmanager" ];
            home = "/home/ferret";
            packages = with pkgs; [
              tree
            ];
          };
       
         # Enable sound.
         services.pipewire = {
           enable = true;
           pulse.enable = true;
         };
       
         nixpkgs.config = {
           permittedInsecurePackages = [
              "electron-39.8.10"
           ];
           allowUnfree = true;
         };
       
         # DO NOT CHANGE THIS VALUE MANUALLY
         system.stateVersion = "26.11"; # Did you read the comment?
    };
}
