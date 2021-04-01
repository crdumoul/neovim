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
"set mouse=a
set completeopt-=preview
set updatetime=300
set signcolumn=yes

filetype indent plugin on
syntax on

call plug#begin('~/.local/share/nvim/plugged')
Plug 'sfi0zy/atlantic-dark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

" coc.nvim language client
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <F2> <Plug>(coc-rename)

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
