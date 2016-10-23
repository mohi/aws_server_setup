autocmd! bufwritepost .vimrc source %
syntax on
filetype plugin indent on
" show existing tab with 4 spaces
set tabstop=4
" set indenting for 4 spaces
set shiftwidth=4
" on pressing tab, insert 4 spaces
set expandtab

" line limit to 99
set colorcolumn=99
" map leader key to ,
let mapleader = ","
set pastetoggle=<F2>

"Dein.vim
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

call dein#begin(expand('~/.vim/dein'))
" add desired plugin here
call dein#add('scrooloose/nerdtree')
call dein#add('easymotion/vim-easymotion')
call dein#add('Shougo/neosnippet')
call dein#add('klen/python-mode')

call dein#end()
if dein#check_install()
    call dein#install()
endif
" call dein#check_clean()
filetype plugin indent on

" plugins
nmap <leader>nt :NERDTree<cr>

" neosnippet
" use NeoSnippetEdit for personal snippets
let g:neosnippet#snippets_directory='~/.vim/vim-snippets/snippets'
let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }
" neosnippet plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)

" python-mode settings
let g:pymode_rope = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion = 0
   " Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 0

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
