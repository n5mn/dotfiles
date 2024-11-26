filetype on
filetype plugin on
syntax on

" Mouse wheel shit 
"set mouse=a
set nocompatible
set cursorline
set statusline=
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set history=100
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

function! InstallVimPlug()
	let plug_path = expand('~/.vim/autoload/plug.vim')
	if !filereadable(plug_path)
		echo "Vim-Plug not found. Installing..."
		silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
		echo "Vim-Plug installed."
	endif
endfunction

call InstallVimPlug()

call plug#begin('~/.vim/plugged')

  Plug 'dense-analysis/ale'
  Plug 'preservim/nerdtree'
  Plug 'dylanaraps/wal.vim'
  Plug 'vim-airline/vim-airline'
"  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'
"  Plug 'edkolev/tmuxline.vim'
"  Plug 'flazz/vim-colorschemes'
  call plug#end()


colorscheme wal
set background=dark
let mapleader = ' '

nnoremap <silent> <leader>p :%w !lp<CR>

inoremap qq <Esc>

noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

nnoremap <F3> :NERDTreeToggle<cr>

let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

augroup filetype_vim
    autocmd!
    autocmd BufWritePost .vimrc source $MYVIMRC
    autocmd FileType * setlocal foldmethod=indent
augroup END

autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

if has('gui_running')

    set background=dark
    colorscheme iceberg
    set guifont=Monospace\ Regular\ 12
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set guioptions-=m
    set guioptions-=b
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>
endif
