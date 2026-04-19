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
      set backspace=indent,eol,start
      set ruler
      set splitright
      set splitbelow
      set undofile
    '';
  };
}
