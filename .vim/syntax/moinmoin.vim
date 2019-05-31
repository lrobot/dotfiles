" Vim syntax file
" Language:	MoinMoin Wiki
" Maintainer:	Robert Kieffer <robert@broofa.com>
" URL:		http://www.broofa.com/Tools/vim/syntax/moinmoin.vim
" Last Change:  2007 Jan 25

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

syn match  wikiError		"''\+"
syn match  wikiError		"^\(\s\s\)*\s"
syn match  wikiH1		"^= .* =$"
syn match  wikiH2		"^== .* ==$"
syn match  wikiH3		"^=== .* ===$"
syn match  wikiH4		"^==== .* ====$"
syn match  wikiH5		"^===== .* =====$"
syn match  wikiI		"''.*''"
syn match  wikiB		"'''.*'''"
syn match  wikiBI		"'''''.*'''''"
syn match  wikiLI		"^\(\s\s\)\+\* "
syn match  wikiLI		"^\(\s\s\)\+[0-9]\+\. "
syn match  wikiLI		"^\s\+::"
syn match  wikiUnderline		"^__.*__"
syn match  wikiA		"\[http:.*\]"
syn match  wikiA		"\[wiki:.*\]"
"see '\@<!' in vimdoc.org
syn match  wikiA		"\(!\)\@<!\<[A-Z]\+[a-z]\+[A-Z][a-zA-Z]*\>"

hi wikiBLOCKQUOTE guifg=#555555
hi wikiH1 gui=bold guifg=#007700 guibg=#cccccc
hi wikiH2 gui=bold guifg=#007700 guibg=#dddddd
hi wikiH3 gui=bold guifg=#007700
hi wikiH4 gui=bold guifg=#559955
hi wikiH5 gui=bold guifg=#77aa77
hi wikiA gui=underline guifg=#000099
hi wikiB gui=bold
hi wikiI gui=italic
hi wikiBI gui=italic,bold
hi wikiLI gui=bold guifg=#ffccaa
hi wikiUnderline gui=underline
hi wikiError gui=standout
