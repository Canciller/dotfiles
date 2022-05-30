" Plugins: {{{
set nocompatible
filetype plugin indent on

let mapleader = ","
let maplocalleader = "\\"

call plug#begin(stdpath('data') . '/plugged')

Plug 'cocopon/iceberg.vim' "Bluish color scheme for Vim and Neovim.

Plug 'morhetz/gruvbox' "Retro groove color scheme for Vim.

Plug 'itchyny/lightline.vim' "A light and configurable statusline/tabline plugin for Vim.

Plug 'tpope/vim-fugitive' "A Git wrapper so awesome, it should be illegal.

Plug 'neoclide/coc.nvim', {'branch': 'release'} "Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers.

Plug 'github/copilot.vim' "A vim plugin for Copilot.

Plug 'leafgarland/typescript-vim' "Typescript syntax files for Vim.

Plug 'pangloss/vim-javascript' "JavaScript syntax files for Vim.

Plug 'peitalin/vim-jsx-typescript' "React JSX syntax highlighting for vim and Typescript.

"Plug 'tpope/vim-vinegar'

"Plug 'junegunn/fzf' "A command-line fuzzy finder.
"Plug 'junegunn/fzf.vim' "A command-line fuzzy finder.

"Plug 'jiangmiao/auto-pairs' "Insert or delete brackets, parens, quotes in pair.

"Plug 'neomake/neomake' "Neomake is a plugin for Vim/Neovim to asynchronously run programs.

"Plug 'alvan/vim-closetag'

"Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "Dark powered asynchronous completion framework.
"Plug 'carlitux/deoplete-ternjs'
"Plug 'deoplete-plugins/deoplete-jedi' "deoplete.nvim source for Python.
"Plug 'deoplete-plugins/deoplete-clang' "deoplete.nvim source for C/C++/Obj-C/Obj-C++ with clang-python3.
"Plug 'Shougo/neoinclude.vim'

"Plug 'pangloss/vim-javascript' "JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation.
"Plug 'maxmellon/vim-jsx-pretty' "The React syntax highlighting and indenting plugin for vim.

call plug#end()
" }}}

" Plugin Options: {{{

" neoclide/coc.nvim {{{
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nnoremap <F2> <Plug>(coc-rename)
" }}}
"
" itchyny/lightline.vim {{{
let g:lightline = {
            \ 'colorscheme': 'iceberg',
            \'active': {
            \   'left': [ ['mode', 'paster'], [ 'gitbranch', 'cocstatus', 'absolutepath', 'readonly', 'modified' ] ]
            \},
            \'component_function': {
            \   'readonly': 'LightlineReadonly',
            \   'gitbranch': 'FugitiveHead',
            \   'cocstatus': 'coc#status'
            \}
            \}

let g:lightline.subseparator = { 'left': '', 'right': '' }

let g:lightline.tab = {
    \ 'active': [ 'tabnum', 'filename', 'modified' ],
    \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }

let g:lightline.tabline = {
            \'left': [ [ 'tabs' ] ],
            \'right': [],
            \}

let g:lightline.tabline.subseparator = { 'left': '', 'right': '' }

function! LightlineReadonly()
    return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

function! LightlineTabFilename(n) "{{{
  let n = tabpagenr()
  let buflist = tabpagebuflist(n)
  let winnr = tabpagewinnr(n)
  let bufnum = buflist[winnr - 1]
  let bufname = expand('#'.bufnum.':t')
  let buffullname = expand('#'.bufnum.':p')
  let buffullnames = []
  let bufnames = []
  for i in range(1, tabpagenr('$'))
    if i != n
      let num = tabpagebuflist(i)[tabpagewinnr(i) - 1]
      call add(buffullnames, expand('#' . num . ':p'))
      call add(bufnames, expand('#' . num . ':t'))
    endif
  endfor
  let i = index(bufnames, bufname)
  if strlen(bufname) && i >= 0 && buffullnames[i] != buffullname
    return substitute(buffullname, '.*/\([^/]\+/\)', '\1', '')
  else
    return strlen(bufname) ? bufname : '[No Name]'
  endif
endfunction
"}}}
" }}}

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

"}}}
"
" Vim Options: {{{
syntax on

set backupcopy=yes

colorscheme gruvbox
"colorscheme iceberg

set noshowmode

set splitbelow
set splitright

set encoding=utf-8

set cursorline

set number
set relativenumber
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

set tabstop=2
set shiftwidth=2
set softtabstop=0 expandtab

set showtabline=2

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 16
" }}}

" Autocmds: {{{
autocmd FileType json syntax match Comment +\/\/.\+$+

augroup filetype_ts
  autocmd!
  autocmd FileType typescript setlocal foldmethod=syntax
  autocmd FileType typescriptreact setlocal foldmethod=syntax
  autocmd FileType typescript setlocal foldlevel=99
  autocmd FileType typescriptreact setlocal foldlevel=99
augroup END

augroup filetype_vim
  autocmd!
  autocmd FileType vim nnoremap <buffer> <localleader>c I"<esc>
  autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_conf
  autocmd!
  autocmd FileType conf setlocal foldmethod=marker
augroup END

augroup filetype_netrw
  autocmd!
  autocmd FileType netrw setlocal bufhidden=delete
augroup END

augroup filetype_all
  autocmd!
  autocmd BufNewFile,BufRead * onoremap ah :<c-u>execute "normal! ?^[=-][=-]\\+\r:nohlsearch\rg_vk0"<cr>
  autocmd BufNewFile,BufRead * onoremap ih :<c-u>execute "normal! ?^[=-][=-]\\+\r:nohlsearch\rg_kvg_"<cr>
  autocmd BufNewFile,BufRead * onoremap in@ :<c-u>execute "normal! /@\r:nohlsearch\r1hvB"<cr>
  autocmd BufWritePost init.vim source %
augroup END

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
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
noremap <silent> <down> :res +5<cr>
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
"nnoremap <leader>r :%s/\<<c-r><c-w>\>//g<left><left>

"find all ocurrences of word under cursor
"nnoremap <leader>f /\<<c-r><c-w>\><cr>

"fold close/open
nnoremap <space> za

"replace all '' with ""
nnoremap <silent> <leader>" :%s/"/'/g<cr>:nohlsearch<cr>

"replace all "" with ''
nnoremap <silent> <leader>' :%s/'/"/g<cr>:nohlsearch<cr>

"get syntax highlight group of character under the cursor (Functions)
nnoremap <silent> <leader>h :call SynGroup()<cr>

"open netrw in a vertical split
nnoremap <silent> <leader>x :Vexplore<cr>
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

" Tab Line: {{{
function TabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T'

        " the label is made by TabLabel()
        let s .= ' %{TabLabel(' . (i + 1) . ')} '
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'

    return s
endfunction

function TabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let name = bufname(buflist[winnr - 1])
    let mod = getbufvar(buflist[winnr - 1], '&mod')

    if name == ''
        let name = '[No Name]'
    else
        let m = matchstrpos(name, $HOME)
        if m[1] == 0
            let name = '~' . name[m[2]:]
        endif

        let path = split(name, '/')
        let newPath = []

        let size = len(path)
        if size > 1
            for i in range(size - 1)
                let c = path[i][0]
                if c == '.'
                    let c = path[i][0:1]
                endif
                call add(newPath, c)
            endfor

            let name = join(newPath, '/')
            let name .= '/' . path[size - 1]
        endif
    endif

    let name = a:n . ' ' . name
    if mod
        let name .= ' +'
    endif
    return name
endfunction

set tabline=%!TabLine()
" }}}

" Functions: {{{
"get syntax highlight group of character under the cursor
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction
" }}}
