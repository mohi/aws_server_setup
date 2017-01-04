" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
syntax on
filetype plugin indent on
" vim currently recognises md as modula2 files
autocmd BufNewFile,BufRead *.md set filetype=markdown
" show existing tab with 4 spaces
set tabstop=4
" set indenting for 4 spaces
set shiftwidth=4
" on pressing tab, insert 4 spaces
set expandtab

au BufNewFile,BufRead *.py
    \ set shiftwidth=4 | 
    \ set textwidth=99 | 
    \ set expandtab | 
    \ set autoindent |
    \ set fileformat=unix |
    \ set softtabstop=4

" color limit to 99
set colorcolumn=99
" map leader key to ,
let mapleader = ","
" better copy paste
set pastetoggle=<F2>
set number
set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" key map during insert mode
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-e> <End>
imap <C-a> <Home>

"Fast quit and save
map <C-x> <Esc>:x<CR>

"---------- Plug-in manager config-------------
" Dein.vim
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
call dein#add('Shougo/unite.vim')

call dein#end()
if dein#check_install()
    call dein#install()
endif
" call dein#check_clean()

"--------------Plugin manager end---------------
filetype plugin indent on
" For setting in python files

" plugins
nmap <leader>nt :NERDTree<cr>

" unite: plugin for quick looking up files
nnoremap <space> <nop>
" lookup file
nnoremap <space>f  :Unite file<cr>
" recursive search, slow normally, use with vimproc
" nnoremap <space>rec  :Unite file_rec<cr>
" quick swtiching buffers
nnoremap <space>b :Unite -quick-match buffer<cr>


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

" Ignore following pylint error
let g:pymode_lint_ignore = "E501"
" Auto check on save
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0

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
