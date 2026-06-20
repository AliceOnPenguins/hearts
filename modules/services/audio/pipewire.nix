{ self, inputs, ... }: {
    flake.nixosModules.pipewire = { pkgs, lib, ... }: {
        services.pipewire = {
          enable = true;
          pulse.enable = true;
        };
    };
}
