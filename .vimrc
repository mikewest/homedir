"
"   VIM Config
"
"   Pulled together from a wide variety of sources, in particular:
"   *   _General goodness_: http://items.sjbach.com/319/configuring-vim-right   
"   *   _Colors:
"       *   http://rtlechow.com/2008/12/256-colors-in-vim-inside-screen-in-an-iterm-on-os-x-leopard
"       *   http://pjkh.com/articles/2008/07/09/osx-iterm-screen-vim-256-colors
"

" Colors (via http://rtlechow.com/2008/12/256-colors-in-vim-inside-screen-in-an-iterm-on-os-x-leopard/)
set t_Co=256            " Use 256 colors
:colorscheme railscasts " Still deciding if I like this or not

" cribbed from http://items.sjbach.com/319/configuring-vim-right
set hidden
nnoremap ' `
nnoremap ` '
let mapleader = ","
set history=1000
runtime macros/matchit.vim
set wildmode=list:longest
 
" make search case-sensitive only when a capital letter is involved
set ignorecase 
set smartcase
 
" show Vim title in the Terminal
set title
 
" show more stuff around the cursor
set scrolloff=3

" temp files in ~/.vim/tmp

set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" scroll a bit faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" syntax highlighting
if has('syntax')
    syntax on
    filetype on
    filetype plugin on
    filetype indent on
    set cursorline      " What line am I on?
endif
 
" don't annoy me
set visualbell
 
if has('gui_running')
    set encoding=utf-8
    set lines=50
    set columns=85
    set go-=T
    colorscheme ir_black
    set guioptions-=T
    set guioptions-=m
    set guifont=Panic\ Sans\ 8
    set showtabline=2
    set guitablabel=%t
end
 
" forget about Vi
set nocompatible
 
" Language-specific indenting
 
set ls=2
set showmode
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
 
autocmd Filetype c,cpp,h,python,html,css,js,xml set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
 
if has('mouse')
    set mouse=a
endif
set nomodeline
set showmatch
 
set fileencoding=utf-8
 
 
if has('cmdline_info')
    set ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd
endif

" search
set hlsearch
set incsearch

" trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" get rid of prompts I don't care about
set shortmess=atI

" wrap around when crossing left and right edge of editors
set whichwrap=h,l,~,[,],<,>
set backspace=eol,start,indent

""" PLUGINS

" NERD_Tree
map <silent> <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" FuzzyFinder
let g:fuzzy_ignore = "*.log"
let g:fuzzy_matching_limit = 70
map <silent> <leader>t :FuzzyFinderTextMate<CR>
map <silent> <leader>b :FuzzyFinderBuffer<CR>
