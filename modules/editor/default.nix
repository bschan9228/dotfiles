{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    extraConfig = ''
      set rnu
      set expandtab
      set cursorcolumn
      set noswapfile
      set hlsearch " `Ctrl-l to clear highlighted search
      " set incsearch " this one is not as good
      set autoindent
      set smarttab
      set backspace=indent,eol,start
      set ruler
      set splitright
      set splitbelow
      set undofile

      " Bracket autocomplete
      inoremap { {}<Esc>ha
      inoremap ( ()<Esc>ha
      inoremap [ []<Esc>ha
      " inoremap " ""<Esc>ha
      " inoremap ` ``<Esc>ha

    '';
  };

  programs.neovim = {
    # enable = true; # Somehow enable is not working
    extraConfig = ''
    '';
  };

  programs.vscode = {
    enable = true;
    # mutableExtensionsDir = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          mechatroner.rainbow-csv
          vscodevim.vim
          ms-python.python
        ];
      };
      nordic = {
        extensions = []
        ++ 
        pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "nrf-connect";
            publisher = "nordic-semiconductor";
            version = "2026.4.1637";
            sha256 = "sha256-tL/CCb/uV6rCa70g/qJFHn8ybM3iowJUC4LWXOwkEwY=";
          }
        ];
      };
    };
  };
}
