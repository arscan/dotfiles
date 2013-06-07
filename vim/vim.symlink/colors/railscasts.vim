" Vim color scheme based on http://github.com/jpo/vim-railscasts-theme
"
" Name:        railscasts.vim
" Maintainer:  Ryan Bates
" License:     MIT

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "railscasts"

" Colors
" Brown        #BC9357
" Dark Blue    #6D9CBD
" Dark Green   #509E50
" Dark Orange  #CC7733
" Light Blue   #CFCFFF
" Light Green  #A5C160
" Tan          #FFC66D
" Red          #DA4938 

hi normal     guifg=#e6e1dc guibg=#232323 ctermfg=188
hi cursor     guibg=#ffffff ctermbg=231
hi CursorLine guibg=#333435 cterm=NONE ctermbg=59
hi LineNr     guifg=#666666 ctermfg=59
hi Visual     guibg=#5A647E ctermbg=60
hi Search     guifg=NONE    guibg=#131313  gui=NONE ctermfg=232 ctermbg=250
hi Folded     guifg=#F6F3E8 guibg=#444444  gui=NONE ctermfg=230 ctermbg=59 cterm=NONE
hi Directory  guifg=#A5C160 gui=NONE ctermfg=143 cterm=NONE
hi Error      guifg=#FFFFFF guibg=#990000 ctermfg=231 ctermbg=88
hi MatchParen guifg=NONE    guibg=#131313
hi Title      guifg=#E6E1DC ctermfg=188

hi Comment    guifg=#BC9357 guibg=NONE     gui=italic ctermfg=137 ctermbg=NONE
hi! link Todo Comment

hi String     guifg=#A5C160 ctermfg=143
hi! link Number String
hi! link rubyStringDelimiter String

" nil, self, symbols
hi Constant guifg=#6D9CBD ctermfg=73

" def, end, include, load, require, alias, super, yield, lambda, proc
hi Define guifg=#CC7733 gui=NONE ctermfg=173 cterm=NONE
hi! link Include Define
hi! link Keyword Define
hi! link Macro Define

" #{foo}, <%= bar %>
hi Delimiter guifg=#509E50 ctermfg=71
" hi erubyDelimiter guifg=NONE

" function name (after def)
hi Function guifg=#FFC66D gui=NONE ctermfg=221 cterm=NONE

"@var, @@var, $var
hi Identifier guifg=#CFCFFF gui=NONE ctermfg=189 cterm=NONE

" #if, #else, #endif

" case, begin, do, for, if, unless, while, until, else
hi Statement guifg=#CC7733 gui=NONE ctermfg=173 cterm=NONE
hi! link PreProc Statement
hi! link PreCondit Statement

" SomeClassName
hi Type guifg=NONE gui=NONE cterm=NONE ctermfg=NONE

" has_many, respond_to, params
hi railsMethod guifg=#DA4938 gui=NONE ctermfg=167 cterm=NONE

hi DiffAdd guifg=#E6E1DC guibg=#144212 ctermfg=188 ctermbg=22
hi DiffDelete guifg=#E6E1DC guibg=#660000 ctermfg=188 ctermbg=52

hi xmlTag guifg=#E8BF6A ctermfg=179
hi! link xmlTagName  xmlTag
hi! link xmlEndTag   xmlTag
hi! link xmlArg      xmlTag
hi! link htmlTag     xmlTag
hi! link htmlTagName xmlTagName
hi! link htmlEndTag  xmlEndTag
hi! link htmlArg     xmlArg

" Popup Menu
" ----------
" normal item in popup
hi Pmenu guifg=#F6F3E8 guibg=#444444 gui=NONE
" selected item in popup
hi PmenuSel guifg=#000000 guibg=#A5C160 gui=NONE
" scrollbar in popup
hi PMenuSbar guibg=#5A647E gui=NONE
" thumb of the scrollbar in the popup
hi PMenuThumb guibg=#AAAAAA gui=NONE

