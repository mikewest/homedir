"
" VIM Config
"
" Revamped in 2025-06 after ~25 years, but initially pulled together from a
" wide variety of sources, including:
"
"   *   _General goodness_:
"       *   http://items.sjbach.com/319/configuring-vim-right
"       *   http://github.com/spicycode/bringing-vim-to-the-people/
"       *   http://vimrc-dissection.blogspot.com/
"   *   _Colors_:
"       *   http://rtlechow.com/2008/12/256-colors-in-vim-inside-screen-in-an-iterm-on-os-x-leopard
"       *   http://pjkh.com/articles/2008/07/09/osx-iterm-screen-vim-256-colors
"   *   _Long line highlighting_:
"       *   http://muffinresearch.co.uk/archives/2009/06/22/vim-automatically-highlight-long-lines/
"   *   _File Templates_:
"       *   http://lucumr.pocoo.org/2007/8/3/vim-file-templates and http://dev.pocoo.org/~mitsuhiko/_vimrc
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins: (relying on https://junegunn.github.io/vim-plug/)
"
call plug#begin()  
  " Color scheme (https://github.com/morhetz/gruvbox):
  Plug 'morhetz/gruvbox'

  " Buffers in the tab line (https://github.com/ap/vim-buftabline):
  Plug 'ap/vim-buftabline'

  " Kill buffers kindly (https://github.com/qpkorr/vim-bufkill)
  Plug 'qpkorr/vim-bufkill'

  " Comment controls (https://github.com/scrooloose/nerdcommenter)
  Plug 'scrooloose/nerdcommenter'
call plug#end()
let loaded_matchparen=1         " Don't load the MatchParen plugin.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors:
"
set t_Co=256
set background=dark
let g:gruvbox_contrast_dark="hard"
set cursorline
colorscheme gruvbox

" Syntax highlight for complex documents is a little slow.  Tweaking
" the settings a bit to reduce the load:
set synmaxcol=800
syn sync minlines=100


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basics:
"
let mapleader=","               " Set ',' as leader.
filetype plugin indent on
set encoding=utf8               " UTF-8!  Yay!
set nocompatible                " Vim is The Future.
set wildmenu                    " Make tab completion more useful
set wildmode=list:longest
set wildignore+=*.pyc,*.o,*.obj,.git
set title                       " Show Vim title in the terminal window
set visualbell                  " Why would I want my computer to beep at me?
set shortmess=atI               " get rid of prompts I don't care about
set timeoutlen=300              " Quick timeouts for command combinations
set showmatch                   " Automatically show matching brace/parens/etc.

" Annoying typos:
command W write
command Q quit
command Wq wq
command WQ wq
inoremap <F1> <Esc>
nnoremap <F1> <Esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline:
"
set laststatus=2                " Always show status line
set showmode                    " Tell me what mode I'm in (insert/visual/etc)
if has('cmdline_info')
  set ruler
  set rulerformat=%40(%=%y%m%r%w\ [Line=%4l,Col=%2c]\ %P%)
  set showcmd
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers:
"
set hidden
nnoremap <leader>] :bnext<CR>
nnoremap <leader>[ :bprev<CR>

" Kill buffers:
map <silent> <leader>q  :BD<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indenting: tab stop every 2 columns (autoindent too), tabs expanded to spaces
"
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Indent in visual mode remains in visual mode: allows multiple indents
vnoremap <silent> > >gv
vnoremap <silent> < <gv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement:
"
if has('mouse')
  " Use the mouse in normal, visual, and insert modes; this leaves
  " command mode open for GUI copy/paste.
  set mouse=nvi
endif

" show more stuff around the cursor
set scrolloff=3

" scroll a bit faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" wrap around when crossing left and right edge of editors
set whichwrap=h,l,~,[,],<,>
set backspace=eol,start,indent

" Fix page up/down to maintain cursor position: Also: page up/down now
" scroll only half a screen at a time.  I'm pretty much ok with that.  :)
map <PageUp>    <C-U>
map <PageDown>  <C-D>
imap <PageUp>   <C-O><C-U>
imap <PageDown> <C-O><C-D>
set nostartofline               " Preserve column when repositioning cursor


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Selection:
"
" Ctrl-A == Select All
nmap <silent> <C-A> ggVG<CR>

" Highlight search, incrementally
set hlsearch
set incsearch

" make search case-sensitive only when a capital letter is involved
set ignorecase
set smartcase

" Hide the search highlight
nnoremap <silent> <leader>h :noh<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter:
"
let g:NERDCreateDefaultMappings = 0
let g:NERDCommentEmptyLines = 1
let g:NERDCommentWholeLinesInVMode = 1
let g:NERDSpaceDelims = 1
map <leader>/ <Plug>NERDCommenterToggle


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom:
"
function! SwitchHeader()
  if expand("%:e") == "cc"
    exe "e" fnameescape(expand("%:p:r").".h")
  elseif expand("%:e") == "h"
    exe "e" fnameescape(expand("%:p:r").".cc")
  endif
endfunction

map <leader>o :call SwitchHeader()<CR>

autocmd BufNewFile,BufRead *.bs set filetype=markdown
