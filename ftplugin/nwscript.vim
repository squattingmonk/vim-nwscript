" Vim plugin file
" Language:     NWScript
" Maintainer:   Squatting Monk <squattingmonk@gmail.com>
" URL:          https://github.com.squattingmonk/vim-nwscript

" Key commands
nnoremap <buffer> <localleader>t :call nwscript#ctags#Generate()<cr>

if has("autocmd")
    " Remove trailing whitepace on save
    autocmd BufWritePre <buffer> %s/\s\+$//e
endif
