" File: .vimrc
" Author: Spencer Whitt
" Description: A file of vim awesome

" Install instructions:
" 1) git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" 2) Move this file to your home directory
" 3) Launch vim and run :BundleInstall
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Plugins                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "
let g:mapleader = " "
let maplocalleader = "\\"

filetype off " required by vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage itself
Bundle 'gmarik/vundle'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Editing commands
Bundle 'repeat.vim'
Bundle 'tpope/vim-surround'
Bundle 'scooloose/nerdcommenter'
Bundle 'wojtekmach/vim-rename'
"Bundle 'SirVer/ultisnips'
"Bundle 'mattn/zencoding-vim'
Bundle 'godlygeek/tabular'

" Supertab
Bundle 'ervandew/supertab'

" Management
Bundle 'sessionman.vim'
Bundle 'bufexplorer.zip'

" External Integration
" Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
" Fast searching
Bundle 'rking/ag.vim'
" Just incase Ag is not installed
Bundle 'mileszs/ack.vim'

" Color scheme
"Bundle 'wgibbs/vim-irblack'
Bundle 'sjl/badwolf'
"Bundle 'xoria256.vim'
"Bundle 'nanotech/jellybeans.vim'
"Bundle 'Lucius'

" Filetypes
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'groenewege/vim-less'
Bundle 'sophacles/vim-bundle-mako'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Utilities                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Settings                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""
"  Appearance  "
""""""""""""""""
" Force gnome-terminal to display colorscheme correctly
if &term =~ '^\(xterm\|screen\)$' && $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
"colorscheme badwolf

" No extra gui crap
set guioptions-=m
"set guioptions-=T
set guioptions-=e

" Nice autocomplete bar
set wildmenu
set wildignore=*.o,*~,*.pyc

" View command being typed
set showcmd

" Line numbering
set number

" Pretty invisibles
set listchars=tab:▸\ ,eol:¬

" Indicate if a line is wrapped
set showbreak=▸

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

""""""""""""""
"  Behavior  "
""""""""""""""
" Put name of current file in titlebar
set title

" Ctags
set tags=tags;

" Improvements!
set nocompatible

" Enable file type detection
filetype plugin indent on

" Don't have to save buffers before opening new ones
set hidden

" Tab character settings
set ts=4 sts=4 sw=4 expandtab shiftround

" Indenting
set ai "Auto indent

" Soft wrap
set linebreak

" gq command formats with par
set formatprg=par\ -r

" Set to auto read when a file is changed from the outside
set autoread

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

""""""""""""
"  Search  "
""""""""""""
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Make search act like search in modern browsers
set incsearch

""""""""""""
"  Backup  "
""""""""""""
" Turn backup off, most stuff is in git
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Key Bindings                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tab navigation
noremap <S-H> gT
noremap <S-L> gt
noremap <leader>tn :tabedit<CR>
noremap <leader>tc :tabclose<CR>

" Switch windows with ctrl
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

noremap <C-Down>   <C-W>j
noremap <C-Up>     <C-W>k
noremap <C-Left>   <C-W>h
noremap <C-Right>  <C-W>l

" Move windows with alt
noremap <A-j> <C-W>J
noremap <A-k> <C-W>K
noremap <A-h> <C-W>H
noremap <A-l> <C-W>L

noremap <A-Down>   <C-W>J
noremap <A-Up>     <C-W>K
noremap <A-Left>   <C-W>H
noremap <A-Right>  <C-W>L

" Make Y behave like everyone else
nnoremap Y y$

" Completion;
" Tags
inoremap <C-]> <C-x><C-]>
" Filename
inoremap <C-f> <C-x><C-f>
" Definition
inoremap <C-d> <C-x><C-d>
" Line
inoremap <C-l> <C-x><C-l>

" Adjust view ports to the same size
noremap <leader>= <C-w>=

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Toggle spell check
nnoremap <silent> <leader>ss :setlocal spell!<cr>
nnoremap <silent> <leader>sd z=<cr>

" Disable highlight
noremap <silent> <leader><cr> :noh<cr>

" The * command should stay on the current word
nnoremap * *N

" Easier word deletion in insert mode
inoremap <C-BS> <C-w>

" Remap VIM 0 to first non-blank character
noremap 0 ^

" Trim trailing whitespace
nnoremap _$ :call Preserve("%s/\\s\\+$//e")<CR>

" Fix indentation of entire file
nnoremap _= :call Preserve("normal gg=G")<CR>

" Cut, Copy, Paste
vnoremap <C-x> "+d
vnoremap <C-c> "+y
nnoremap <C-v> "+p
inoremap <C-v> "+p

" Arrow keys navigate by visual lines
noremap <Up> gk
noremap <Down> gj

" Enter key adds a line
nnoremap <cr> o<esc>

"""""""""""""""""""""""""""
"  Easy Edit Preferences  "
"""""""""""""""""""""""""""

" Open vimrc in a new tab
" Mnemonic: Edit Vimrc
nnoremap <leader>ev :e $MYVIMRC<CR>

" Edit UltiSnips file for current file
" Mnemonic: Edit Snips
nnoremap <leader>es :vsplit<cr>:UltiSnipsEdit<cr>

" Automatically source the vimrc file after saving it
autocmd! bufwritepost .vimrc source $MYVIMRC

"""""""""""""""""""""""
"  Explorer Bindings  "
"""""""""""""""""""""""
" TODO: Move these with other navigational things
nnoremap <leader>de :Explore<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           File Type Settings                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make is pretty crappy about tabs vs spaces
autocmd FileType make setlocal noexpandtab
autocmd FileType ruby setlocal ts=2 sts=2 sw=2
autocmd FileType haml setlocal ts=2 sts=2 sw=2
