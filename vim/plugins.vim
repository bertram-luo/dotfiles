filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" ------------------inbox------------
" ------------------common------------
Plugin 'VundleVim/Vundle.vim'                             " package manager
Plugin 'fatih/vim-go'                                     " go plugin, syntax and dev tools
" ------------------edit and browse tools------------
Plugin 'scrooloose/nerdtree'                              " sidebar file browser
Plugin 'scrooloose/nerdcommenter'                         " nerd commenter TODO
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'sjl/gundo.vim'                                    " change history window
Plugin 'tpope/vim-fugitive'                               " git plugin like Gblame
Plugin 'majutsushi/tagbar'                                " sidebar tag
Plugin 'godlygeek/tabular'                                " make table TODO
Plugin 'rking/ag.vim'                                     " vim plugin for the_silver_searcher TODO
Plugin 'skwp/greplace.vim'                                " batch grep and replace TODO
Plugin 'ervandew/supertab'                                " tab completion TODO
                                                          " Plugin 'Valloric/YouCompleteMe'
" ------------------navigator------------
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-vinegar'                                " - quick file browse
Plugin 'ctrlpvim/ctrlp.vim'                               " fuzzy file, buffer, mru, tag, etc finder
" ------------------ markdown ------------------------
Plugin 'iamcco/markdown-preview.vim'                      " markdown, need Vim with support of Python2 or 3
Plugin 'iamcco/mathjax-support-for-mkdp'                     
"------------ syntax, highlight, indent...etc-------
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'                                 " html5 tag colors
Plugin 'StanAngelOff/php.vim'
Plugin 'scrooloose/syntastic'                             " syntax check
Plugin 'autowitch/hive.vim'
Plugin 'posva/vim-vue'                                    " vue syntax support
Plugin 'mxw/vim-jsx'                                      " React jsx hightlight
"------------ color scheme -------
Plugin 'vim-airline/vim-airline'                          " TODO bad visual effects why?
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'powerline/fonts'
" Plugin 'powerline/powerline'
Plugin 'altercation/vim-colors-solarized'                 " colorscheme
Plugin 'KeitaNakamura/neodark.vim'
Plugin 'crusoexia/vim-monokai'
Plugin 'acarapetis/vim-colors-github'
Plugin 'rakr/vim-one'
" ------------------ web site related plugins------------
Plugin 'gregsexton/matchtag'                              " match html tag
Plugin 'mattn/emmet-vim'                                  " abbreviation expansion formal zen-coding
Plugin 'arnaud-lb/vim-php-namespace'                      " namesapce expansion
"Plugin 'SirVer/ultisnips'                                 " code snips
Plugin 'tobyS/vmustache'                                  " dep:Mustache template system for VIMScript
Plugin 'tobyS/pdv'                                        " php documentation
Plugin 'tpope/vim-surround'                               " add change and delete surroundings
" Plugin 'msanders/snipmate.vim'                          " not maintained
Plugin 'stephpy/vim-php-cs-fixer'                         " php-coding-stand fixer
" ------------------misc------------
Plugin 'terryma/vim-multiple-cursors'                     " multiple cursor
Plugin 'MarcWeber/vim-addon-mw-utils'                     " dep:
Plugin 'tomtom/tlib_vim'                                  " dep: Some utility functions for VIM
Plugin 'garbas/vim-snipmate'                              " fork of snipmate.vim
Plugin 'file:///Users/contender/.vim/bundle/vim-peepopen' " dropdown menu for choosing file
" ------------------end of plugin list------------


" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
