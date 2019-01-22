highlight clear
if exists("syntax_on")
  syntax reset
endif

set background=dark

let g:colors_name = 'blackberry'

function!  GuiFor(group, ...)
  let histring = 'hi ' . a:group . ' '

  if strlen(a:1)
    let histring .= 'guibg=' . a:1 . ' '
  endif

  if strlen(a:2)
    let histring .= 'guifg=' . a:2 . ' '
  endif

  if a:0 >= 3 && strlen(a:3)
    let histring .= 'gui=' . a:3 . ' '
  endif

  execute histring
endfunction

let s:bg_light = "#282a36"
let s:bg_normal = "#21222c"
let s:bg_dark = "#1a1b23"
let s:bg_darker = "#10121a"

let s:fg_inactive_light = "#585965"
let s:fg_inactive = "#323441"

let s:fg_normal = "#f8f8f2"

let s:magenta_color = "#cc0ecc"
let s:red_color = "#dc143c"
let s:yellow_color = "#ffff60"
let s:purple_color = "#4c5067"
let s:orange_color = "#ff7538"

call GuiFor("StatusLineReverse", s:fg_normal, s:bg_normal, "bold")
call GuiFor("StatusLineMode", s:purple_color, s:bg_dark, "bold")
call GuiFor("EndOfBuffer", "none", s:fg_inactive, "bold")
call GuiFor("NonText", "none", s:fg_inactive)
call GuiFor("ErrorMsg", "none", s:red_color, "")
call GuiFor("WarningMsg", "none", s:yellow_color)
call GuiFor("LineNr", s:bg_dark, s:fg_inactive)
call GuiFor("CursorLineNr", s:bg_dark, s:fg_inactive_light, "bold")
call GuiFor("StatusLine", s:bg_normal, s:fg_normal, "bold")
call GuiFor("StatusLineNC", s:bg_normal, s:fg_inactive_light, "none")
call GuiFor("VertSplit", s:bg_normal, s:bg_normal, "none")
call GuiFor("Title", "none", s:purple_color)
call GuiFor("Visual", s:bg_light, "none", "none")
call GuiFor("Folded", s:bg_light, s:fg_normal, "italic")
call GuiFor("Pmenu", s:bg_normal, s:fg_normal, "none")
call GuiFor("PmenuSel", s:fg_normal, s:bg_normal, "none")
call GuiFor("PmenuSbar", s:bg_normal, "none", "none")
call GuiFor("PmenuThumb", s:bg_light, "none" ,"none")
call GuiFor("TabLine", s:bg_normal, s:fg_normal, "none")
call GuiFor("TabLineSel", s:fg_normal, s:bg_dark, "bold")
call GuiFor("TabLineFill", s:bg_normal, s:fg_normal, "none")
call GuiFor("CursorColumn", s:bg_dark, "none", "none")
call GuiFor("CursorLine", s:bg_normal, "none", "none")
call GuiFor("Normal", s:bg_dark, s:fg_normal) 
