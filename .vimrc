"
"   VIM Config
"
"   Pulled together from a wide variety of sources, in particular:
"   *   _General goodness_:
"       *   http://items.sjbach.com/319/configuring-vim-right
"       *   http://github.com/spicycode/bringing-vim-to-the-people/
"   *   _Colors:
"       *   http://rtlechow.com/2008/12/256-colors-in-vim-inside-screen-in-an-iterm-on-os-x-leopard
"       *   http://pjkh.com/articles/2008/07/09/osx-iterm-screen-vim-256-colors
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"
    set t_Co=256            " Use 256 colors
    " syntax highlighting
    if has('syntax')
        syntax on
        filetype on
        filetype plugin on
        filetype indent on
        set cursorline          " What line am I on?
        :colorscheme railscasts " Still deciding if I like this or not
    endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Generic Config
"
    set encoding=utf8                   " UTF-8!  Yay!
    set nocompatible                " Vim is The Future.
    set hidden                      " 'Hidden' buffers are awesome.
    nnoremap ' `                    " ` is more useful than '.  Swap them.
    nnoremap ` '
    let mapleader=","               " Set ',' as leader.  I'm thinking that '\' might be better.  Or '`'.
    set history=1000                " More history is better
    runtime macros/matchit.vim      " Make '%' more useful
    set wildmenu                    " Make tab completion more useful
    set wildmode=list:longest
    set title                       " Show Vim title in the terminal window
    set visualbell                  " Why would I want my computer to beep at me?
    set shortmess=atI               " get rid of prompts I don't care about
    set timeoutlen=300              " Quick timeouts for command combinations
    set laststatus=2                " Always show status line
    set showmode                    " Tell me what mode I'm in (insert/visual/etc)
    set showmatch                   " Automatically show matching brace/parens/etc.

    " Modelines let me set file-specific settings with file headers
    set modeline
    set modelines=5

    " Ruler / Rulerformat 
    if has('cmdline_info')
        set ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
        set showcmd
    endif

    " temp files in ~/.vim/tmp
    set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Searching and Scrolling
"
    " scroll a bit faster
    nnoremap <C-e> 3<C-e>
    nnoremap <C-y> 3<C-y>
    
    " Highlight search, incrementally
    set hlsearch
    set incsearch

    " make search case-sensitive only when a capital letter is involved
    set ignorecase 
    set smartcase
    
    " show more stuff around the cursor
    set scrolloff=3
 
    " Toggle display of whitespace
    set listchars=tab:>-,trail:·,eol:$
    nmap <silent> <leader>s :set nolist!<CR>

    " wrap around when crossing left and right edge of editors
    set whichwrap=h,l,~,[,],<,>
    set backspace=eol,start,indent

    " Don't softwrap files by default
    set nowrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   GUI Settings (I don't actually use these (except the mouse)... will delete
"   this section if I don't install MacVim soon)
"
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

    " What's that?  You have a mouse?  And you're using iTerm?  Well then...
    if has('mouse')
        set mouse=a
    endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Indenting is serious business
"
    " Defaults: tab stop every 4 columns (autoindent too), tabs expanded to spaces
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Plugins
"
    " NERD_Tree
    let NERDChristmasTree=1
    let NERDTreeHighlightCursorline=1
    let NERDTreeShowBookmarks=1
    let NERDTreeShowHidden=1
    map <silent> <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

    " NERD_Comment
    let NERDShutUp = 1
    let NERDDefaultNesting = 0
    nmap <D-/> ,c<Space>
    vmap <D-/> ,c<Space>
    imap <D-/> <C-O>,c<Space>

    " FuzzyFinder
    let g:fuzzy_ignore="*.log;*.png;*.jpg;*.gif"
    let g:fuzzy_enumerating_limit=20
    let g:fuzzy_path_display='relative_path'
    let g:fuzzy_matching_limit=70
    map <silent> <leader>t :FuzzyFinderTextMate<CR>
    map <silent> <leader>b :FuzzyFinderBuffer<CR>
    " Use FuzzyFinder to replace built-in tag navigation (:tag / <C-]>):
    nnoremap <silent> <C-f><C-t> :FuzzyFinderTag!<CR>
    nnoremap <silent> <C-]>      :FuzzyFinderTag! <C-r>=expand('<cword>')<CR><CR>

