"========================================================
" Highlight All Function
"========================================================
syn match   cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match   cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
hi cFunction gui=NONE  cterm=bold ctermfg=Red

"========================================================
" Highlight All Array
"========================================================
syn match   cArray "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*\["me=e-1
hi cArray gui=NONE ctermfg=Magenta

"========================================================
" Highlight All Variables
"========================================================
syn match   cVariables "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*;"me=e-1
syn match   cVariables "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*="me=e-1
syn match   cVariables "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*!="me=e-2
syn match   cVariables "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*\."me=e-1
syn match   cVariables "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*-"me=e-1
syn match   cVariables "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*+"me=e-1
syn match   cVariables "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*\/"me=e-1
syn match   cVariables "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*%"me=e-1
syn match   cVariables "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*|"me=e-1
syn match   cVariables "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*&"me=e-1
syn match   cVariables "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*<"me=e-1
syn match   cVariables "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*>"me=e-1
" hi cVariables gui=NONE ctermfg=Green
hi cVariables gui=NONE  ctermfg=LightBlue

"========================================================
" Highlight All Arguments
"========================================================
syn match   cArguments "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*,"me=e-1
syn match   cArguments "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*$"
syn match   cArguments "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*)"me=e-1
syn match   cArguments "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*\]"me=e-1
" hi cArguments gui=NONE  ctermfg=Cyan
hi cArguments gui=NONE ctermfg=Green

"========================================================
" Highlight All Labels
"========================================================
syn match   cLabels "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*:"me=e-1
hi cLabels gui=NONE ctermfg=Magenta

"========================================================
" Highlight All Variabletype
"========================================================
syn match   cVariabletype "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*[a-zA-Z_]"me=e-1
syn match   cVariabletype "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*\*"me=e-1
" hi cVariabletype gui=NONE ctermfg=LightBlue
hi cVariabletype gui=NONE ctermfg=LightGray

"========================================================
" Highlight All Math Operator
"========================================================
" C math operators
syn match       cMathOperator     display "[-+\*/%=]"
" C pointer operators
syn match       cPointerOperator  display "->\|\."
" C logical   operators - boolean results
syn match       cLogicalOperator  display "[!<>]=\="
syn match      cLogicalOperator  display "=="
" C bit operators
syn match       cBinaryOperator   display "\(&\||\|\^\|<<\|>>\)=\="
syn match       cBinaryOperator   display "\~"
syn match       cBinaryOperatorError display "\~="
" More C logical operators - highlight in preference to binary
syn match       cLogicalOperator  display "&&\|||"
syn match      cLogicalOperatorError display "\(&&\|||\)="

" Math Operator
hi cMathOperator         cterm=bold    ctermfg=Yellow
hi cPointerOperator      cterm=bold    ctermfg=Yellow
hi cLogicalOperator      cterm=bold    ctermfg=Yellow
hi cBinaryOperator       cterm=bold    ctermfg=Yellow
hi cBinaryOperatorError  cterm=bold    ctermfg=Yellow
hi cLogicalOperator      cterm=bold    ctermfg=Yellow
hi cLogicalOperatorError cterm=bold    ctermfg=Yellow


" Black
" DarkBlue
" DarkGreen
" DarkCyan
" DarkRed
" DarkMagenta
" Brown, DarkYellow
" LightGray
" DarkGray
" Blue, LightBlue
" Green, LightGreen
" Cyan, LightCyan
" Red
" Magenta, LightMagenta
" Yellow, LightYellow
" White

