{ self, inputs, ... }: {
    flake.homeModules.firefox = { pkgs, lib, ... }: {
        programs.firefox = {
            enable = true;
            package = pkgs.firefox-bin;
            languagePacks = ["en-US"];
            policies = import ../../config/policies-config.nix;

            profiles.default = {
                isDefault = true;

                settings = {
                    "browser.aboutConfig.showWarning" = false;
                    "browser.tabs.warnOnClose" = false;
                    "media.videocontrols.picture-in-picture.video-toggle.enabled" = true;
                    "browser.gesture.swipe.left" = "";
                    "browser.gesture.swipe.right" = "";
                    "browser.tabs.hoverPreview.enabled" = true;
                    "browser.newtabpage.activity-stream.feeds.topsites" = false;
                    "browser.topsites.contile.enabled" = false;
                    "browser.translations.enable" = false;
                    "privacy.resistFingerprinting" = false;
                    "privacy.resistFingerprinting.randomization.canvas.use_siphash" = true;
                    "privacy.resistFingerprinting.randomization.daily_reset.enabled" = true;
                    "privacy.resistFingerprinting.randomization.daily_reset.private.enabled" = true;
                    "privacy.resistFingerprinting.block_mozAddonManager" = true;
                    "privacy.spoof_english" = 1;
                    "privacy.firstparty.isolate" = false;
                    "network.cookie.cookieBehavior" = 5;
                    "dom.battery.enabled" = false;
                    "gfx.webrender.all" = true;
                    "network.http.http3.enabled" = true;
                    "network.socket.ip_addr_any.disabled" = true;
                    "browser.ai.control.default" = "none";
                    "browser.ai.control.linkPreviewKeyPoints" = "none";
                    "browser.ai.control.pdfjsAltText" = "none";
                    "browser.ai.control.sidebarChatbot" = "none";
                    "browser.ai.control.smartTabGroups" = "none";
                    "browser.ai.control.smartWindow" = "none";
                    "browser.ai.control.translations" = "none";
                    "browser.ml.enable" = false;
                };

                search = import ../../config/search-config.nix { inherit pkgs; };
            };
        };
    };
}
