" Copyright (c) 2015-2019, Cody Opel <codyopel@gmail.com>
"
" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at
"
"     http://www.apache.org/licenses/LICENSE-2.0
"
" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.

function! s:hi(group, fg, bg, attr, guisp)
  if !empty(a:fg)
    exec "highlight " . a:group . " guifg=" . a:fg[0] . " ctermfg=" . a:fg[1]
  endif
  if !empty(a:bg)
    exec "highlight " . a:group . " guibg=" . a:bg[0] . " ctermbg=" . a:bg[1]
  endif
  if a:attr != ""
    exec "highlight " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if a:guisp != ""
    exec "highlight " . a:group . " guisp=#" . a:guisp
  endif
endfunction

" Hack to support additional colors for contrast in a few secenarios.
function! s:altclr(primary, secondary)
  if has("gui_running") || &t_Co > 16
    return a:primary
  else
    return a:secondary
  endif
endfunction

"
"" Color Definitions
"

let s:c00 = [ "#272822", '00' ]
let s:c01 = [ "#f92672", '01' ]
let s:c02 = [ "#a6e22e", '02' ]
let s:c03 = [ "#e6db74", '03' ]
let s:c04 = [ "#1a1919", '04' ]
let s:c05 = [ "#ae81ff", '05' ]
let s:c06 = [ "#66d9ef", '06' ]
let s:c07 = [ "#f8f8f2", '07' ]
let s:c08 = [ "#75715e", '08' ]
let s:c09 = [ "#fd971f", '09' ]
let s:c10 = [ "#2196e8", '04' ]  " dupe
let s:c11 = [ "#ae81ff", '05' ]  " dupe
let s:c12 = [ "#66d9ef", '06' ]  " dupe
let s:c13 = [ "#f8f8f2", '07' ]  " dupe
let s:c14 = [ "#75715e", '08' ]  " dupe
let s:c15 = [ "#f8f8f0", '15' ]
let s:black = [ "#000000", "016" ]
let s:graynonp = [ "#3a3a3a", "237" ]

if has("nvim")
  let g:terminal_color_0 = s:c00[0]
  let g:terminal_color_1 = s:c01[0]
  let g:terminal_color_2 = s:c02[0]
  let g:terminal_color_3 = s:c03[0]
  let g:terminal_color_4 = s:c04[0]
  let g:terminal_color_5 = s:c05[0]
  let g:terminal_color_6 = s:c06[0]
  let g:terminal_color_7 = s:c07[0]
  let g:terminal_color_8 = s:c08[0]
  let g:terminal_color_9 = s:c09[0]
  let g:terminal_color_10 = s:c10[0]
  let g:terminal_color_11 = s:c11[0]
  let g:terminal_color_12 = s:c12[0]
  let g:terminal_color_13 = s:c13[0]
  let g:terminal_color_14 = s:c14[0]
  let g:terminal_color_15 = s:c15[0]
endif

"
"" Setup
"

highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name="monokai"

"
"" Highlighting
"

call s:hi("Boolean", s:c05, "", "", "")
call s:hi("Builtin", s:c06, "", "", "")
call s:hi("Character", s:c03, "", "", "")
call s:hi("ColorColumn", "", s:altclr(s:black, s:c08), "none", "")
call s:hi("Comment", s:c08, "", "", "")
call s:hi("Conditional", s:c01, "", "", "")
call s:hi("Constant", s:c05, "", "bold", "")
call s:hi("Cursor", s:c15, s:c15, "bold", "")
call s:hi("CursorColumn", "", s:c08, "none", "")
call s:hi("CursorLine", "", s:altclr(s:black, s:c08), "none", "")
call s:hi("CursorLineNr", s:c03, "", "none", "")
call s:hi("Debug", s:c15, "", "bold", "")
call s:hi("Define", s:c01, "", "", "")
call s:hi("Delimiter", s:c07, "", "", "")
call s:hi("DiffAdd", s:c02, s:c00, "", "")
call s:hi("DiffChange", s:c03, s:c00, "", "")
call s:hi("DiffDelete", s:c01, s:c00, "", "")
call s:hi("DiffText", s:c15, "", "bold", "")
call s:hi("EndOfBuffer", s:c01, s:altclr(s:black, s:c08), "", "")
call s:hi("ErrorMsg", s:c00, s:c09, "", "")
call s:hi("Float", s:c05, "", "", "")
call s:hi("Folded", "", s:c00, "", "")
call s:hi("Function", s:c02, "", "", "")
call s:hi("FunctionArgument", s:c09, "", "", "")  " Should be for overload
call s:hi("Identifier", s:c02, "", "none", "")
call s:hi("Include", s:c01, "", "", "")
call s:hi("Keyword", s:c01, "", "", "")
call s:hi("LineNr", s:altclr(s:c08, s:c07), s:altclr(s:black, s:c08), "none", "")
call s:hi("Macro", s:c03, "", "", "")
call s:hi("MatchParen", s:c09, "", "bold", "")
call s:hi("NonText", s:altclr(s:graynonp, s:c00), "", "", "")
call s:hi("Normal", s:c15, "", "", "")
call s:hi("Number", s:c05, "", "", "")
call s:hi("Operator", s:c01, "", "", "")
call s:hi("PreCondit", s:c10, "", "bold", "")
call s:hi("PreProc", s:c03, "", "", "")
call s:hi("Repeat", s:c01, "", "", "")
call s:hi("Search", "", s:c04, "", "")
call s:hi("Special", s:c12, "", "", "")
call s:hi("SpecialKey", s:altclr(s:graynonp, s:c00), "", "", "")
call s:hi("Statement", s:c01, "", "", "")
call s:hi("String", s:c03, "", "", "")
call s:hi("Todo", s:c14, "", "italic", "")
call s:hi("Type", s:c06, "", "", "")

" Fix CursorLine causing SpecialKey characters to be highlighted as Normal.
autocmd VimEnter * call matchadd('SpecialKey', '\s\+', -1)
autocmd VimEnter * call matchadd('SpecialKey', '\n', -1)
autocmd VimEnter * call matchadd('SpecialKey', '\t\+', -1)

"
"" Plugin/Syntax Overrides
"

" Bundled c.vim
highlight default link cDefine Keyword
highlight default link cSpecial Builtin

" Bundled diff.vim
highlight default link diffAdded DiffAdd
highlight default link diffChanged DiffChange
highlight default link diffRemoved DiffDelete
highlight default link diffNewFile DiffDelete
highlight default link diffOldFile DiffText
highlight default link diffFile DiffAdd

" Bundled go.vim
highlight default link goConstants Constant

" https://github.com/LnL7/vim-nix
highlight default link nixArgumentDefinition FunctionArgument
highlight default link nixAttribute Function
highlight default link nixInterpolationParam FunctionArgument
highlight default link nixList FunctionArgument
highlight default link nixNamespacedBuiltin Builtin
highlight default link nixSimpleFunctionArgument FunctionArgument
highlight default link nixPath String
highlight default link nixSimpleBuiltin Builtin
highlight default link nixStringDelimiter String
highlight default link nixURI String

" https://github.com/vim-python/python-syntax
let g:python_highlight_all = 1
let g:python_print_as_function = 0
" syn keyword pythonFuncStatement def class nextgroup=pythonFunction skipwhite
" hi link pythonFuncStatement Statement
highlight default link pythonStatement Keyword
highlight default link pythonBuiltinFunc Builtin
highlight default link pythonRun Comment
" Arbitrarily using boolean for the correct color
highlight default link pythonNone Boolean

" Bundled sh.vim
highlight default link shCommandSub Normal
highlight default link shExSingleQuote Normal
highlight default link shLoop Keyword
" shOperator also includes !, &, and |
highlight default link shOperator Normal
highlight default link shQuote String
highlight default link shSetList Normal
highlight default link shStatement Builtin
" These are not builtins
highlight default link bashStatement Normal
highlight default link kshStatement Normal

" Bundled vim.vim
highlight default link vimCommand Keyword

" vim-better-whitespace
call s:hi("ExtraWhitespace", "", s:c01, "", "")

"
"" Cleanup
"

unlet s:c00
unlet s:c01
unlet s:c02
unlet s:c03
unlet s:c04
unlet s:c05
unlet s:c06
unlet s:c07
unlet s:c08
unlet s:c09
unlet s:c10
unlet s:c11
unlet s:c12
unlet s:c13
unlet s:c14
unlet s:c15

" Must be at the end, because of ctermbg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark
