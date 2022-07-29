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
h('ColorColumn', { bg = c.black, attr = a.none })
h('Comment', { fg = c.red })
h('Conditional', { fg = c.blue })
h('Constant', { fg = c.white })
h('Cursor', { fg = c.white, bg = c.white })
h('CursorColumn', { bg = c.bright_black, attr = a.none })
h('CursorLine', { bg = c.bright_black, attr = a.none })
h('CursorLineNr', { fg = c.yellow, attr = a.none })
h('Debug', { fg = c.bright_white, attr = a.bold })
h('Define', { fg = c.red })
h('Delimiter', { fg = c.yellow })
h('DiffAdd', { fg = c.green, bg = c.none })
h('DiffChange', { fg = c.yellow, bg = c.none })
h('DiffDelete', { fg = c.red, bg = c.none })
h('DiffText', { fg = c.bright_white, attr = a.bold })
h('EndOfBuffer', { fg = c.red, bg = c.bright_black })
--h('Error', { })
h('ErrorMsg', { fg = c.black, bg = c.red })
--h('Exception', { })
h('Float', { fg = c.magenta })
h('Folded', { bg = c.black })
h('Function', { fg = c.white })
h('FunctionArgument', { fg = c.bright_red })  -- Should be for overload
h('Identifier', { fg = c.white, attr = a.none })
--h('Ignore', { })
h('Include', { fg = c.blue })
h('Keyword', { fg = c.blue })
--h('Label', { })
h('LineNr', { fg = c.bright_black, bg = c.black, attr = a.none })
h('Macro', { fg = c.red })
h('MatchParen', { fg = c.red, bg = c.black })
h('NonText', { fg = c.nontext })
h('Normal', { fg = c.bright_white })
h('Number', { fg = c.cyan })
h('Operator', { fg = c.yellow })
h('PreCondit', { fg = c.bright_green, attr = a.bold })
h('PreProc', { fg = c.yellow })
h('Repeat', { fg = c.blue })
h('Search', { bg = c.blue })
h('SignColumn', { bg = c.black })
h('Special', { fg = c.white })
--h('SpecialChar', { })
--h('SpecialComment', { })
h('SpecialKey', { fg = c.black })
h('Statement', { fg = c.blue })
--h('StorageClass', { })
h('String', { fg = c.green })
--h('Structure', { })
--('Tag',{ })
h('Todo', { fg = c.bright_cyan, attr = a.italic })
h('Type', { fg = c.magenta })
--h('Typedef', { })
--h('Underlined', { })

--
---- Plugin/Syntax Overrides
--

-- gitsigns.nvim
h('GitSignsAdd', { fg = c.green, bg = c.black })
h('GitSignsChange', { fg = c.yellow, bg = c.black })
h('GitSignsDelete', { fg = c.red, bg = c.black })

-- LSP sign column
h('DiagnosticSignError', { fg = c.red, bg = c.black })
h('DiagnosticSignWarn', { fg = c.yellow, bg = c.black })
h('DiagnosticSignInfo', { fg = c.bright_black, bg = c.black })
h('DiagnosticSignHint', { fg = c.bright_black, bg = c.black })

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
