" Original repository: https://github.com/PiotrProkop/dotfiles

set nocompatible              " be iMproved, required
set nobackup                  " Don't keep backup file
set clipboard=unnamed        " Yank and paste with the system clipboard
set encoding=utf-8

filetype off                  " required
if !has('nvim') && has('python3') && !has('patch-8.1.201')
    silent! python3 1
endif

if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif
 " AsciiDoc support
 Plug 'habamax/vim-asciidoctor'
 " File explorer
 Plug 'scrooloose/nerdtree'
 " Syntax hightlighting
 Plug 'scrooloose/syntastic'
 " Fixer/linter support
 Plug 'dense-analysis/ale'
 " Go support
 Plug 'fatih/vim-go'
 " Source file symbols overview
 Plug 'gryf/tagbar', {'branch': 'show_tag_kind2'}
 " Color theme
 Plug 'morhetz/gruvbox'
 " Optimization
 Plug 'Konfekt/FastFold'
 " Git commands
 Plug 'tpope/vim-fugitive'
 " Tab key support for completion options
 Plug 'ervandew/supertab'
 " Plug 'christoomey/vim-tmux-navigator'
 " Rust auto complete
 Plug 'racer-rust/vim-racer'
 " Rust language support
 Plug 'rust-lang/rust.vim'
 " View Python documentation in vim
 Plug 'fs111/pydoc.vim', { 'for': 'python' }
 " Python language support
 Plug 'mduan/python.vim', { 'for': 'python' }
 " Autocompletion library
 Plug 'davidhalter/jedi-vim', { 'for': 'python' }
 " Syntax for Python
 Plug 'gryf/pep8-vim', { 'for': 'python' }
 " Linter for python
 Plug 'gryf/pylint-vim', { 'for': 'python' }
 " Python syntax support
 Plug 'gryf/python-syntax', { 'for': 'python' }
 " Completion add-on for jedi
 Plug 'zchee/deoplete-jedi', { 'for': 'python' }
 " Snipets engine
 Plug 'SirVer/ultisnips'
 " Snipets
 Plug 'honza/vim-snippets'
 " Universal commenting command
 Plug 'tpope/vim-commentary'
 " Smoothing scrolling
 Plug 'yuttie/comfortable-motion.vim'
 " YAML support
 Plug 'stephpy/vim-yaml'
 " JSON format support
 Plug 'elzr/vim-json'
 " Additional surround features
 Plug 'tpope/vim-surround'
 " Adding symetric comamands to the default ones
 Plug 'tpope/vim-unimpaired'
 " Enchancing default repeat
 Plug 'tpope/vim-repeat'
 " Plug 'tmux-plugins/vim-tmux'
 " Highlight yanks
 Plug 'machakann/vim-highlightedyank'
 " Make that pretty neat text tables
 Plug 'godlygeek/tabular'
 Plug 'junegunn/fzf.vim'
 Plug 'mattn/emmet-vim'
 if has('nvim')
     Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 else
     Plug 'Shougo/deoplete.nvim'
     Plug 'roxma/nvim-yarp'
     Plug 'roxma/vim-hug-neovim-rpc'
 endif
 Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make' }
call plug#end()            " required

filetype plugin indent on    " required
" better menu
set wildmenu
" search while typing
set incsearch

syntax on
"change mapleader
let mapleader=","

let g:ansible_options = {'ignore_blank_lines': 0}

if has('gui_running')
    set background=dark
    set guioptions=
    set guifont=Hack\ 14
    set noerrorbells
    set novisualbell
    set t_vb=
    autocmd! GUIEnter * set vb t_vb=
else
    set background=dark
endif

"Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" Gruvbox colorscheme
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_contrast_light = "soft"
let g:gruvbox_guisp_fallback = "bg"
color gruvbox

"Highlight active column and line
" set cursorline
" set cursorcolumn
set lazyredraw

""settings fo golnang
let g:acp_enableAtStartup = 0

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#num_processes = 4
let g:deoplete#max_list = 500

" Go related mappings
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
"au FileType go nmap gd <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

"Golang highligt
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 0
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

"Golang settings
let g:go_metalinter_enabled = ['vet', 'errcheck']
let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = ['vet']
let g:go_metalinter_deadline = "5s"
"let g:go_auto_type_info = 1
"let g:go_auto_sameids = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
set updatetime=100

set number
set ts=4
set sw=4
set autoindent
set expandtab
set showmatch

let python_highlight_all = 1

"hidding highligt of looking text
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

"quick save
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" TagBar
let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
            \ },
            \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
            \ },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }

nmap <F8> :TagbarToggle<CR>

" NERDTree
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
nmap <leader>m :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"sudo save
cmap w!! w !sudo tee % >/dev/null

"Tabs per language
autocmd FileType python set ts=4 sw=4 et expandtab " Python
autocmd FileType php set ts=4 sw=4 et expandtab     " Php
autocmd FileType go set ts=4 sw=4 et expandtab     " Go
autocmd FileType vim set ts=4 sw=4 et
autocmd FileType javascript set ts=2 sw=2           " JS
autocmd FileType json set ts=2 sw=2 sts=0 expandtab "json
autocmd FileType ruby   set ts=2 sw=2               " Ruby
autocmd FileType c,cpp  set ts=4 sw=4 cindent       " C & C++
autocmd FileType sh set ts=2 sw=2 et expandtab " Bash
autocmd FileType docbk,html,xhtml,xml set ts=4 sw=4 " DocBook, HTML, XHT    ML, and XML
" Yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab

"Working with buffers
set hidden
nnoremap <space>n :bnext<CR>
nnoremap <space>p :bprev<CR>
nnoremap <space>d :bdelete<CR>
let g:ale_fixers = {
            \ "*": ['remove_trailing_lines', 'trim_whitespace'],
            \}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
" Only run linting when saving the file
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" disable loclist and enable quickfix
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 1

function s:SetPythonSettings()
    " highlight python self, when followed by a comma, a period or a parenth
    syn match pythonBoolean "\(\W\|^\)\@<=self\([\.]\)\@="
    setlocal completeopt-=preview
    nnoremap <buffer> <C-]> :call jedi#goto_definitions()<CR>
    nnoremap <buffer> <C-LeftMouse> :call jedi#goto_definitions()<CR>
    " Python options
    let g:jedi#completions_enabled = 0
    let python_highlight_all=1
    let g:jedi#show_call_signatures = "2"
    let g:ale_linters_explicit = 1
    let g:ale_python_pylint_change_directory = 0
    let g:ale_linters = {
                \ 'python': ['flake8', 'pylint'],
                \}
    let g:ale_python_mypy_options = "--namespace-package"

    let g:ale_fixers = {
                \ 'python': ['black'],
                \ 'javascript': ['eslint'],
                \}
    let g:syntastic_python_python_exec = 'python3'
    let g:deoplete#sources#jedi#enable_typeinfo = 0
    let g:jedi#force_py_version = 3
    set textwidth=88
    set colorcolumn=+1
    " autocmd BufWritePre *.py execute ':Black'
endfunction
autocmd FileType python call <SID>SetPythonSettings()

"See how it works
set mouse=a
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

"Json
let g:vim_json_syntax_conceal = 0

"UltiSnip
let g:UltiSnipsExpandTrigger="<c-u>"

" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLine guibg=#323D3E
autocmd InsertEnter * highlight  Cursor guibg=#00AAFF

" Live substitute
"
if has('nvim')
    set inccommand=split
endif

" Statusline
let g:currentmode={
    \ 'n'  : 'N ',
    \ 'no' : 'N·Operator Pending ',
    \ 'v'  : 'V ',
    \ 'V'  : 'V·Line ',
    \ "\<C-v>" : 'V·Block ',
    \ 's'  : 'Select ',
    \ 'S'  : 'S·Line ',
    \ 'i'  : 'I ',
    \ 'R'  : 'R ',
    \ 'Rv' : 'V·Replace ',
    \ 'c'  : 'Command ',
    \ 'cv' : 'Vim Ex ',
    \ 'ce' : 'Ex ',
    \ 'r'  : 'Prompt ',
    \ 'rm' : 'More ',
    \ 'r?' : 'Confirm ',
    \ '!'  : 'Shell ',
    \ 't'  : 'Terminal '
    \}

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
    let l:mode = mode()
    if (l:mode =~# '\v(n|no)')
        exe 'hi! StatusLine ctermfg=236'
    elseif (l:mode =~# '\v(v|V)' || g:currentmode[l:mode] ==# 'V·Block' || get(g:currentmode, l:mode, '') ==# 't')
        exe 'hi! StatusLine ctermfg=005'
    elseif (l:mode ==# 'i')
        exe 'hi! StatusLine ctermfg=004'
    else
        exe 'hi! StatusLine ctermfg=006'
    endif
    return ''
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return '  '.fugitive#head()
  else
    return ''
endfunction

set noshowmode
set laststatus=2
set ruler
set statusline=
set statusline+=%3.3{ChangeStatuslineColor()}               " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
" set statusline+=%3*%{GitInfo()}                      " Git Branch name
set statusline+=%1*\ %t%m\ \                                 " File+modified
set statusline+=\ %#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}             " Syntastic errors
set statusline+=%*
set statusline+=%2*\ %=                                  " Space
set statusline+=%3*%{exists(':Tagbar')!=0?tagbar#currenttag('%s','','f'):''} " current tag
set statusline+=%3*%{exists(':Tagbar')!=0?tagbar#currenttagtype('(%s)',''):''} " current tag type
set statusline+=%2*\ %y\                                 " FileType
"set statusline+=%2*\ %{(&fenc!=''?&fenc:&enc)}\ \[%{&ff}]\ " Encoding & Fileformat
set statusline+=%0*%3p%%\ \|                              " Rownumber/total (%)
set statusline+=%0*\ %l:%c\                               " Line/char

hi User1 ctermfg=011
hi User1 ctermbg=237
hi User2 ctermfg=011
hi User2 ctermbg=237
hi User3 ctermfg=013
hi User3 ctermbg=237

nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <space>l :<C-u>Buffer<CR>
