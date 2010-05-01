""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~/.vim/ftplugin/objc.vim
" 
" Vim config for Objective-C documents
"
" @author Mike West <mike@mikewest.org>
"

" update the :make command to tell Xcode to build
set makeprg=osascript\ -e\ \"tell\ application\ \\\"Xcode\\\"\"\ -e\ \"build\"\ -e\ \"end\ tell\"

function! XcodeClean()
    silent execute ':!osascript -e "tell application \"Xcode\"" -e "Clean" -e "end tell"'
endfunction
command! -complete=command XcodeClean call XcodeClean()

function! XcodeDebug()
    silent execute '!osascript -e "tell application \"Xcode\"" -e "Debug" -e "end tell"'
endfunction
command! -complete=command XcodeDebug call XcodeDebug()

" Leader-m builds
:noremap <leader>m :make<CR>

" Leader-mm cleans the project
:noremap <leader>mm :XcodeClean<CR>
" Leader-mmm Starts the program in the debugger
:noremap <leader>mmm :XcodeDebug<CR>
