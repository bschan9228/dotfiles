{ config, pkgs, inputs, ... }:

 {
  imports = [
    ./bookmarks.nix
  ];

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
        "media.videocontrols.picture-in-picture.enable-when-switching-tabs.enabled" = true;

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
        refined-github
        tree-style-tab
        greasemonkey
        # keepa #TODO: unfree
      ];

    };
  };
}
