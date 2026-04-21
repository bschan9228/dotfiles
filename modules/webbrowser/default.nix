{ config, pkgs, inputs, ... }:

 {
  programs.firefox = {
    enable = true;
    profiles.default = {
      # about:config
      settings = {
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.urlbar.autoFill.adaptiveHistory.enabled" = true;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "identity.fxaccounts.enabled" = false;
        "browser.newtabpage.activity-stream.showWeather" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.urlbar.suggest.trending" = false;

        # Firefox development tools
        # Open using `Ctrl` + `Alt` + `Shift` + `I`
        "devtools.chrome.enabled" = true;
        "devtools.debugger.remote-enabled" = true;
        # "devtools.debugger.prompt-connection" = false;
      };

      # disables sidebar
      userChrome = ''
        toolbarbutton[id*="sidebar"] {
          display: none !important;
        }
      '';

      extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        sponsorblock
        vimium
      ];

      bookmarks = {
        force = true;
        settings = [
          {
            name = "Misc";
            bookmarks = [
              {
                name = "wikipedia";
                tags = [ "wiki" ];
                keyword = "wiki";
                url = "https://www.wikipedia.com";
              }
              {
                name = "google";
                url = "https://www.google.com";
              }
              {
                name = "youtube";
                url = "https://www.Youtube.com";
              }
              {
                name = "github";
                url = "https://www.github.com";
              }
              {
                name = "amazon";
                url = "https://www.amazon.com";
              }
              {
                name = "maps";
                url = "https://www.maps.google.com";
              }
              {
                name = "onshape";
                url = "https://www.cad.onshape.com";
              }
              {
                name = "reddit";
                url = "https://www.reddit.com";
              }
              {
                name = "yahoo finance";
                url = "https://www.finance.yahoo.com";
              }
              {
                name = "aliexpress";
                url = "https://www.aliexpress.com";
              }
            ];
          }
        ];
      };
    };
  };
}
