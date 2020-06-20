" Vim plugin file
" Language:     NWScript
" Maintainer:   Squatting Monk <squattingmonk@gmail.com>
" URL:          https://github.com.squattingmonk/vim-nwscript

" Init: {{{1
function! nwscript#format#Init() abort
    " Set up defaults {{{2
    " Wrap comments {{{3
    if !exists('g:nwscript#format#textwidth')
        let g:nwscript#format#textwidth = 80
    endif

    " Comment formatting {{{3
    if !exists('g:nwscript#format#options')
        let g:nwscript#format#options = 'croqwa2lj'
    endif

    " Whitespace cleanup {{{3
    if !exists('g:nwscript#format#whitespace')
        let g:nwscript#format#whitespace = 1
    endif

    " Set options {{{2
    let &l:textwidth = g:nwscript#format#textwidth
    let &l:formatoptions = g:nwscript#format#options

    if g:nwscript#format#whitespace
        augroup nwscript
            autocmd BufWritePre <buffer> %s/\s\+$//e
        augroup END
    endif

    " Copy indent level from previous line
    setlocal autoindent

    " Don't insert extra space after punctuation when joining lines
    setlocal nojoinspaces
    " }}}2
endfunction

" vim: set foldmethod=marker:
