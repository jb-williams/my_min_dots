" Vundle
filetype off

filetype plugin on 

" Highlighting
syntax on

set encoding=utf-8
set path+=**

" color column and scheme
set colorcolumn=90

" History
set history=50
set t_Co=256
set smartindent
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set cursorline
"set lazyredraw

" Visual prompt for command completion
set wildmenu

" folding
set nofoldenable

set noesckeys

set nocompatible

" Display
set ls=2
set showmode
set showcmd
set modeline
set ruler
set title
set nu

" Line wrapping
set wrap
" set nowrap
set linebreak
set showbreak=▹

" Auto indent what you can
set autoindent

" Searching
set incsearch
set ignorecase
set smartcase
set gdefault
set hlsearch
set showmatch

" Enable jumping into files in a search buffer
set hidden 

" Make backspace a bit nicer
set backspace=eol,start,indent

" Indentation
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set expandtab

" Disable mouse=     enalbe set mouse=a
set mouse=a

" Colorscheme
if executable('rg')
	let g:rg_derive_root='true'
endif

let g:netrw_browse_split= 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

vmap <leader>y :!xclip -f -sel clip<CR>
map <leader>p mz:-1r !xclip -o -sel clip<CR>`z
vnoremap <C-y> "+y :let @+=@*<CR>
noremap <C-p> "+P
noremap <leader>vs :e $MYVIMRC<CR>
nnoremap <leader>; mlA;<esc>`l
noremap <leader>cd :cd %:p:h<CR>:pwd<CR>
noremap <leader>vv :Vifm<CR>

" Switch tabs
map 8 <Esc>:tabe 
map 9 gT
map 0 gt

" Toggle line-wrap
map <F6> <Esc>:set wrap!<CR>

" Open file under cursor in new tab
map <F9> <Esc><C-W>gF<CR>:tabm<CR>

" moving around windows and tabs
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Direction keys for wrapped lines
noremap <silent> <expr> j (v:count == 0? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0? 'gk' : 'k')
"nnoremap <silent> k gk
"nnoremap <silent> j gj
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" Bash / emacs keys for command line
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Base64 decode word under cursor
nmap <Leader>b :!echo <C-R><C-W> \| base64 -d<CR>

" grep recursively for word under cursor
nmap <Leader>g :tabnew\|read !grep -Hnr '<C-R><C-W>'<CR>

" sort the buffer removing duplicates
nmap <Leader>s :%!sort -u --version-sort<CR>


" Write current file with sudo perms
command! W w !sudo tee % > /dev/null
"command! W w
command! -bang Qall qall

" set the interactive flag so bash functions are sourced from ~/.bashrc etc
"set shellcmdflag=-ci
