{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    extraConfig = ''
      set rnu
      set cursorcolumn
      set cursorline
      set noswapfile
      set hlsearch " `Ctrl-l to clear highlighted search
      " set incsearch " this one is not as good
      set autoindent
      set shiftwidth=4
      set expandtab
      set smarttab
      set backspace=indent,eol,start
      set ruler
      set splitright
      set splitbelow
      set undofile
      set shortmess-=S

      " Increment characters
      " set nrformats+=alpha

      highlight ColorColumn ctermbg=magenta
      call matchadd('ColorColumn', '\%81v', 100)

      highlight CursorColumn ctermbg=238
      highlight CursorLine cterm=NONE ctermbg=238

      " Bracket autocomplete
      inoremap { {}<Esc>ha
      inoremap ( ()<Esc>ha
      inoremap [ []<Esc>ha
      " inoremap " ""<Esc>ha
      " inoremap ` ``<Esc>ha

    '';
  };

  # TODO: telescope / class tree / file tree? / file navigation; vifm? / hierarchy view / context display
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

  #TODO: emacs

}
