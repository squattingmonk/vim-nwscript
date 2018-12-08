" Vim syntax file
" Language:     NWScript
" Maintainer:   Squatting Monk <squattingmonk@gmail.com>
" URL:          https://github.com.squattingmonk/vim-nwscript

" Quit when a custom syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

syn keyword nssType         void int float string object location
syn keyword nssType         effect itemproperty action vector
syn keyword nssStatement    break return continue
syn keyword nssConditional  if else switch
syn keyword nssRepeat       while for do
syn keyword nssLabel        case default
syn keyword nssStorageClass const
syn keyword nssStructure    struct
syn keyword nssBoolean      TRUE FALSE
syn keyword nssConstant     OBJECT_SELF OBJECT_INVALID

syn region  nssBlock        start="{"   end="}" transparent fold
syn region  nssString       start=+"+   end=+"+     end=+$+ skip=+\\"+
syn region  nssComment      start='/\*' end='\*/' fold
syn region  nssComment      start='//'  end='$'

syn match   nssInclude      '^#.\+' contains=nssString
syn match   nssFunction     /\w\+\s*(/me=e-1,he=e-1
syn match   nssNumber       '\(\w\)\@<!-\=\d\+\(.\d\+f\=\)\=\(\w\)\@!'
syn match   nssNumber       '\(\w\)\@<!0x\x\{1,8}'

" Define the default highlighting.
hi def link nssType         Type
hi def link nssStatement    Statement
hi def link nssConditional  Conditional
hi def link nssRepeat       Repeat
hi def link nssLabel        Label
hi def link nssStorageClass StorageClass
hi def link nssStructure    Structure
hi def link nssBoolean      Boolean
hi def link nssConstant     Constant
hi def link nssString       String
hi def link nssComment      Comment
hi def link nssInclude      Include
hi def link nssNumber       Number
hi def link nssOperator     Operator
hi def link nssFunction     Function

let b:current_syntax = "nwscript"
