" markdown filetype file
if exists("did\_load\_filetypes")
    finish
endif
augroup tasks
    au! BufRead,BufNewFile *.taskpaper,*.tasks,*.todo   setfiletype taskpaper
augroup END
augroup nginx
    au! BufRead,BufNewFile /usr/local/nginx/sites-enabled/*,/usr/local/nginx/sites-available    setfiletype nginx
augroup END
augroup velocity
    au! BufRead,BufNewFile *.vm  setfiletype velocity 
augroup END
augroup bikeshed
    au! BufRead,BufNewFile *.bs  setfiletype bikeshed
augroup END
