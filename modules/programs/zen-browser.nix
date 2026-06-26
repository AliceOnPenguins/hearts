{ self, inputs, ... }: {
    flake.homeModules.zen-browser = { pkgs, lib, ... }: {
        imports = [
            inputs.zen-browser.homeModules.twilight
        ];
        
    programs.zen-browser = {
      enable = true;
      languagePacks = ["en-US"];
      policies = import ../../config/policies-config.nix;
      setAsDefaultBrowser = true;
      enablePrivateDesktopEntry = false;
  
      profiles.default = rec {
        settings = {
          "zen.workspaces.continue-where-left-off" = true;
          "zen.workspaces.natural-scroll" = true;
          "zen.view.compact.hide-tabbar" = true;
          "zen.view.compact.hide-toolbar" = false;
          "zen.view.compact.animate-sidebar" = false;
          "zen.welcome-screen.seen" = true;
          "zen.urlbar.behavior" = "float";
          "zen.window-sync.enabled" = false;
        };
  
        sine = {
          enable = true;
          mods = [
            "253a3a74-0cc4-47b7-8b82-996a64f030d5" # Floating History
            "4ab93b88-151c-451b-a1b7-a1e0e28fa7f8" # No Sidebar Scrollbar
            "7190e4e9-bead-4b40-8f57-95d852ddc941" # Tab title fixes
            "803c7895-b39b-458e-84f8-a521f4d7a064" # Hide Inactive Workspaces
            "906c6915-5677-48ff-9bfc-096a02a72379" # Floating Status Bar
            "a6335949-4465-4b71-926c-4a52d34bc9c0" # Better Find Bar
            "c6813222-6571-4ba6-8faf-58f3343324f6" # Disable Rounded Corners
            "c8d9e6e6-e702-4e15-8972-3596e57cf398" # Zen Back Forward
            "cb15abdb-0514-4e09-8ce5-722cf1f4a20f" # Hide Extension Name
            "d8b79d4a-6cba-4495-9ff6-d6d30b0e94fe" # Better Active Tab
            "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
            "f7c71d9a-bce2-420f-ae44-a64bd92975ab" # Better Unloaded Tabs
            "fd24f832-a2e6-4ce9-8b19-7aa888eb7f8e" # Quietify
            "context-menu-icons"
            "Neo-Zen"
          ];
        };
  
        search = import ../../config/search-config.nix { inherit pkgs; };
  
        containersForce = true;
  
        keyboardShortcutsVersion = 19;
        keyboardShortcuts = [
          # {
          #   id = "zen-compact-mode-toggle";
          #   key = "c";
          #   modifiers.control = true;
          #   modifiers.alt = true;
          # }
          {
            id = "zen-toggle-sidebar";
            key = "x";
            modifiers.control = true;
            modifiers.alt = true;
          }
          {
            id = "key_savePage";
            key = "s";
            modifiers.control = true;
          }
          {
            id = "key_quitApplication";
            disabled = true;
          }
          {
            id = "zen-copy-url";
            disabled = true;
          }
          {
            id = "addBookmarkAsKb";
            disabled = true;
          }
          {
            id = "key_reload";
            key = "r";
            modifiers.control = true;
          }
          {
            id = "key_reload_skip_cache";
            key = "r";
            modifiers = {
              control = true;
              shift = true;
            };
          }
        ];
      };
    };
  };
}
