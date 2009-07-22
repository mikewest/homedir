""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~/.vim/ftplugin/php.vim
" 
" Vim config for PHP documents, nothing here is new... mostly cribbed from 
" http://svn.toby.phpugdo.de/horde/chora/co.php?r=52&f=.vim%2Fftplugin%2Fphp.vim
"
" @author Mike West <mike@mikewest.org>
"

" Check PHP syntax with the :make command
setlocal makeprg=php\ -l\ %
setlocal errorformat=%m\ in\ %f\ on\ line\ %l
