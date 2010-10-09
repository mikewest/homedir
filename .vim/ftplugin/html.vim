""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~/.vim/ftplugin/html.vim
" 
" Vim config for HTML documents
"
" @author Mike West <mike@mikewest.org>
"

" Open HTML documents in default browser (silently)
nmap <Leader>o :silent ! open %<CR><C-l>


" HTML tab stop every 4 columns (autoindent too), tabs expanded to spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
