{ self, inputs, ... }: {
    flake.nixosModule.defaultShell = { pkgs, lib, ... }: {
        users.defaultUserShell = pkgs.fish;
      };
}
