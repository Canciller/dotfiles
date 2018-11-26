set nocompatible
filetype plugin indent off

" pathogen
execute pathogen#infect()

"  vundle  
set rtp+=~/.config/nvim/bundle/Vundle.vim 
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'Valloric/YouCompleteMe' "A code-completion engine for Vim
    Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable' }
    Plugin 'Valloric/ListToggle' "A simple vim plugin for toggling the display of the quickfix list and the location-list
    Plugin 'tmux-plugins/vim-tmux-focus-events'
    Plugin 'vimwiki/vimwiki' "Personal Wiki For Vim
    Plugin 'bfrg/vim-cpp-modern' "Enhanced C and C++ syntax highlighting
    Plugin 'calviken/vim-gdscript3' "GDScript syntax highlighting
    Plugin 'pangloss/vim-javascript' "JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation
    Plugin 'digitaltoad/vim-pug' "Vim syntax highlighting for Pug templates
    Plugin 'alvan/vim-closetag' "Autocloses html tags
    Plugin 'vim-airline/vim-airline' "Lean & mean status/tabline for vim that's light as air
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'ryanoasis/vim-devicons' "Adds file type glyphs/icons to popular Vim plugins
    Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' "This adds syntax for nerdtree on most common file extensions
    Plugin 'dracula/vim' "A dark theme for Vim
call vundle#end()

""""""""""""""""""""""""
"  nvim configuration  "
""""""""""""""""""""""""

au FocusGained,BufEnter * :checktime
set autoread

set encoding=UTF-8

set noshowmode
set termguicolors

try
    colorscheme dracula
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme murphy
endtry

set number

set nohlsearch
set ignorecase

set autoindent

set tabstop=4
set shiftwidth=4
set softtabstop=0 expandtab

set splitbelow
set splitright

syntax on

""""""""""""""""""""""""
"       keymaps        "
""""""""""""""""""""""""

" write with W
cnoreabbrev W w

" faster tabbing 
nnoremap < <<
nnoremap > >>

" keep selection tabbing
vnoremap < <gv
vnoremap > >gv

" move easily splits
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" nerdtree toggle keymap
map <silent> <C-n> :NERDTreeToggle<CR>

""""""""""""""""""""""""
" plugin configuration "
""""""""""""""""""""""""

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0
let g:ycm_server_use_vim_stdout = 0
let g:ycm_server_keep_logfiles = 0
let g:ycm_server_log_level = 'debug'
let g:ycm_always_populate_location_list = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 0
let g:ycm_disable_for_files_larger_than_kb = 0

" ListToggle
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 10

" vim-closetag
"
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.ejs'
"
" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
"
" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'
"
" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
"
" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1
"
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#stl_format_err = 1
let g:airline#extensions#syntastic#stl_format_warn = 1

" vim-devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" vim-nerdtree-syntax-highlight
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" nerdtree
"
let NERDTreeShowHidden = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"
" nerdtree no file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"
" nerdtree directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"
" nerdtree autoclose
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
