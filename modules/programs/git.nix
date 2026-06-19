{ self, inputs, ... }: {
  flake.homeModules.git = { pkgs, lib, ... }: {
    programs.git = {
      enable = true;
      settings = {
          user.name = "Ferret";
          user.email = "73801176+ferretirl@users.noreply.github.com";
        };
    };
  };
}
