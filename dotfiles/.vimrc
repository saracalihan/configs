" To ignore plugin indent changes, instead use:
" filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

" <leader> key
:let mapleader = "<"
set mouse=a  " dragable split with mouse

set ic " ignore search case
set is " show alo pasible matchs
set hls " highlight search match [ 'set nohls' for close that ]

set smarttab

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif


set list
set list lcs=trail:·,tab:»·

" function! FoldFunc()
"   let thisline = getline(v:lnum)
"   if thisline =~? '\v^\s*$'
"     return '-1'
"   endif
"
"   if thisline =~ '^import.*$'
"     return 1
"   else
"     return indent(v:lnum) / &shiftwidth
"   endif
" endfunction
"
" set foldmethod=expr " for fonding code, use 'za' to toggle fold
" setlocal foldexpr=FoldFunc()

set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on    " required

" Vundle Begin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/syntastic'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'leafgarland/typescript-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'afterglow'
Plugin 'jiangmiao/auto-pairs'
Plugin 'airblade/vim-gitgutter'
Plugin 'habamax/vim-sendtoterm'
call vundle#end()
" Vundle End

filetype plugin on
syntax enable

let NERDTreeShowHidden=1

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Auto refresh nerdtree
autocmd BufEnter NERD_tree_* | execute 'normal R'

set number
set tabstop=2 softtabstop=0 expandtab shiftwidth=2

nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

" Move viewport up one line
nmap <S-w> <C-y>  

" Move viewport up one line
nmap <S-s> <C-e> 

" move this line
inoremap <A-Up> <ESC>:m -2<CR>==gi
inoremap <A-Down> <ESC>:m +1<CR>==gi

" Togle nerdtree
map <leader>nn :NERDTreeToggle<cr>

" Switch next tab(for create next tab press 't' key on selected file) and switch previous tab
nnoremap 1  :tabp<CR>
nnoremap 2  :tabn<CR>

" Undo
map <C-z> :u<CR> 
" Redo
map <C-y> :redo<CR>

colorscheme afterglow

