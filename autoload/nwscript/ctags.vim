if !exists("g:nwscript#ctags#command")
    let g:nwscript#ctags#command = "ctags --language-force=c --totals --c-kinds=cdefgmnpstuvx --fields=fksmnSzt *.nss"
endif

function nwscript#ctags#Generate()
    echo system(g:nwscript#ctags#command)
endfunction
