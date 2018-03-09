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
- Python for UltiSnips support
- [Universal Ctags](https://github.com/universal-ctags/ctags) or [Exuberant 
  Ctags](http://ctags.sourceforge.net/) for ctags support

## Installation
If you use [vim-plug](https://github.com/junegunn/vim-plug), add the following 
to your `.vimrc`:

````
Plug 'squattingmonk/vim-nwscript'
````

Then run `:PlugInstall`.

## Customization

### Comment Wrapping
By default, comments will auto-wrap at column 80, preserving any indentation. 
If you don't want this behavior, add the following to your `.vimrc`:

```
let g:nwscript#no_wrap = 1
```

### ctags
To generate ctags for your script, press `<localleader>t`. This runs using C's 
language parser. To use your own command instead, add the following to your 
`.vimrc`:

````
let g:nwscript#ctags#command = 'your command here`
````

