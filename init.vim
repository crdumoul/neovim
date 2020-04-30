set backspace=indent,eol,start
set background=dark
set expandtab
set hidden
set nocompatible
set number
set relativenumber
set hlsearch
set undodir=~/.local/share/nvim/undo
set undofile
set scrollback=100000
set wildignore+=*.json
set mouse=a
set completeopt-=preview

filetype indent plugin on
syntax on

call plug#begin('~/.local/share/nvim/plugged')
Plug 'sfi0zy/atlantic-dark.vim'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rust-lang/rust.vim'
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'chaoren/vim-wordmotion'
Plug 'mbbill/undotree'
call plug#end()

colorscheme atlantic-dark

" Deoplete setup
let g:deoplete#enable_at_startup = 1

" RLS setup
let g:LanguageClient_serverCommands = {
	\ 'rust': ['rust-analyzer'],
        \ 'ruby': ['solargraph', 'stdio'],
	\ }
let $RUST_BACKTRACE = 1
"let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
"let g:LanguageClient_loggingLevel = 'INFO'
"let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'
"let g:LanguageClient_useVirtualText = 0
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Tagbar setup
nmap <F8> :TagbarToggle<CR>

" CtrlP setup
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" vim-airline setup
let g:airline_theme='cobalt2'
let g:airline#extensions#tabline#enabled = 1

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Terminal setup
tnoremap <Esc> <C-\><C-n>
autocmd TermOpen * setlocal nonumber norelativenumber

" Buffer switching shortcuts
nnoremap <silent> <C-n> :bp<CR>
nnoremap <silent> <C-m> :bn<CR>

" Split switching shortcuts
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Quickfix navigation
map <C-j> :cn<CR>
map <C-k> :cp<CR>

" undotree shortcut
nnoremap <F5> :UndotreeToggle<CR>
