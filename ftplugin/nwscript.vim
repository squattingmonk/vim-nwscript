" Vim plugin file
" Language:     NWScript
" Maintainer:   Squatting Monk <squattingmonk@gmail.com>
" URL:          https://github.com.squattingmonk/vim-nwscript

" Automatic comment wrapping
if !exists("g:nwscript#no_wrap")
    setlocal textwidth=80
    setlocal formatoptions=croqwa2lj
endif

" Folding support
if !exists("g:nwscript#no_fold")
    setlocal foldmethod=syntax
    setlocal foldenable
endif

" Key commands
nnoremap <buffer> <localleader>t :call nwscript#ctags#Generate()<cr>

if has("autocmd")
    " Remove trailing whitepace on save
    autocmd BufWritePre <buffer> %s/\s\+$//e
endif
