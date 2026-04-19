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

  programs.vscode = {
    enable = true;
    # mutableExtensionsDir = false;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          mechatroner.rainbow-csv
          vscodevim.vim
          ms-python.python
        ];
      };
      nordic = {
        extensions = with pkgs.vscode-extensions; [
        ];
      };
    };
  };
}
