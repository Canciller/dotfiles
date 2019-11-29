" Highlight class and function names
syn match    cCustomParen    "(" contains=cParen,cCppParen
syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope

hi def link cCustomFunc  Function
hi def link cCustomClass Function

" Highlight class, struct, enum declaration
syn match cCustomClassName "\(^class\s\)\@<=\w\+"
syn match cCustomStructName "\(^struct\s\)\@<=\w\+"
syn match cCustomEnumName "\(^enum\s\)\@<=\w\+"

hi def link cCustomClassName Function
hi def link cCustomEnumName Function
hi def link cCustomStructName Function

" Highlight member variable name
syn match   cCustomDot    "\." contained
syn match   cCustomPtr    "->" contained
syn match   cCustomMemVar "\(\.\|->\)\h\w*" contains=cCustomDot,cCustomPtr

hi def link cCustomMemVar Function
