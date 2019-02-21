"""""""""""""""""""""""""""""
" Beginning of Vundle Stuff "
"""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Plugins
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'morhetz/gruvbox'        " Just a colorscheme
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'zefei/vim-wintabs'
Plugin 'zefei/vim-wintabs-powerline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'

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
"""""""""""""""""""""""
" End of Vundle Stuff "
"""""""""""""""""""""""
set hidden                                          " Without this, I can't switch buffers without saving.
set number                                          " Line Numbers
set expandtab                                       " Spaces over tabs
set autoindent                                      " Auto indent
set tabstop=4                                       " Number of spaces in visual
set softtabstop=4                                   " Number of spaces when editing.
set shiftwidth=4                                    " Same.
set fileformat=unix                                 " Especially useful for line endings LF vs. CR LF
set hlsearch                                        " Highlighting Search terms
set incsearch                                       " Search as characters are entered
set encoding=utf-8                                  " utf-8 ftw
set background=dark                                 " This in combination with colorscheme below for aesthetics.
set cursorline                                      " Highlight current line
set wildmenu                                        " Visual autocomplete for command menu
set lazyredraw                                      " Redraw only when we need to.
set showmatch                                       " Highlight matching [{()}]
set foldenable                                      " Enable folding
set foldlevelstart=10                               " Open most folds by default
set foldnestmax=10                                  " 10 nested fold max
set foldmethod=indent                               " fold based on indent level
set title                                           " Set the window’s title, reflecting the file currently being edited.
set backspace=indent,eol,start                      " Allow backspacing over indention, line breaks and insertion start.
set confirm                                         " Display a confirmation dialog when closing an unsaved file.
set laststatus=2                                    " Always display status line.
set showtabline=2                                   " Always display the tabline, even if there is only one tab
set noshowmode                                      " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12  " For GVim on Linux need the pre patched fonts for powerline
set lines=45                                        " Setting the initial opening window size for GVim
set columns=150                                     " Setting the initial opening window size for GVim
set switchbuf=usetab                                " See :help switchbuf for details. This is awesome!

let g:indent_guides_enable_on_vim_startup = 1       " For vim-indent-guides Plugin. enable indent guides by default

" Syntastic recommended settings.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" My own Syntastic stuff.
let g:syntastic_python_checkers = ['flake8']

" Experimental with whitespace settings
set list listchars=tab:→\ ,trail:·,eol:$,extends:>,precedes:<,nbsp:_

syntax enable           " syntax ftw
colorscheme gruvbox     " Let's try this out...

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" Space open/closes folds
nnoremap <space> za
" Switching between buffers
nnoremap  <silent>   <tab>  :bnext<CR>
nnoremap  <silent> <s-tab>  :bprevious<CR>
" Hit <F2> to wrap horizontal lines with scroll-bar or not.
nnoremap <silent><expr> <f2> ':set wrap! go'.'-+'[&wrap]."=b\r"
"JSON Format
nmap =j :%!python -m json.tool<CR>
" NerdTree Toggle
map <leader>n :NERDTreeToggle<CR>
" Auto Close if NerdTree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Powerline Status Line
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
