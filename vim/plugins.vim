filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required



Plugin 'fatih/vim-go'                                     " go plugin
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'VundleVim/Vundle.vim'                             " package manager
Plugin 'autowitch/hive.vim'
Plugin 'posva/vim-vue'                                    " vue syntax support
Plugin 'altercation/vim-colors-solarized'                 " colorscheme
Plugin 'ctrlpvim/ctrlp.vim'                               " fuzzy file, buffer, mru, tag, etc finder
Plugin 'tpope/vim-vinegar'                                " - quick file browse
Plugin 'scrooloose/nerdtree'                              " sidebar file browser
Plugin 'scrooloose/nerdcommenter'                         " nerd commenter TODO
Plugin 'godlygeek/tabular'                                " make table
Plugin 'majutsushi/tagbar'                                " sidebar tag
Plugin 'ervandew/supertab'                                " tab completion
Plugin 'terryma/vim-multiple-cursors'                     " multiple cursor
" ------------------ web site related plugins------------
Plugin 'pangloss/vim-javascript'
Plugin 'gregsexton/matchtag'                              " match html tag
Plugin 'othree/html5.vim'                                 " html5 tag colors
Plugin 'mattn/emmet-vim'                                  " abbreviation expansion formal zen-coding
Plugin 'StanAngelOff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'                      " namesapce expansion
"Plugin 'SirVer/ultisnips'                                 " code snips
Plugin 'tobyS/vmustache'                                  " dep
Plugin 'tobyS/pdv'                                        " php documentation

Plugin 'tpope/vim-surround'                               " add change and delete surroundings
Plugin 'tpope/vim-fugitive'                               " git plugin
Plugin 'scrooloose/syntastic'                             " syntax check
Plugin 'rking/ag.vim'                                     " vim plugin for the_silver_searcher
Plugin 'skwp/greplace.vim'                                " batch grep and replace
" Plugin 'msanders/snipmate.vim'                          " not maintained
Plugin 'MarcWeber/vim-addon-mw-utils'                     " dep
Plugin 'tomtom/tlib_vim'                                  " dep
Plugin 'garbas/vim-snipmate'                              " fork of snipmate.vim
Plugin 'file:///Users/contender/.vim/bundle/vim-peepopen' " dropdown menu for choosing file
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'sjl/gundo.vim'                                    " change history window
                                                          " Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'                          " TODO bad visual effects why?
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'powerline/fonts'
" Plugin 'powerline/powerline'
Plugin 'mxw/vim-jsx'                                      " React jsx hightlight



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
