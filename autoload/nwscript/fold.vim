" Vim plugin file
" Language:     NWScript
" Maintainer:   Squatting Monk <squattingmonk@gmail.com>
" URL:          https://github.com.squattingmonk/vim-nwscript

" Init: {{{1
function! nwscript#fold#Init() abort
    " Set up defaults {{{2
    " Show foldcolumn {{{3
    if !exists('g:nwscript#fold#column')
        let g:nwscript#fold#column = 1
    endif

    " Initial foldlevel {{{3
    if !exists('g:nwscript#fold#level')
        let g:nwscript#fold#level = &foldlevel
    endif

    " How to decide folding levels {{{3
    " 'syntax': use file's syntax
    " 'expr': use expression (TODO)
    if !exists('g:nwscript#fold#method')
        let g:nwscript#fold#method = 'syntax'
    endif

    " Set up folding {{{2
    let &l:foldlevel = g:nwscript#fold#level
    let &l:foldmethod = g:nwscript#fold#method

    if g:nwscript#fold#column > 0
        let &l:foldcolumn = g:nwscript#fold#column
    endif
    " }}}2
endfunction
" }}}

" Disable: {{{1
function! nwscript#fold#Disable() abort
    setlocal foldcolumn&
    setlocal foldlevel&
    setlocal foldexpr&
    setlocal foldmethod&
endfunction

" vim: set foldmethod=marker:
