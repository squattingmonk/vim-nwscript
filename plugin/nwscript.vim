" Vim plugin file
" Language:     NWScript
" Maintainer:   Squatting Monk <squattingmonk@gmail.com>
" URL:          https://github.com.squattingmonk/vim-nwscript

" Only load once {{{1
if get(g:, 'nwscript#loaded', 0)
    finish
endif
let g:nwscript#loaded = 1

" Modules: {{{1
" Enabled modules {{{2
if !exists('g:nwscript#modules#enabled')
    let g:nwscript#modules#enabled = ['ctags', 'fold', 'format']
endif

" Disabled modules {{{2
if !exists('g:nwscript#modules#disabled')
    let g:nwscript#modules#disabled = []
endif

" Disable ctags module if not on system {{{3
if !executable('ctags') && index(g:nwscript#modules#disabled, 'ctags') < 0
    let g:nwscript#modules#disabled = add(g:nwscript#modules#disabled, 'ctags')
endif

" Paths: {{{1
if !exists('g:nwscript#plugin#path')
    let g:nwscript#plugin#path = expand('<sfile>:p:h:h')
endif

" vim: set foldmethod=marker:
