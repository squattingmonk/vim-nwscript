" Vim indent file
" Language:     NWScript
" Maintainer:   Squatting Monk <squattingmonk@gmail.com>
" URL:          https://github.com/squattingmonk/vim-nwscript

" Only load this indent file when no other was loaded
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

" NWScript uses C indenting by default
setlocal cindent

let b:undo_indent = "setl cin<"
