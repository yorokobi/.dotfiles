" Vim syntax file
" Language: Splunk configuration files
" Maintainer: Colby Williams <colwilliams@splunk.com>
" Last Change: 2013 Jan 31 

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

setlocal iskeyword+=-
syn case match

syn match confComment /^#.*/ contains=confTodo oneline display

syn keyword confBoolean on off true false 0 1
syn keyword confTodo FIXME NOTE TODO contained

syn keyword confCommon host source sourcetype index queue
syn keyword confStanzas monitor splunktcp

syn region confStanza matchgroup=confStanzaStart start=/^\[/ matchgroup=confStanzaEnd end=/\]/ oneline display contains=confStanzas

hi def link confBoolean Boolean
hi def link confTodo Todo
hi def link confStanzas Repeat
