" Name:         Mogo
" Description:  Mogo theme
" Author:       Ken Zhou <kendotzhou@gmail.com>
" Maintainer:   Ken Zhou <kendotzhou@gmail.com>
" Website:      https://github.com/notken12/nvim
" License:      MIT
" Last Updated: Mon May 16 23:09:42 2022

" Generated by Colortemplate v2.2.0

set background=dark

hi clear
let g:colors_name = 'mogo'

let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 1
let s:italics = (&t_ZH != '' && &t_ZH != '[7m') || has('gui_running') || has('nvim')

hi! link Repeat Statement
hi! link QuickFixLine Search
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link Conditional Statement
hi! link Define PreProc
hi! link Exception Statement
hi! link Macro PreProc
hi! link PreCondit PreProc
hi! link Tag Special
hi! link Typedef Type
hi! link lCursor Cursor

if (has('termguicolors') && &termguicolors) || has('gui_running')
  let g:terminal_ansi_colors = ['#1f1f1f', '#fa755f', '#fa755f', '#ffc145', '#6fabf0', '#8aca8a', '#ffc145', '#858585', '#252525', '#fa755f', '#6fabf0', '#f8ea89', '#6fabf0', '#aacfff', '#8aca8a', '#faf1d4']
endif
if has('nvim')
  let g:terminal_color_0 = '#1f1f1f'
  let g:terminal_color_1 = '#fa755f'
  let g:terminal_color_2 = '#fa755f'
  let g:terminal_color_3 = '#ffc145'
  let g:terminal_color_4 = '#6fabf0'
  let g:terminal_color_5 = '#8aca8a'
  let g:terminal_color_6 = '#ffc145'
  let g:terminal_color_7 = '#858585'
  let g:terminal_color_8 = '#252525'
  let g:terminal_color_9 = '#fa755f'
  let g:terminal_color_10 = '#6fabf0'
  let g:terminal_color_11 = '#f8ea89'
  let g:terminal_color_12 = '#6fabf0'
  let g:terminal_color_13 = '#aacfff'
  let g:terminal_color_14 = '#8aca8a'
  let g:terminal_color_15 = '#faf1d4'
endif
if get(g:, 'mogo_transp_bg', 0) && !has('gui_running')
  hi Normal guifg=#faf1d4 guibg=#1f1f1f gui=NONE cterm=NONE
  hi CursorLineNr guifg=#faf1d4 guibg=#1f1f1f gui=NONE cterm=NONE
  hi FoldColumn guifg=#252525 guibg=#1f1f1f gui=NONE cterm=NONE
  hi LineNr guifg=#858585 guibg=#1f1f1f gui=NONE cterm=NONE
  hi Terminal guifg=#faf1d4 guibg=#1f1f1f gui=NONE cterm=NONE
else
  hi Normal guifg=#faf1d4 guibg=#1f1f1f gui=NONE cterm=NONE
  hi CursorLineNr guifg=#faf1d4 guibg=#1f1f1f gui=NONE cterm=NONE
  hi FoldColumn guifg=#252525 guibg=#1f1f1f gui=NONE cterm=NONE
  hi LineNr guifg=#858585 guibg=#1f1f1f gui=NONE cterm=NONE
  hi Terminal guifg=#faf1d4 guibg=#1f1f1f gui=NONE cterm=NONE
endif
hi ColorColumn guifg=NONE guibg=#252525 gui=NONE cterm=NONE
hi Conceal guifg=#ffc145 guibg=NONE gui=NONE cterm=NONE
hi Cursor guifg=NONE guibg=#faf1d4 gui=NONE cterm=NONE
hi CursorColumn guifg=NONE guibg=#252525 gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#252525 gui=NONE cterm=NONE
hi DiffAdd guifg=#1f1f1f guibg=#bede48 gui=reverse cterm=reverse
hi DiffChange guifg=#1f1f1f guibg=#6fabf0 gui=reverse cterm=reverse
hi DiffDelete guifg=#1f1f1f guibg=#fa755f gui=reverse cterm=reverse
hi Directory guifg=#6fabf0 guibg=NONE gui=NONE cterm=NONE
hi EndOfBuffer guifg=#252525 guibg=NONE gui=NONE cterm=NONE
hi ErrorMsg guifg=#fa755f guibg=#faf1d4 gui=reverse cterm=reverse
hi Folded guifg=#858585 guibg=#252525 gui=italic cterm=italic
hi IncSearch guifg=#35557a guibg=#faf1d4 gui=standout cterm=reverse
hi MatchParen guifg=#252525 guibg=#35557a gui=bold,reverse cterm=bold,reverse
hi ModeMsg guifg=#faf1d4 guibg=NONE gui=NONE cterm=NONE
hi MoreMsg guifg=#858585 guibg=NONE gui=NONE cterm=NONE
hi NonText guifg=#faf1d4 guibg=NONE gui=NONE cterm=NONE
hi Pmenu guifg=#faf1d4 guibg=#252525 gui=NONE cterm=NONE
hi PmenuSbar guifg=#252525 guibg=#252525 gui=NONE cterm=NONE
hi PmenuSel guifg=#faf1d4 guibg=#35557a gui=NONE cterm=NONE
hi PmenuThumb guifg=#252525 guibg=#858585 gui=NONE cterm=NONE
hi Question guifg=#858585 guibg=NONE gui=NONE cterm=NONE
hi Search guifg=#35557a guibg=#faf1d4 gui=reverse cterm=reverse
hi SignColumn guifg=#858585 guibg=NONE gui=NONE cterm=NONE
hi SpecialKey guifg=#858585 guibg=NONE gui=NONE cterm=NONE
hi StatusLine guifg=#252525 guibg=#faf1d4 gui=reverse cterm=reverse
hi StatusLineNC guifg=NONE guibg=#faf1d4 gui=reverse cterm=reverse
hi TabLine guifg=#858585 guibg=#252525 gui=NONE cterm=NONE
hi TabLineFill guifg=#faf1d4 guibg=#1f1f1f gui=NONE cterm=NONE
hi TabLineSel guifg=#faf1d4 guibg=#1f1f1f gui=NONE cterm=NONE
hi Title guifg=#faf1d4 guibg=NONE gui=bold cterm=bold
hi VertSplit guifg=#252525 guibg=NONE gui=NONE cterm=NONE
hi Visual guifg=#35557a guibg=#faf1d4 gui=reverse cterm=reverse
hi VisualNOS guifg=#faf1d4 guibg=#35557a gui=NONE cterm=NONE
hi WarningMsg guifg=#fa755f guibg=NONE gui=NONE cterm=NONE
hi Boolean guifg=#6fabf0 guibg=NONE gui=NONE cterm=NONE
hi Comment guifg=#858585 guibg=NONE gui=italic cterm=italic
hi Constant guifg=#6fabf0 guibg=NONE gui=NONE cterm=NONE
hi Delimiter guifg=#faf1d4 guibg=NONE gui=NONE cterm=NONE
hi Error guifg=#fa755f guibg=#faf1d4 gui=reverse cterm=reverse
hi Float guifg=#6fabf0 guibg=NONE gui=NONE cterm=NONE
hi Function guifg=#fa755f guibg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#f8ea89 guibg=NONE gui=NONE cterm=NONE
hi Ignore guifg=#faf1d4 guibg=NONE gui=NONE cterm=NONE
hi Include guifg=#fa755f guibg=NONE gui=NONE cterm=NONE
hi Keyword guifg=#ffc145 guibg=NONE gui=NONE cterm=NONE
hi Label guifg=#fa755f guibg=NONE gui=NONE cterm=NONE
hi Number guifg=#6fabf0 guibg=NONE gui=NONE cterm=NONE
hi Operator guifg=#faf1d4 guibg=NONE gui=NONE cterm=NONE
hi SpecialComment guifg=#fa755f guibg=NONE gui=NONE cterm=NONE
hi Statement guifg=#ffc145 guibg=NONE gui=NONE cterm=NONE
hi StorageClass guifg=#ffc145 guibg=NONE gui=NONE cterm=NONE
hi String guifg=#bede48 guibg=NONE gui=NONE cterm=NONE
hi Structure guifg=#fa755f guibg=NONE gui=NONE cterm=NONE
hi Type guifg=#aacfff guibg=NONE gui=NONE cterm=NONE
hi Underlined guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
hi CursorIM guifg=NONE guibg=#faf1d4 gui=NONE cterm=NONE
hi TSVariable guifg=#f8ea89 guibg=NONE gui=NONE cterm=NONE
hi ToolbarLine guifg=NONE guibg=#252525 gui=NONE cterm=NONE
hi ToolbarButton guifg=#ffc145 guibg=#252525 gui=bold cterm=bold
hi NormalMode guifg=#858585 guibg=#faf1d4 gui=reverse cterm=reverse
hi InsertMode guifg=#6fabf0 guibg=#1f1f1f gui=reverse cterm=reverse
hi ReplaceMode guifg=#fa755f guibg=#1f1f1f gui=reverse cterm=reverse
hi VisualMode guifg=#35557a guibg=#faf1d4 gui=reverse cterm=reverse
hi CommandMode guifg=#8aca8a guibg=#faf1d4 gui=reverse cterm=reverse
hi IndentBlanklineChar guifg=#858585 guibg=NONE gui=NONE cterm=NONE
if !s:italics
  hi Folded gui=NONE cterm=NONE
  hi Comment gui=NONE cterm=NONE
endif
if has('nvim')
  hi! link TermCursor Cursor
  hi TermCursorNC guifg=#faf1d4 guibg=#858585 gui=NONE cterm=NONE
endif

if s:t_Co >= 256
  if get(g:, 'mogo_transp_bg', 0)
    hi Normal ctermfg=230 ctermbg=234 cterm=NONE
    hi CursorLineNr ctermfg=230 ctermbg=234 cterm=NONE
    hi FoldColumn ctermfg=235 ctermbg=234 cterm=NONE
    hi LineNr ctermfg=102 ctermbg=234 cterm=NONE
    hi Terminal ctermfg=230 ctermbg=234 cterm=NONE
  else
    hi Normal ctermfg=230 ctermbg=234 cterm=NONE
    hi CursorLineNr ctermfg=230 ctermbg=234 cterm=NONE
    hi FoldColumn ctermfg=235 ctermbg=234 cterm=NONE
    hi LineNr ctermfg=102 ctermbg=234 cterm=NONE
    hi Terminal ctermfg=230 ctermbg=234 cterm=NONE
  endif
  hi ColorColumn ctermfg=NONE ctermbg=235 cterm=NONE
  hi Conceal ctermfg=214 ctermbg=NONE cterm=NONE
  hi Cursor ctermfg=NONE ctermbg=230 cterm=NONE
  hi CursorColumn ctermfg=NONE ctermbg=235 cterm=NONE
  hi CursorLine ctermfg=NONE ctermbg=235 cterm=NONE
  hi DiffAdd ctermfg=234 ctermbg=148 cterm=reverse
  hi DiffChange ctermfg=234 ctermbg=75 cterm=reverse
  hi DiffDelete ctermfg=234 ctermbg=203 cterm=reverse
  hi Directory ctermfg=75 ctermbg=NONE cterm=NONE
  hi EndOfBuffer ctermfg=235 ctermbg=NONE cterm=NONE
  hi ErrorMsg ctermfg=203 ctermbg=230 cterm=reverse
  hi Folded ctermfg=102 ctermbg=235 cterm=italic
  hi IncSearch ctermfg=24 ctermbg=230 cterm=reverse
  hi MatchParen ctermfg=235 ctermbg=24 cterm=bold,reverse
  hi ModeMsg ctermfg=230 ctermbg=NONE cterm=NONE
  hi MoreMsg ctermfg=102 ctermbg=NONE cterm=NONE
  hi NonText ctermfg=230 ctermbg=NONE cterm=NONE
  hi Pmenu ctermfg=230 ctermbg=235 cterm=NONE
  hi PmenuSbar ctermfg=235 ctermbg=235 cterm=NONE
  hi PmenuSel ctermfg=230 ctermbg=24 cterm=NONE
  hi PmenuThumb ctermfg=235 ctermbg=102 cterm=NONE
  hi Question ctermfg=102 ctermbg=NONE cterm=NONE
  hi Search ctermfg=24 ctermbg=230 cterm=reverse
  hi SignColumn ctermfg=102 ctermbg=NONE cterm=NONE
  hi SpecialKey ctermfg=102 ctermbg=NONE cterm=NONE
  hi StatusLine ctermfg=235 ctermbg=230 cterm=reverse
  hi StatusLineNC ctermfg=NONE ctermbg=230 cterm=reverse
  hi TabLine ctermfg=102 ctermbg=235 cterm=NONE
  hi TabLineFill ctermfg=230 ctermbg=234 cterm=NONE
  hi TabLineSel ctermfg=230 ctermbg=234 cterm=NONE
  hi Title ctermfg=230 ctermbg=NONE cterm=bold
  hi VertSplit ctermfg=235 ctermbg=NONE cterm=NONE
  hi Visual ctermfg=24 ctermbg=230 cterm=reverse
  hi VisualNOS ctermfg=230 ctermbg=24 cterm=NONE
  hi WarningMsg ctermfg=203 ctermbg=NONE cterm=NONE
  hi Boolean ctermfg=75 ctermbg=NONE cterm=NONE
  hi Comment ctermfg=102 ctermbg=NONE cterm=italic
  hi Constant ctermfg=75 ctermbg=NONE cterm=NONE
  hi Delimiter ctermfg=230 ctermbg=NONE cterm=NONE
  hi Error ctermfg=203 ctermbg=230 cterm=reverse
  hi Float ctermfg=75 ctermbg=NONE cterm=NONE
  hi Function ctermfg=203 ctermbg=NONE cterm=NONE
  hi Identifier ctermfg=228 ctermbg=NONE cterm=NONE
  hi Ignore ctermfg=230 ctermbg=NONE cterm=NONE
  hi Include ctermfg=203 ctermbg=NONE cterm=NONE
  hi Keyword ctermfg=214 ctermbg=NONE cterm=NONE
  hi Label ctermfg=203 ctermbg=NONE cterm=NONE
  hi Number ctermfg=75 ctermbg=NONE cterm=NONE
  hi Operator ctermfg=230 ctermbg=NONE cterm=NONE
  hi SpecialComment ctermfg=203 ctermbg=NONE cterm=NONE
  hi Statement ctermfg=214 ctermbg=NONE cterm=NONE
  hi StorageClass ctermfg=214 ctermbg=NONE cterm=NONE
  hi String ctermfg=148 ctermbg=NONE cterm=NONE
  hi Structure ctermfg=203 ctermbg=NONE cterm=NONE
  hi Type ctermfg=153 ctermbg=NONE cterm=NONE
  hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
  hi CursorIM ctermfg=NONE ctermbg=230 cterm=NONE
  hi TSVariable ctermfg=228 ctermbg=NONE cterm=NONE
  hi ToolbarLine ctermfg=NONE ctermbg=235 cterm=NONE
  hi ToolbarButton ctermfg=214 ctermbg=235 cterm=bold
  hi NormalMode ctermfg=102 ctermbg=230 cterm=reverse
  hi InsertMode ctermfg=75 ctermbg=234 cterm=reverse
  hi ReplaceMode ctermfg=203 ctermbg=234 cterm=reverse
  hi VisualMode ctermfg=24 ctermbg=230 cterm=reverse
  hi CommandMode ctermfg=114 ctermbg=230 cterm=reverse
  hi IndentBlanklineChar ctermfg=102 ctermbg=NONE cterm=NONE
  if !s:italics
    hi Folded cterm=NONE
    hi Comment cterm=NONE
  endif
  if has('nvim')
    hi! link TermCursor Cursor
    hi TermCursorNC ctermfg=230 ctermbg=102 cterm=NONE
  endif
  unlet s:t_Co s:italics
  finish
endif

if s:t_Co >= 8
  if get(g:, 'mogo_transp_bg', 0)
    hi Normal ctermfg=White ctermbg=Black cterm=NONE
    hi CursorLineNr ctermfg=White ctermbg=Black cterm=NONE
    hi FoldColumn ctermfg=Black ctermbg=Black cterm=NONE
    hi LineNr ctermfg=Gray ctermbg=Black cterm=NONE
    hi Terminal ctermfg=White ctermbg=Black cterm=NONE
  else
    hi Normal ctermfg=White ctermbg=Black cterm=NONE
    hi CursorLineNr ctermfg=White ctermbg=Black cterm=NONE
    hi FoldColumn ctermfg=Black ctermbg=Black cterm=NONE
    hi LineNr ctermfg=Gray ctermbg=Black cterm=NONE
    hi Terminal ctermfg=White ctermbg=Black cterm=NONE
  endif
  hi ColorColumn ctermfg=NONE ctermbg=Black cterm=NONE
  hi Conceal ctermfg=DarkRed ctermbg=NONE cterm=NONE
  hi Cursor ctermfg=NONE ctermbg=White cterm=NONE
  hi CursorColumn ctermfg=NONE ctermbg=Black cterm=NONE
  hi CursorLine ctermfg=NONE ctermbg=Black cterm=NONE
  hi DiffAdd ctermfg=Black ctermbg=LightGreen cterm=reverse
  hi DiffChange ctermfg=Black ctermbg=Blue cterm=reverse
  hi DiffDelete ctermfg=Black ctermbg=Red cterm=reverse
  hi Directory ctermfg=Blue ctermbg=NONE cterm=NONE
  hi EndOfBuffer ctermfg=Black ctermbg=NONE cterm=NONE
  hi ErrorMsg ctermfg=Red ctermbg=White cterm=reverse
  hi Folded ctermfg=Gray ctermbg=Black cterm=italic
  hi IncSearch ctermfg=DarkCyan ctermbg=White cterm=reverse
  hi MatchParen ctermfg=Black ctermbg=DarkCyan cterm=bold,reverse
  hi ModeMsg ctermfg=White ctermbg=NONE cterm=NONE
  hi MoreMsg ctermfg=Gray ctermbg=NONE cterm=NONE
  hi NonText ctermfg=White ctermbg=NONE cterm=NONE
  hi Pmenu ctermfg=White ctermbg=Black cterm=NONE
  hi PmenuSbar ctermfg=Black ctermbg=Black cterm=NONE
  hi PmenuSel ctermfg=White ctermbg=DarkCyan cterm=NONE
  hi PmenuThumb ctermfg=Black ctermbg=Gray cterm=NONE
  hi Question ctermfg=Gray ctermbg=NONE cterm=NONE
  hi Search ctermfg=DarkCyan ctermbg=White cterm=reverse
  hi SignColumn ctermfg=Gray ctermbg=NONE cterm=NONE
  hi SpecialKey ctermfg=Gray ctermbg=NONE cterm=NONE
  hi StatusLine ctermfg=Black ctermbg=White cterm=reverse
  hi StatusLineNC ctermfg=NONE ctermbg=White cterm=reverse
  hi TabLine ctermfg=Gray ctermbg=Black cterm=NONE
  hi TabLineFill ctermfg=White ctermbg=Black cterm=NONE
  hi TabLineSel ctermfg=White ctermbg=Black cterm=NONE
  hi Title ctermfg=White ctermbg=NONE cterm=bold
  hi VertSplit ctermfg=Black ctermbg=NONE cterm=NONE
  hi Visual ctermfg=DarkCyan ctermbg=White cterm=reverse
  hi VisualNOS ctermfg=White ctermbg=DarkCyan cterm=NONE
  hi WarningMsg ctermfg=Red ctermbg=NONE cterm=NONE
  hi Boolean ctermfg=Blue ctermbg=NONE cterm=NONE
  hi Comment ctermfg=Gray ctermbg=NONE cterm=italic
  hi Constant ctermfg=Blue ctermbg=NONE cterm=NONE
  hi Delimiter ctermfg=White ctermbg=NONE cterm=NONE
  hi Error ctermfg=Red ctermbg=White cterm=reverse
  hi Float ctermfg=Blue ctermbg=NONE cterm=NONE
  hi Function ctermfg=Red ctermbg=NONE cterm=NONE
  hi Identifier ctermfg=Yellow ctermbg=NONE cterm=NONE
  hi Ignore ctermfg=White ctermbg=NONE cterm=NONE
  hi Include ctermfg=Red ctermbg=NONE cterm=NONE
  hi Keyword ctermfg=DarkRed ctermbg=NONE cterm=NONE
  hi Label ctermfg=Red ctermbg=NONE cterm=NONE
  hi Number ctermfg=Blue ctermbg=NONE cterm=NONE
  hi Operator ctermfg=White ctermbg=NONE cterm=NONE
  hi SpecialComment ctermfg=Red ctermbg=NONE cterm=NONE
  hi Statement ctermfg=DarkRed ctermbg=NONE cterm=NONE
  hi StorageClass ctermfg=DarkRed ctermbg=NONE cterm=NONE
  hi String ctermfg=LightGreen ctermbg=NONE cterm=NONE
  hi Structure ctermfg=Red ctermbg=NONE cterm=NONE
  hi Type ctermfg=LightBlue ctermbg=NONE cterm=NONE
  hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
  hi CursorIM ctermfg=NONE ctermbg=White cterm=NONE
  hi TSVariable ctermfg=Yellow ctermbg=NONE cterm=NONE
  hi ToolbarLine ctermfg=NONE ctermbg=Black cterm=NONE
  hi ToolbarButton ctermfg=DarkRed ctermbg=Black cterm=bold
  hi NormalMode ctermfg=Gray ctermbg=White cterm=reverse
  hi InsertMode ctermfg=Blue ctermbg=Black cterm=reverse
  hi ReplaceMode ctermfg=Red ctermbg=Black cterm=reverse
  hi VisualMode ctermfg=DarkCyan ctermbg=White cterm=reverse
  hi CommandMode ctermfg=Green ctermbg=White cterm=reverse
  hi IndentBlanklineChar ctermfg=Gray ctermbg=NONE cterm=NONE
  if !s:italics
    hi Folded cterm=NONE
    hi Comment cterm=NONE
  endif
  if has('nvim')
    hi! link TermCursor Cursor
    hi TermCursorNC ctermfg=White ctermbg=Gray cterm=NONE
  endif
  unlet s:t_Co s:italics
  finish
endif

" Background: dark
" Color: base00 #1f1f1f ~ Black # Default Background
" Color: base01 #252525 ~ Black # Lighter Background (Used for status bars, line number and folding marks)
" Color: base02 #35557a ~ DarkCyan # Selection Background
" Color: base03 #858585 ~ Gray # Comments, Invisibles, Line Highlighting
" Color: base04 #cac7bd ~ White # Dark Foreground (Used for status bars)
" Color: base05 #faf1d4 ~ White # Default Foreground, Caret, Delimiters, Operators
" Color: base06 #faf1d4 ~ White # Light Foreground (Not often used)
" Color: base07 #faf1d4 ~ White # Light Background (Not often used)
" Color: base08 #f8ea89 ~ Yellow # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
" Color: base09 #6fabf0 ~ Blue # Integers, Boolean, Constants, XML Attributes, Markup Link Url
" Color: base0A #aacfff ~ LightBlue # Classes, Markup Bold, Search Text Background
" Color: base0B #bede48 ~ LightGreen # Strings, Inherited Class, Markup Code, Diff Inserted
" Color: base0C #8aca8a ~ Green # Support, Regular Expressions, Escape Characters, Markup Quotes
" Color: base0D #fa755f ~ Red # Functions, Methods, Attribute IDs, Headings
" Color: base0E #ffc145 ~ DarkRed # Keywords, Storage, Selector, Markup Italic, Diff Changed
" Color: base0F #ab7967 ~ Cyan # Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
" Term Colors: base00 base0D base0D base0E base09 base0C base0E base03
" Term Colors: base01 base0D base09 base08
" Term Colors: base09 base0A base0C base05
" vim: et ts=2 sw=2
