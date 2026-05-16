{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    # TODO: start position to last quit
    extraConfig = ''
      set nu rnu
      set cursorcolumn
      set cursorline
      set noswapfile
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
      " set nowrap " disable text wrapping

      " Increment characters
      " set nrformats+=alpha

      " set hlsearch " `Ctrl-l` to clear highlighted search
      augroup auto-highlight
        au!
        autocmd CmdlineEnter /,\? :set hlsearch
        autocmd CmdlineLeave /,\? :set nohlsearch
      augroup END

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

    plugins = with pkgs.vimPlugins; [
      vim-surround # cs[']["] & ys1w[]] / yss[)]
      vim-table-mode
    ];
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
#  programs.emacs = {
#    enable = true;
#    package = pkgs.emacs-pgtk;
#    extraPackages = epkgs: with epkgs; [
#      evil
#    ];
#
#    extraConfig = ''
#      (require 'package)
#      (add-to-list 'package-archives
#                   '("melpa" . "https://mepla.org/packages/))
#      (package-initialize)
#      (packages-refresh-contents)
#
#      (unless (package-installed-p 'evil)
#        (package-install 'evil))
#
#      (require 'evil)
#      (evil-mode 1)
#    '';
#  };

}
