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
      };

    };

  };
}
