{ self, inputs, lib, ... }: {
    flake.nixosModules.heartsHardware = { pkgs, lib, config, modulesPath, ... }: {

      imports =
        [ (modulesPath + "/installer/scan/not-detected.nix")
        ];
    
      boot.initrd.availableKernelModules = [ "vmd" "xhci_pci" "ahci" "nvme" "usbhid" "uas" "sd_mod" ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "kvm-intel" ];
      boot.extraModulePackages = [ ];
    
      fileSystems."/" =
        { device = "/dev/disk/by-uuid/65db675f-7bfd-48d9-acfe-d329b6c60567";
          fsType = "btrfs";
          options = [ "subvol=@" "compress=zstd" "noatime" "space_cache=v2" ];
        };
    
      fileSystems."/home" =
        { device = "/dev/disk/by-uuid/65db675f-7bfd-48d9-acfe-d329b6c60567";
          fsType = "btrfs";
          options = [ "subvol=@home" "compress=zstd" "noatime" "space_cache=v2" ];
        };
    
      fileSystems."/snapshots" =
        { device = "/dev/disk/by-uuid/65db675f-7bfd-48d9-acfe-d329b6c60567";
          fsType = "btrfs";
          options = [ "subvol=@snapshots" "compress=zstd" "noatime" "space_cache=v2" ];
        };
    
      fileSystems."/var/log" =
        { device = "/dev/disk/by-uuid/65db675f-7bfd-48d9-acfe-d329b6c60567";
          fsType = "btrfs";
          options = [ "subvol=@var_log" "compress=zstd" "noatime" "space_cache=v2" ];
        };
    
      fileSystems."/boot" =
        { device = "/dev/disk/by-uuid/BFF8-3D68";
          fsType = "vfat";
          options = [ "fmask=0077" "dmask=0077" ];
        };
    
      fileSystems."/mnt/games" =
        { device = "/dev/disk/by-uuid/e95e9514-41e1-4adc-8a8e-3e9f164c44ab";
          fsType = "ext4";
          options = [ "noatime" ];
        };
    
      swapDevices =
        [ { device = "/dev/disk/by-uuid/967084c3-d3b7-4c0e-a2b2-407d58ac13b7"; }
        ];
    
      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
