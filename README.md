# vim-nwscript

This is an add-on for vim providing support for editing NWScript.

## Features
- syntax highlighting
- auto-indention
- auto-wrapping of comments
- code snippets for [UltiSnips](https://github.com/SirVer/ultisnips)
- shortcut for generating ctags files

## Requirements
- Vim/Neovim
- [Universal Ctags](https://github.com/universal-ctags/ctags) for ctags support

## Installation
If you use [vim-plug](https://github.com/junegunn/vim-plug), add the following 
to your `.vimrc`:

````
Plug 'squattingmonk/vim-nwscript'
````

Then run `:PlugInstall`.

## Customization
This plugin has sensible (read: opinionated) defaults. If you don't like one of 
the behaviors below, you can change it in your `.vimrc` using one of the 
settings below (default values are shown).

This plugin is divided into several modules and will be expanded over time. By 
default, all modules are enabled, but you can enable or disable them 
selectively in your `.vimrc`:

```VimL
" Whitelist modules
let g:nwscript#modules#enabled = ['ctags', 'fold', 'format']

" Blacklist modules
let g:nwscript#modules#disabled = []
```

### format module
By default, comments will auto-wrap at column 80, preserving any indentation. 
Pressing `<cr>` (insert mode) or `o`/`O` (normal mode) will continue a comment 
block.

```VimL
let g:nwscript#format#textwidth = 80
let g:nwscript#format#options = 'croqwa2lj'
```

All trailing whitespace is removed when saving the file.

```VimL
let g:nwscript#format#whitespace = 1
```

### fold module
Code between brackets is automatically folded.

```VimL
let g:nwscript#fold#method = 'syntax'
let g:nwscript#fold#level = &foldlevel
let g:nwscript#fold#column = 1
```

### ctags module
This plugin comes with an options file to generate tags for NWScript files. If 
you wish to use your own ctags file, you can set the path to it in your 
`.vimrc`:

```VimL
let g:nwscript#ctags#file = '/your/path/to/nwscript.ctags'
```

To generate a tags file, you can run `:NWScriptTagGen` or press 
`<localleader>tt` while in normal mode. Alternatively, you can set your own 
mapping:

```VimL
let g:nwscript#ctags#hotkey = '<localleader>tt'

" or ...

nmap <localleader>tt <Plug>NWScriptTagGen
```

The tags file will be placed into your project's git root, 
[nasher](https://github.com/squattingmonk/nasher.nim) root, or the directory of 
the current file if no git or nasher project was detected. The generation is 
recursive, so any nwscript file in the project will be searched for tags.
