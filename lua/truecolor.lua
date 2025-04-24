-- Copyright (c) 2015-2019, 2021-2022, Cody Opel <cwopel@chlorm.net>
--
-- Licensed under the Apache License, Version 2.0 (the 'License');
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an 'AS IS' BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.


local function h(group, style)
    local args = ''

    if style.fg then
        args = args .. ' ctermfg=' .. style.fg.ansi
        args = args .. ' guifg=' .. style.fg.rgb
    end

    if style.bg then
        args = args .. ' ctermbg=' .. style.bg.ansi
        args = args .. ' guibg=' .. style.bg.rgb
    end

    if style.attr then
        args = args .. ' cterm=' .. style.attr
        args = args .. ' gui=' .. style.attr
    end

    if style.sp then
        args = args .. ' guisp=' .. style.sp
    end

    vim.cmd('highlight ' .. group .. args)
end

local function l(oldGroup, newGroup)
    vim.cmd('highlight default link ' .. oldGroup .. ' ' .. newGroup)
end

--
---- Color Definitions
--

-- Attributes
local a = {
    bold = 'bold',
    italics = 'italics',
    none = 'none',
    reverse = 'reverse',
    underline = 'underline',
}
-- User defined colors.
local o = vim.g.truecolor_colors or {}
-- Gitiles fallback colors.
local c = {
    black          = o.black          or { ansi = '00', rgb = '#000000' },
    red            = o.red            or { ansi = '01', rgb = '#880000' },
    green          = o.green          or { ansi = '02', rgb = '#008800' },
    yellow         = o.yellow         or { ansi = '03', rgb = '#666600' },
    blue           = o.blue           or { ansi = '04', rgb = '#000088' },
    magenta        = o.magenta        or { ansi = '05', rgb = '#660066' },
    cyan           = o.cyan           or { ansi = '06', rgb = '#006666' },
    white          = o.white          or { ansi = '07', rgb = '#eeeeee' },
    bright_black   = o.bright_black   or { ansi = '08', rgb = '#3e3d32' },
    bright_red     = o.bright_red     or { ansi = '09', rgb = '#fd971f' },
    bright_green   = o.bright_green   or { ansi = '10', rgb = '#2196e8' },
    bright_yellow  = o.bright_yellow  or { ansi = '11', rgb = '#fd971f' },
    bright_blue    = o.bright_blue    or { ansi = '12', rgb = '#ae81ff' },
    bright_magenta = o.bright_magenta or { ansi = '13', rgb = '#f8f8f2' },
    bright_cyan    = o.bright_cyan    or { ansi = '14', rgb = '#75715e' },
    bright_white   = o.bright_white   or { ansi = '15', rgb = '#f8f8f2' },
    -- FIXME: Alter colorscheme to include a similar color
    nontext = { ansi = '237', rgb = '#3a3a3a' },
    none = { ansi = a.none, rgb = a.none },
}

--
---- Setup
--

vim.cmd('highlight clear')
if vim.g.syntax_on ~= nil then
  vim.cmd('syntax reset')
end
vim.g.colors_name = 'truecolor'

--
---- Highlighting
--

h('Boolean', { fg = c.blue })
h('Builtin', { fg = c.cyan })
h('Character', { fg = c.yellow })
h('ColorColumn', { fg = c.white, bg = c.bright_black, attr = a.none })
h('Comment', { fg = c.bright_black })
h('Conceal', { fg = c.white, bg = c.white})
h('Conditional', { fg = c.blue })
h('Constant', { fg = c.red })
h('Cursor', { fg = c.white, bg = c.white })
h('CursorColumn', { bg = c.bright_black, attr = a.none })
h('CursorLine', { attr = a.underline })
h('CursorLineNR', { fg = c.white, attr = a.none })
h('Debug', { fg = c.bright_white, attr = a.bold })
h('Define', { fg = c.red })
h('Delimiter', { fg = c.yellow })
h('DiffAdd', { fg = c.black, bg = c.green, attr = a.none })
h('DiffChange', { fg = c.black, bg = c.yellow, attr = a.none })
h('DiffDelete', { fg = c.black, bg = c.red, attr = a.none })
h('DiffText', { fg = c.black, bg = c.bright_yellow, attr = a.bold })
h('Directory', {fg = c.blue })
h('EndOfBuffer', { fg = c.nontext })
h('Error', { fg = c.bright_white, bg = c.bright_red })
h('ErrorMsg', { fg = c.bright_white, bg = c.red })
--h('Exception', { })
h('Float', { fg = c.magenta })
h('FoldColumn', { fg = c.white, bg = c.bright_black })
h('Folded', { fg = c.white, bg = c.bright_black })
--h('Function', { })
h('FunctionArgument', { fg = c.bright_red })  -- Should be for overload
h('Identifier', { fg = c.cyan, attr = a.none })
h('Ignore', { fg = c.bright_white })
h('Include', { fg = c.blue })
h('IncSearch', { attr = a.reverse })

h('Keyword', { fg = c.blue })
--h('Label', { })
h('LineNr', { fg = c.bright_black, attr = a.none })
h('Macro', { fg = c.red })
h('MatchParen', { bg = c.bright_cyan })
h('ModeMsg', { attr = a.bold })
h('MoreMsg', { fg = c.green })
h('NonText', { fg = c.bright_blue })
--h('Normal', { })
h('Number', { fg = c.cyan })
h('Operator', { fg = c.yellow })
h('Pmenu', { fg = c.bright_white, bg = c.bright_black })
h('PmenuSel', { fg = c.bright_black, bg = c.bright_white })
h('PmenuSbar', { bg = c.bright_black })
h('PmenuThumb', { bg = c.black })
h('PreCondit', { fg = c.bright_green, attr = a.bold })
h('PreProc', { fg = c.magenta })
h('Question', { fg = c.green })
h('Repeat', { fg = c.blue })
h('Search', { fg = c.black, bg = c.yellow })
h('Special', { fg = c.magenta })
h('SpecialKey', { fg = c.blue })
--h('SpecialChar', { })
--h('SpecialComment', { })
h('SpecialKey', { fg = c.black })
h('SpellBad', { fg = c.bright_red })
h('SpellCap', { fg = c.white, bg = c.bright_black })
h('SpellLocal', { bg = c.bright_cyan })
h('SpellRare', { bg = c.bright_magenta })
h('StatusLine', { fg = c.bright_white, bg = c.bright_black, attr = a.bold })
h('StatusLineNC', { fg = c.white, bg = c.bright_black, attr = a.none })
h('Statement', { fg = c.yellow })
--h('StorageClass', { })
h('String', { fg = c.green })
--h('Structure', { })
h('TabLine', { fg = c.black, bg = c.white, attr = a.underline })
h('TabLineFill', { attr = a.reverse })
h('TabLineSel', { attr = a.bold })
h('TermCursor', { attr = a.reverse })
h('Title', { fg = c.magenta })
--('Tag',{ })
h('Todo', { fg = c.black, bg = c.bright_yellow, attr = a.italic })
h('Type', { fg = c.magenta })
--h('Typedef', { })
h('Underlined', { fg = c.magenta, attr = a.underline })
h('VertSplit', { fg = c.white, bg = c.bright_black, attr = a.none })
h('Visual', { fg = c.none, bg = c.none, attr = a.reverse })
h('WarningMsg', { fg = c.red })
h('WildMenu', { fg = c.black, bg = c.bright_yellow })

l('DimFzfFg', 'Normal')
l('DimFzfBg', 'Normal')
l('DimFzfFgPlus', 'PmenuSel')
l('DimFzfBgPlus', 'PmenuSel')
l('DimFzfInfo', 'Comment')
h('DimFzfHl', { fg = c.green })
h('DimFzfPrompt', { fg = c.bright_blue })
h('DimFzfPointer', { fg = c.red })
h('DimFzfMarker',{ fg = c.bright_red })

--
---- Plugin/Syntax Overrides
--

-- gitsigns.nvim
h('GitSignsAdd', { fg = c.green })
h('GitSignsChange', { fg = c.yellow })
h('GitSignsDelete', { fg = c.red })

-- LSP sign column
h('DiagnosticSignError', { fg = c.red })
h('DiagnosticSignWarn', { fg = c.yellow })
h('DiagnosticSignInfo', { fg = c.bright_black })
h('DiagnosticSignHint', { fg = c.bright_black })

-- nvim-scrollbar
h('ScrollbarHandle', { bg = c.nontext })
h('ScrollbarSearch', { fg = c.magenta })
h('ScrollbarSearchHandle', { fg = c.magenta, bg = c.nontext })
h('ScrollbarError', { fg = c.red })
h('ScrollbarErrorHandle', { fg = c.red, bg = c.nontext })
h('ScrollbarInfo', { fg = c.blue })
h('ScrollbarInfoHandle', { fg = c.blue, bg = c.nontext })
h('ScrollbarHint', { fg = c.white })
h('ScrollbarHintHandle', { fg = c.white, bg = c.nontext })
h('ScrollbarMisc', { fg = c.white })
h('ScrollbarMiscHandle', { fg = c.white, bg = c.nontext })
h('ScrollbarWarn', { fg = c.yellow })
h('ScrollbarWarnHandle', { fg = c.yellow, bg = c.nontext })

-- nvim-treesitter
l('TSFuncBuiltin', 'Builtin')

-- tree-sitter-elvish
l('elvishTSOperator', 'Builtin')

-- tree-sitter-jsonnet

-- cstrahan/tree-sitter-nix
l('nixTSStringSpecial', 'String')
l('nixTSPunctDelimiter', 'Delimiter')
l('nixTSVariable', 'Keyword')
l('nixTSOperator', 'Builtin')

l('bashTSVariable', 'Function')

-- vim-better-whitespace
h('ExtraWhitespace', { bg = c.red })

-- Telescope
h('NormalFloat', {fg = c.bright_black})
h('Pmenu', {fg = c.bright_white, bg = c.black})

-- GitSigns
h('GitSignsDelete',  {attr = a.bold, fg = c.red})
h('GitSignsAdd',  {attr = a.bold, ctermfg = c.green})
h('GitSignsChange',  {attr = a.bold, fg = c.yellow})
h('GitSignsUntracked',  {attr = a.bold, fg = c.yellow})
h('GitSignsCurrentLineBlame',  {fg = c.bright_black})
h('SignColumn',  { bg = c.none })
