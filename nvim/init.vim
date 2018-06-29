set nocompatible

color elflord
set number

set nohlsearch
set ignorecase

set autoindent
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smarttab
set nowrap

syntax on
filetype plugin indent on
set encoding=UTF-8

" pathogen
execute pathogen#infect()

" vundle
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plugin 'scrooloose/nerdtree'
Plugin 'vimwiki/vimwiki'

if $TERM != "linux"
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'ryanoasis/vim-devicons'
    Plugin 'dracula/vim'
endif

call vundle#end()

" nerdtree symbols
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

if $TERM != "linux"
    set noshowmode
    
    set termguicolors
    color dracula
    
    " airline
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#syntastic#stl_format_err = 1
    let g:airline#extensions#syntastic#stl_format_warn = 1

    " nerdtree symbols
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'
    
    " webdevicons
    let g:webdevicons_enable = 1
    let g:webdevicons_enable_nerdtree = 1
    let g:webdevicons_enable_airline_statusline = 1
    let g:webdevicons_enable_airline_tabline = 1
    let g:WebDevIconsUnicodeDecorateFolderNodes = 1
endif

"hi Normal guibg=NONE ctermbg=NONE
"hi VertSplit cterm=NONE

" nerdtree no file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" nerdtree directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" nerdtree toggle shorcut
map <C-n> :NERDTreeToggle<CR>

" nerdtree autoclose
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" shift tab
" for command mode
nnoremap <S-Tab> <<
