" Vim plugin file
" Language:     NWScript
" Maintainer:   Squatting Monk <squattingmonk@gmail.com>
" URL:          https://github.com.squattingmonk/vim-nwscript

" Only load one ftplugin file for this buffer
if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

" Start a new autocmd for this plugin
augroup nwscript
    autocmd!
augroup END

" Translate #include statements to nwscript file
setlocal suffixesadd=.nss

" Modules: {{{1
" We initialize stuff depending on the values of g:nwscript#modules#enabled and
" g:nwscript#modules#disabled so this ftplugin is simply a loader.
let s:enabled_modules = []
for module in g:nwscript#modules#enabled
    if index(g:nwscript#modules#disabled, module) == -1
        let s:enabled_modules = add(s:enabled_modules, module)
    endif
endfor

for module in s:enabled_modules
    exe 'call nwscript#' . module . '#Init()'
endfor

" vim: set foldmethod=marker:
