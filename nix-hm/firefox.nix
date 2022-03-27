{ config, pkgs, ... }: {
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball
      "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
  };
  programs.firefox = {
    enable = true;
    # https://github.com/nix-community/nur-combined/blob/master/repos/rycee/pkgs/firefox-addons/generated-firefox-addons.nix
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      bitwarden
      privacy-badger
      ublock-origin
      vimium
      facebook-container
      localcdn
      link-cleaner
    ];

    profiles = {
      default = {
        isDefault = true;
        bookmarks = {
          wikipedia = {
            keyword = "wiki";
            url =
              "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
          };
        };
        settings = {
          # Show your windows and tabs from last time
          "browser.startup.page" = 3;
          # Client side title bar
          "browser.tabs.drawInTitlebar" = true;
          # Enable u2f support
          "security.webauth.u2f" = true;
          # Disable web site notifications
          "dom.webnotifications.enabled" = false;
          # Disable remembering of logins and passwords for websites
          "signon.rememberSignons" = false;
          # Disable full screen animation
          "toolkit.cosmeticAnimations.enabled" = false;
          # Set do not track header
          "privacy.donottrackheader.enabled" = true;
          "privacy.donottrackheader.value" = 1;
          "privacy.trackingprotection.enabled" = true;
          # Cleanup new tab
          "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
          "browser.newtabpage.activity-stream.feeds.snippets" = false;
          "browser.newtabpage.activity-stream.prerender" = false;
          "browser.newtabpage.activity-stream.showTopSites" = false;
          # Privacy
          "dom.security.https_only_mode" = true;
          "network.http.referer.spoofSource" = true;
          "browser.send_pings" = false;
          # "network.http.referer.XOriginPolicy" = 2;
          # "network.http.referer.XOriginTrimmingPolicy" = 2;
          # "network.http.referer.trimmingPolicy" = 1;
          # Hardware acceleration
          "media.ffmpeg.vaapi.enabled" = true;
          "media.rdd-ffmpeg.enabled" = true;
        };
        # extraConfig
        # Extra preferences to add to user.js.
      };
    };
  };

  home.sessionVariables = { MOZ_USE_XINPUT2 = "1"; };
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.firefox.enable
  # https://gitlab.com/rycee/configurations/-/blob/master/user/firefox.nix
}
