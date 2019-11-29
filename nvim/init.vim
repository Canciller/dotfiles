" Plugins: {{{
set nocompatible
filetype plugin on

call plug#begin(stdpath('data') . '/plugged')
Plug 'canciller/vim-dracula' "A dark theme for Vim.

Plug 'itchyny/lightline.vim' "A light and configurable statusline/tabline plugin for Vim.

Plug 'tpope/vim-vinegar'

Plug 'junegunn/fzf' "A command-line fuzzy finder.
Plug 'junegunn/fzf.vim' "A command-line fuzzy finder.

Plug 'tpope/vim-fugitive' "A Git wrapper so awesome, it should be illegal.

Plug 'jiangmiao/auto-pairs' "Insert or delete brackets, parens, quotes in pair.

Plug 'neomake/neomake' "Neomake is a plugin for Vim/Neovim to asynchronously run programs.

Plug 'alvan/vim-closetag'

Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "Dark powered asynchronous completion framework.
Plug 'carlitux/deoplete-ternjs'
Plug 'deoplete-plugins/deoplete-jedi' "deoplete.nvim source for Python.
Plug 'deoplete-plugins/deoplete-clang' "deoplete.nvim source for C/C++/Obj-C/Obj-C++ with clang-python3.

Plug 'pangloss/vim-javascript' "JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation.
Plug 'maxmellon/vim-jsx-pretty' "The React syntax highlighting and indenting plugin for vim.

Plug 'posva/vim-vue' "Vim syntax highlighting for Vue components.

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} "Semshi provides semantic highlighting for Python in Neovim.
call plug#end()
" }}}

" Plugin Options: {{{
" alvan/vim-closetag {{{
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.vue'

" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.js,*.jsx,*.vue'

" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml,js,jsx,vue'

" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,js,jsx,vue'

" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
            \ 'typescript.tsx': 'jsxRegion,tsxRegion',
            \ 'javascript.jsx': 'jsxRegion',
            \ }

" Shortcut for closing tags
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag
let g:closetag_close_shortcut = '<leader>>'
" }}}

"  shougu/deoplete {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 50

let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#include_keywords = 1

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
"  }}}

" numirias/semshi {{{
function! SemshiHighlights()
    sign define semshiError text=\  texthl=semshiErrorSign
endfunction
" }}}

" itchyny/lightline.vim {{{
let g:lightline = {
            \ 'colorscheme': 'dracula',
            \'active': {
            \   'left': [ ['mode', 'paster'], [ 'gitbranch', 'absolutepath', 'readonly', 'modified' ] ]
            \},
            \'component_function': {
            \   'readonly': 'LightlineReadonly',
            \   'gitbranch': 'fugitive#head'
            \}
            \}

let g:lightline.subseparator = { 'left': '', 'right': '' }

let g:lightline.tabline = {
            \'left': [ [ 'tabs' ] ],
            \'right': [],
            \}

let g:lightline.tabline.subseparator = { 'left': '', 'right': '' }



function! LightlineReadonly()
    return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction
" }}}

" jiangmiao/auto-pairs {{{
let g:AutoPairsMultilineClose = 0
" }}}

" mxw/vim-jsx-pretty {{{
let g:vim_jsx_pretty_colorful_config = 1
" }}}

" junegunn/fzf {{{
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'Function'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Normal'],
            \ 'pointer': ['bg', 'CursorLine'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" hide statusline
augroup filetype_fzf
    autocmd!
    autocmd  FileType fzf set laststatus=0 noshowmode noruler
                \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END
" }}}

" neomake/neomake {{{
let g:neomake_javascript_enabled_makers = ['eslint']
" }}}

" arakashic/chromatica.nvim {{{
let g:chromatica#enable_at_startup = 1
let g:chromatica#responsive_mode = 1
let g:chromatica#enable_log = 1
"}}}

" deoplete-plugins/deoplete-clang {{{
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/9.0.0'
"}}}
"}}}

" Vim Options: {{{
filetype plugin indent on
syntax on

let mapleader = ","
let maplocalleader = "\\"

colorscheme dracula

set backupcopy=yes

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

augroup filetype_vue
    autocmd!
    autocmd FileType vue setlocal tabstop=2
    autocmd FileType vue setlocal shiftwidth=2
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

"disable arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

"disable esc in insert mode
inoremap <esc> <nop>

"enter normal mode in insert mode
inoremap jk <esc>1l

"open vimrc in new tab
nnoremap <silent> <leader>ev :tabedit $MYVIMRC<cr>

"source vimrc
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>

vnoremap <tab> >gv
vnoremap <s-tab> <gv

nnoremap <tab> >>
nnoremap <s-tab> <<

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

"paste from clipboard
nnoremap <c-p> "+p

"copy to clipboard
vnoremap <c-c> "+y

"move to end/start of line
nnoremap L $
nnoremap H 0

"disable hlsearch
nnoremap <silent> <esc><esc> :nohlsearch<cr>

nnoremap <leader>= mmggVG=`m

"replace all ocurrences of word under cursor
nnoremap <leader>r :%s/\<<c-r><c-w>\>//g<left><left>

"find all ocurrences of word under cursor
nnoremap <leader>f /\<<c-r><c-w>\><cr>

"fold close/open
nnoremap <space> za

"replace all '' with ""
nnoremap <silent> <leader>" :%s/"/'/g<cr>:nohlsearch<cr>

"replace all "" with ''
nnoremap <silent> <leader>' :%s/'/"/g<cr>:nohlsearch<cr>

"get syntax highlight group of character under the cursor (Functions)
nnoremap <silent> <leader>h :call SynGroup()<cr>
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

augroup status_line
    autocmd!

    "left side
    set statusline=
    "set statusline+=%#StatusLineMode#
    set statusline+=\ %{Mode()}\ 
    "set statusline+=%#StatusLine#
    set statusline+=\ %f\ 
    set statusline+=%{Modified()}

    "right side
    set statusline+=%=
    set statusline+=\ %{&filetype}\ 
    set statusline+=\ %{&fileformat}\ 
    set statusline+=\ %{&fileencoding}\ 
    set statusline+=\ %l:%L\ 
augroup END
" }}}

" Functions: {{{
"get syntax highlight group of character under the cursor
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction
" }}}
