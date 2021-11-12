if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	autocmd! BufRead,BufNewFile *.reveal.html setf html.reveal
	autocmd! BufRead,BufNewFile *.mp3,*.flac,*.wav setf audio
	autocmd! BufRead,BufNewFile *.avi,*.mp4,*.mkv,*.mov,*.mpg,*.ogg setf video
augroup END
