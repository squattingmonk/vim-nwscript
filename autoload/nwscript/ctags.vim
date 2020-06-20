" Vim plugin file
" Language:     NWScript
" Maintainer:   Squatting Monk <squattingmonk@gmail.com>
" URL:          https://github.com.squattingmonk/vim-nwscript

" Init: {{{1
function! nwscript#ctags#Init() abort
    " Path to tags definition {{{2
    if !exists('g:nwscript#ctags#file')
        let g:nwscript#ctags#file = g:nwscript#plugin#path . '/ctags/nwscript.ctags'
    endif
    
    " Default taggen keymapping {{{2
    if !exists('g:nwscript#ctags#hotkey')
        let g:nwscript#ctags#hotkey = '<localleader>tt'
    endif
    
    " Add hidden tag files {{{2
    setlocal tags^=./.tags;

    " Add command to generate tag file {{{2
    command! -nargs=0 NWScriptTagGen call nwscript#ctags#Generate()

    " Add keymapping to generate tag file {{{2
    nnoremap <silent> <Plug>NWScriptTagGen :call nwscript#ctags#Generate()<cr>
    if !hasmapto('<Pkug>NWScriptTagGen', 'n') && empty(mapcheck(g:nwscript#ctags#hotkey, 'n'))
        nmap <localleader>tt <Plug>NWScriptTagGen
    endif
endfunction

" GetProjectRoot: {{{1
" Finds the root of the nasher or git repo; if not a repo, uses the directory
" of the current file. This directory will hold the generated tag file.
function! nwscript#ctags#GetProjectRoot() abort
    let l:file = expand('%:p')
    let l:gitroot = finddir('.git', l:file . ';')
    let l:nasherroot = findfile('nasher.cfg', l:file . ';')

    if !empty(l:gitroot)
        let l:file = l:gitroot
    elseif !empty(l:nasherroot)
        let l:file = l:nasherroot
    endif
    return fnameescape(fnamemodify(l:file, ':h'))
endfunction

" Generate: {{{1
" Generates a tag file for the open script. The tag file is created in the
" project root. If a ctags file for nwscript has not already been defined by
" the user, the one bundled with the plugin will be used instead.
function! nwscript#ctags#Generate()
    let l:dir = getcwd()
    let l:root = nwscript#ctags#GetProjectRoot()
    let l:cmd = 'ctags -R -o .tags --languages=nwscript'

    " Don't source the ctags file if the user has already defined one
    if (index(split(system('ctags --list-languages')), 'nwscript') < 0)
        let l:cmd .= ' --options=' . g:nwscript#ctags#file
    endif
    execute 'cd ' . l:root
    call system(l:cmd)
    execute 'cd ' . l:dir
endfunction

" vim: set foldmethod=marker:
