{
  programs.firefox.profiles.default.bookmarks = {
    force = true;
    settings = [
      {
        name = "Misc";
        bookmarks = [
          {
            name = "git";
            url = "https://github.com/bschan9228/%s?tab=repositories";
            keyword = "g";
          }
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
            name = "translate";
            keyword = "translate";
            url = "https://www.google.com/translate";
          }
          {
            name = "maps";
            keyword = "maps";
            url = "https://www.google.com/maps";
          }
          {
            name = "youtube";
            url = "https://www.youtube.com";
          }
          {
            name = "gitlab";
            url = "https://www.gitlab.com";
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
          {
            name = "chatgpt";
            url = "https://www.chatgpt.com";
          }
          {
            name = "ebay";
            url = "https://www.ebay.com";
          }
        ];
      }
    ];
  };
}
