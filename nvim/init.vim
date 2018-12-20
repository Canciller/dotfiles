" Vundle Plugins {{{
set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'tpope/vim-vinegar'
call vundle#end()
" }}}

" Vim Options {{{
filetype plugin indent on
syntax on

let mapleader = ","
let maplocalleader = "\\"

colorscheme blackberry

set noshowmode

set splitbelow
set splitright

set encoding=utf-8

set termguicolors
set cursorline

set number
set norelativenumber
set numberwidth=5

set wrap
set showmatch
set matchtime=2

set background=dark

set list
set showbreak=↪\ 
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

set tabstop=4
set shiftwidth=4
set softtabstop=0 noexpandtab

set showtabline=2

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 1
let g:netrw_altv = 1
let g:netrw_winsize = 20
" }}}

" Autocmds {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim nnoremap <buffer> <localleader>c I"<esc>
	autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_conf
	autocmd!
	autocmd FileType conf setlocal foldmethod=marker
augroup END

augroup filetype_cpp
	autocmd!
	autocmd FileType cpp setlocal expandtab
	autocmd FileType cpp setlocal listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
augroup END

augroup filetype_all
	autocmd!
	autocmd BufNewFile,BufRead * onoremap ah :<c-u>execute "normal! ?^[=-][=-]\\+\r:nohlsearch\rg_vk0"<cr>
	autocmd BufNewFile,BufRead * onoremap ih :<c-u>execute "normal! ?^[=-][=-]\\+\r:nohlsearch\rg_kvg_"<cr>
	autocmd BufNewFile,BufRead * onoremap in@ :<c-u>execute "normal! /@\r:nohlsearch\r1hvB"<cr>
	autocmd BufWritePost init.vim source %
augroup END
" }}}

" Mappings {{{

command! WQ wq
command! Wq wq
command! W w
command! Q q

noremap <leader>o o<esc>1k
noremap <leader>O O<esc>1j

"move current line up
noremap <leader>_ ddp

"move current line down
noremap <leader>- dd1kP

"open vimrc in split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

"write
nnoremap <leader>w :w<cr>

"disable keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <esc> <nop>

"enter normal mode
inoremap jk <esc>1l

"delete current line
inoremap <c-d> <esc>ddi

"copy current line
inoremap <c-y> <esc>yy1li

"paste after cursor
inoremap <c-v> <esc>pi

"surround word with "
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

"surround word with '
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

"surround selected with "
vnoremap <leader>" <esc>`<i"<esc>`>1la"<esc>

nnoremap > >>
nnoremap < <<

"move to end/start of line
nnoremap L $
nnoremap H 0

"split movement
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

"split resize
nnoremap <silent> <up> :res -5<cr>
nnoremap <silent> <down> :res +5<cr>
nnoremap <silent> <left> :vertical res -5<cr>
nnoremap <silent> <right> :vertical res +5<cr>

"tab movement
nnoremap <silent> <c-left> :tabn<cr>
nnoremap <silent> <c-right> :tabp<cr>
nnoremap <silent> <c-up> :tabl<cr>
nnoremap <silent> <c-down> :tabr<cr>

"fold close/open
nnoremap <space> za

" }}}

" Status Line {{{

" pretty mode display - converts the one letter status notifiers to words
function! Mode()
    let l:mode = mode()

    if     mode ==# "n"  | return "NORMAL"
    elseif mode ==# "i"  | return "INSERT"
    elseif mode ==# "R"  | return "REPLACE"
    elseif mode ==# "v"  | return "VISUAL"
    elseif mode ==# "V"  | return "V-LINE"
    elseif mode ==# "" | return "V-BLOCK"
	elseif mode ==# "c"  | return "COMMAND"
	elseif mode ==# "t"  | return "TERMINAL"
    else                 | return l:mode
    endif
endfunc 

function! Modified()
	let l:current_buff = winbufnr(winnr())
	let l:modified = ""
	if getbufvar(current_buff, "&mod")
		let l:modified = "+ "
	endif
	return l:modified
endfunc

"left side
set statusline=
"set statusline+=%#StatusLineMode#
set statusline+=\ %{Mode()}\ 
"set statusline+=%#StatusLine#
set statusline+=\ %f\ 
set statusline+=%{Modified()}

augroup status_line
	autocmd!

augroup END

"right side
set statusline+=%=
set statusline+=\ \ %l/%L\ 
set statusline+=\ %{&filetype}\ 
set statusline+=\ %{&fileformat}\ 
set statusline+=\ %{&fileencoding}\ 

" }}}

" Vimscript {{{
"help expr4 for conditional operators
"help internal-variables for variable scopes
" }}}
