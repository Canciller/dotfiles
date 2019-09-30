" Plugins: {{{
set nocompatible
filetype off

call plug#begin(stdpath('data') . '/plugged')
    Plug 'canciller/dracula.vim'

	Plug 'tpope/vim-vinegar'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

	Plug 'jiangmiao/auto-pairs'
	Plug 'alvan/vim-closetag'

	Plug 'pangloss/vim-javascript'
	Plug 'mxw/vim-jsx'

	Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
call plug#end()
" }}}

" Plugin Options: {{{
" Plugin 'alvan/vim-closetag' {{{
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,js'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
" }}}

let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#include_keywords = 1

inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

function! SemshiHighlights()
    sign define semshiError text=\  texthl=semshiErrorSign
endfunction
" }}}

" Vim Options: {{{
filetype plugin indent on
syntax on

let mapleader = ","
let maplocalleader = "\\"

colorscheme dracula

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

if $TERM=~'linux'
	set listchars=tab:>\ ,trail:.
else
	set showbreak=↪\ 
	set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
endif

set tabstop=4
set shiftwidth=4
set softtabstop=0 expandtab

set showtabline=2

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
" }}}

" Autocmds: {{{
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
	autocmd FileType cpp setlocal showbreak=
augroup END

augroup filetype_js
    autocmd!
augroup END

augroup filetype_py
    autocmd!
    autocmd FileType python call SemshiHighlights()
augroup END

augroup filetype_all
	autocmd!
	autocmd BufNewFile,BufRead * onoremap ah :<c-u>execute "normal! ?^[=-][=-]\\+\r:nohlsearch\rg_vk0"<cr>
	autocmd BufNewFile,BufRead * onoremap ih :<c-u>execute "normal! ?^[=-][=-]\\+\r:nohlsearch\rg_kvg_"<cr>
	autocmd BufNewFile,BufRead * onoremap in@ :<c-u>execute "normal! /@\r:nohlsearch\r1hvB"<cr>
	autocmd BufWritePost init.vim source %
	autocmd FileType netrw setlocal bufhidden=delete
augroup END

" }}}

" Mappings: {{{
command! WQ wq
command! Wq wq
command! W w
command! Q q

noremap <leader>o o<esc>1k
noremap <leader>O O<esc>1j

"replace all '' with ""
noremap <silent> <leader>sq :%s/"/'/g<cr>:nohlsearch<cr>

"replace all "" with ''
noremap <silent> <leader>q :%s/'/"/g<cr>:nohlsearch<cr>

"move current line up
noremap <leader>_ ddp

"move current line down
noremap <leader>- dd1kP

"open vimrc in new tab
nnoremap <silent> <leader>ev :tabedit $MYVIMRC<cr>

"source vimrc
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>

"open netrw
nnoremap <leader>x :Lexplore<cr>

"write
nnoremap <leader>w :w<cr>

"disable keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <esc> <nop>

"disable hlsearch
noremap <esc><esc> :nohlsearch<cr>

"enter normal mode
inoremap jk <esc>1l

"delete current line
inoremap <c-d> <esc>ddi

"copy current line
inoremap <c-y> <esc>yy1li

"surround word with "
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

"surround word with '
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

"surround selected with "
vnoremap <leader>" <esc>`<i"<esc>`>1la"<esc>

"keep previous selection
vnoremap > >gv
vnoremap < <gv

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
nnoremap <silent> <c-right> :tabn<cr>
nnoremap <silent> <c-left> :tabp<cr>
nnoremap <silent> <c-up> :tabl<cr>
nnoremap <silent> <c-down> :tabr<cr>

"fold close/open
nnoremap <space> za

" paste from clipboard
nnoremap <c-p> "*p

" copy to clipboard
vnoremap <c-c> "*y

" }}}

" Status Line: {{{
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

" Functions: {{{
" }}}
