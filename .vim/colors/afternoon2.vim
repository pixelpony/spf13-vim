"
"	Vim color file
"
"	Afternoon <noon at aftnn.org>, 2004
"

set background=light	
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="afternoon2"

hi Normal		guifg=black		guibg=white

hi Comment		gui=NONE		guifg=#666666		guibg=NONE
hi Constant		gui=NONE		guifg=magenta		guibg=NONE
hi Identifier	gui=NONE		guifg=#990099		guibg=NONE
hi Statement 	gui=NONE		guifg=darkGreen		guibg=NONE
hi Keyword		gui=NONE		guifg=blue			guibg=NONE
hi Type			gui=NONE		guifg=darkGreen		guibg=NONE
hi Special		gui=NONE		guifg=darkGreen		guibg=NONE
hi Include		gui=NONE		guifg=#009999		guibg=NONE

hi StatusLine	gui=bold		guibg=black			guifg=white
hi StatusLineNC	gui=bold		guibg=#666666		guifg=white

hi link Define Statement
hi link Operator Identifier
hi link Boolean Constant

hi link Function Keyword
hi link Exception Keyword
hi link Conditional Keyword
hi link Repeat Keyword
hi link PreProc Keyword
hi link StorageClass Keyword
