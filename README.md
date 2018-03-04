# vim-nwscript

This is an add-on for vim providing support for editing NWScript.

# Features
- syntax highlighting
- auto-indention
- code snippets for [UltiSnips](https://github.com/SirVer/ultisnips)
- shortcut for generating ctags files

# Requirements
- Vim/Neovim
- Python for UltiSnips support
- [Universal Ctags](https://github.com/universal-ctags/ctags) or [Exuberant 
  Ctags](http://ctags.sourceforge.net/) for ctags support

# Installation
If you use [vim-plug](https://github.com/junegunn/vim-plug), add the following 
to your `.vimrc`:

````
Plug 'squattingmonk/vim-nwscript'
````

Then run `:PlugInstall`.

# ctags
To generate ctags for your script, press `<localleader>t`. This runs using C's 
language parser. To use your own command instead, add the following to your 
`.vimrc`:

````
let g:nwscript#ctags#command = 'your command here`
````

