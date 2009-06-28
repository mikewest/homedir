" markdown filetype file
if exists("did\_load\_filetypes")
    finish
endif
augroup markdown
    au! BufRead,BufNewFile *.mkd,*.markdown,*.mkdwn     setfiletype mkd
augroup END
augroup tasks
    au! BufRead,BufNewFile *.taskpaper,*.tasks,*.todo   setfiletype taskpaper
augroup END
