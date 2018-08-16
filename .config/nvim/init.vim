set backspace=indent,eol,start
set background=dark
set expandtab
set hidden
set nocompatible
set number
set relativenumber
set nohlsearch

filetype indent plugin on
syntax on

call plug#begin('~/.local/share/nvim/plugged')
Plug 'haishanh/night-owl.vim'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rust-lang/rust.vim'
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'
Plug 'racer-rust/vim-racer'
call plug#end()

colorscheme night-owl

" Deoplete setup
let g:deoplete#enable_at_startup = 1

" RLS setup
let g:LanguageClient_serverCommands = { 'rust': ['rls'] }
let $RUST_BACKTRACE = 1
let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'
" Temporarily using racer for this because it's not working with my current Rust toolchain
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

" Racer setup
let g:racer_cmd = "racer"
au FileType rust nmap gd <Plug>(rust-def)

" Tagbar setup
nmap <F8> :TagbarToggle<CR>

" CtrlP setup
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <C-n> :bp<CR>
nnoremap <silent> <C-m> :bn<CR>
