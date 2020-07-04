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
    
    " Default script source directory {{{2
    if !exists('g:nwscript#ctags#includes')
        let g:nwscript#ctags#includes = [$XDG_DATA_HOME . '/nwscript']
    endif

    let l:root = nwscript#ctags#GetProjectRoot()
    if index(g:nwscript#ctags#includes, l:root) < 0
        let g:nwscript#ctags#includes = [l:root] + g:nwscript#ctags#includes
    endif

    " Set up path and tagfiles {{{2
    for dir in g:nwscript#ctags#includes
        if isdirectory(dir)
            " The path allows us to use gf to jump to include files
            if empty(&l:path)
                let &l:path = dir . '/**'
            else
                let &l:path .= ',' . dir . '/**'
            endif

            if empty(&l:tags)
                let &l:tags = dir . '/.tags'
            else
                let &l:tags .= ',' . dir . '/.tags'
            endif
        endif
    endfor

    " Add command to generate tag file {{{2
    command! -nargs=0 NWScriptTagGen call nwscript#ctags#Generate()
    command! -nargs=0 NWScriptTagGenAll call nwscript#ctags#GenerateAll()

    " Add keymappings to generate tag files {{{2
    nnoremap <silent> <Plug>NWScriptTagGen :call nwscript#ctags#Generate()<cr>
    if !hasmapto('<Plug>NWScriptTagGen', 'n') && empty(mapcheck('<localleader>tt', 'n'))
        nmap <localleader>tt <Plug>NWScriptTagGen
    endif
    nnoremap <silent> <Plug>NWScriptTagGenAll :call nwscript#ctags#GenerateAll()<cr>
    if !hasmapto('<Plug>NWScriptTagGenAll', 'n') && empty(mapcheck('<localleader>TT', 'n'))
        nmap <localleader>TT <Plug>NWScriptTagGenAll
    endif
endfunction

" GetProjectRoot: {{{1
" Finds the root of the nasher or git repo; if not a repo, uses the directory
" of the current file. This directory will hold the generated tag file.
function! nwscript#ctags#GetProjectRoot() abort
    let l:file = expand('%:p:h')
    let l:gitroot = finddir('.git', l:file . ';')
    let l:nasherroot = findfile('nasher.cfg', l:file . ';')

    if !empty(l:gitroot)
        let l:file = fnamemodify(l:gitroot, ':p:h:h')
        echom 'Using git root'
    elseif !empty(l:nasherroot)
        let l:file = fnamemodify(l:nasherroot, ':p:h')
        echom 'Using nasher root'
    endif
    return fnameescape(l:file)
endfunction

" GetCmd: {{{1
" Create the proper ctags command
function! s:GetCmd() abort
    let l:cmd = 'ctags -R -o .tags --languages=nwscript'

    " Don't source the ctags file if the user has already defined one
    if (index(split(system('ctags --list-languages')), 'nwscript') < 0)
        let l:cmd .= ' --options=' . g:nwscript#ctags#file
    endif
    return l:cmd
endfunction

" s:Generate: {{{1
" Do the actual file generation
function! s:Generate(cmd, dir) abort
    execute 'cd ' . a:dir
    echo 'Generating tagile for ' . a:dir
    call system(a:cmd)
    execute 'cd -'
endfunction

" Generate: {{{1
" Generates a tag file for the open script. The tag file is created in the
" project root. If a ctags file for nwscript has not already been defined by
" the user, the one bundled with the plugin will be used instead.
function! nwscript#ctags#Generate() abort
    let l:cmd = s:GetCmd()
    let l:dir = nwscript#ctags#GetProjectRoot()
    call s:Generate(l:cmd, l:dir)
endfunction

" GenerateAll: {{{1
" Generates a tag file for each directory in g:nwscript#ctags#includes.
function! nwscript#ctags#GenerateAll() abort
    let l:cmd = s:GetCmd()
    for dir in g:nwscript#ctags#includes
        if isdirectory(dir)
            call s:Generate(l:cmd, dir)
        endif
    endfor
endfunction

" vim: set foldmethod=marker:
