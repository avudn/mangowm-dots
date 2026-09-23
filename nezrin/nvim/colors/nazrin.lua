-- nazrin.lua
-- A warm dark colorscheme built from the "Nazrin" wallpaper palette.
-- Install: put this file at ~/.config/nvim/colors/nazrin.lua
-- Then set colorscheme = "nazrin" in your LazyVim config (see notes below).

local M = {}

-- palette --------------------------------------------------------------
local bg0 = "#1a1310" -- background
local bg1 = "#221a16" -- statusline / floats
local bg2 = "#2b1f1a" -- panel / cursorline
local bg3 = "#3a2b25" -- selection / visual
local border = "#7a4a3a" -- dim border / comments
local fg1 = "#a88a76" -- muted text
local fg0 = "#e0c9b8" -- main text
local fg_br = "#f0e2d4" -- bright text
local gold = "#c9a24a" -- keywords, functions, accent
local gold_br = "#e0b85a"
local red = "#9e3b3b" -- errors, deletions
local red_br = "#b85050"
local green = "#8a7a4a" -- strings, additions
local green_br = "#a8944a"
local blue = "#a85c4a" -- used as a cooler warm-blue substitute
local cyan = "#c9b09a"
local magenta = "#a85c4a"

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "nazrin"

local hl = vim.api.nvim_set_hl

-- editor UI --------------------------------------------------------------
hl(0, "Normal", { fg = fg0, bg = bg0 })
hl(0, "NormalFloat", { fg = fg0, bg = bg1 })
hl(0, "NormalNC", { fg = fg0, bg = bg0 })
hl(0, "FloatBorder", { fg = border, bg = bg1 })
hl(0, "SignColumn", { bg = bg0 })
hl(0, "LineNr", { fg = border })
hl(0, "CursorLineNr", { fg = gold, bold = true })
hl(0, "CursorLine", { bg = bg2 })
hl(0, "Visual", { bg = bg3 })
hl(0, "VisualNOS", { bg = bg3 })
hl(0, "Search", { fg = bg0, bg = gold })
hl(0, "IncSearch", { fg = bg0, bg = gold_br })
hl(0, "CurSearch", { fg = bg0, bg = gold_br })
hl(0, "Pmenu", { fg = fg0, bg = bg1 })
hl(0, "PmenuSel", { fg = bg0, bg = gold })
hl(0, "PmenuSbar", { bg = bg2 })
hl(0, "PmenuThumb", { bg = border })
hl(0, "StatusLine", { fg = fg0, bg = bg1 })
hl(0, "StatusLineNC", { fg = fg1, bg = bg1 })
hl(0, "WinSeparator", { fg = border, bg = bg0 })
hl(0, "VertSplit", { fg = border, bg = bg0 })
hl(0, "TabLine", { fg = fg1, bg = bg1 })
hl(0, "TabLineSel", { fg = gold, bg = bg2 })
hl(0, "TabLineFill", { bg = bg0 })
hl(0, "ColorColumn", { bg = bg2 })
hl(0, "Folded", { fg = fg1, bg = bg2 })
hl(0, "MatchParen", { fg = gold_br, bold = true })
hl(0, "NonText", { fg = border })
hl(0, "Whitespace", { fg = bg3 })
hl(0, "EndOfBuffer", { fg = bg0 })
hl(0, "Title", { fg = gold, bold = true })
hl(0, "Directory", { fg = gold })
hl(0, "ModeMsg", { fg = fg0 })
hl(0, "MoreMsg", { fg = gold })
hl(0, "Question", { fg = gold })
hl(0, "WildMenu", { fg = bg0, bg = gold })

-- diagnostics --------------------------------------------------------------
hl(0, "DiagnosticError", { fg = red_br })
hl(0, "DiagnosticWarn", { fg = gold_br })
hl(0, "DiagnosticInfo", { fg = cyan })
hl(0, "DiagnosticHint", { fg = fg1 })
hl(0, "DiagnosticOk", { fg = green_br })
hl(0, "DiffAdd", { fg = green_br, bg = bg2 })
hl(0, "DiffChange", { fg = gold_br, bg = bg2 })
hl(0, "DiffDelete", { fg = red_br, bg = bg2 })
hl(0, "DiffText", { fg = fg_br, bg = bg3 })

-- syntax --------------------------------------------------------------
hl(0, "Comment", { fg = border, italic = true })
hl(0, "Constant", { fg = fg_br })
hl(0, "String", { fg = green_br })
hl(0, "Character", { fg = green_br })
hl(0, "Number", { fg = magenta })
hl(0, "Boolean", { fg = magenta })
hl(0, "Float", { fg = magenta })
hl(0, "Identifier", { fg = fg0 })
hl(0, "Function", { fg = gold, bold = true })
hl(0, "Statement", { fg = gold_br })
hl(0, "Conditional", { fg = gold_br })
hl(0, "Repeat", { fg = gold_br })
hl(0, "Label", { fg = gold_br })
hl(0, "Operator", { fg = fg0 })
hl(0, "Keyword", { fg = gold_br, bold = true })
hl(0, "Exception", { fg = red_br })
hl(0, "PreProc", { fg = cyan })
hl(0, "Include", { fg = cyan })
hl(0, "Define", { fg = cyan })
hl(0, "Macro", { fg = cyan })
hl(0, "Type", { fg = fg_br, bold = true })
hl(0, "StorageClass", { fg = gold_br })
hl(0, "Structure", { fg = fg_br })
hl(0, "Typedef", { fg = fg_br })
hl(0, "Special", { fg = blue })
hl(0, "SpecialChar", { fg = blue })
hl(0, "Tag", { fg = gold })
hl(0, "Delimiter", { fg = fg1 })
hl(0, "SpecialComment", { fg = fg1, italic = true })
hl(0, "Underlined", { fg = gold, underline = true })
hl(0, "Ignore", { fg = border })
hl(0, "Error", { fg = red_br, bold = true })
hl(0, "Todo", { fg = bg0, bg = gold, bold = true })

-- treesitter -----------------------------------------------------------
hl(0, "@variable", { fg = fg0 })
hl(0, "@variable.builtin", { fg = magenta })
hl(0, "@parameter", { fg = fg0, italic = true })
hl(0, "@field", { fg = fg_br })
hl(0, "@property", { fg = fg_br })
hl(0, "@constructor", { fg = gold })
hl(0, "@punctuation", { fg = fg1 })
hl(0, "@string.special", { fg = blue })
hl(0, "@keyword.function", { fg = gold_br, bold = true })
hl(0, "@keyword.return", { fg = red_br })
hl(0, "@function.builtin", { fg = gold })
hl(0, "@tag.attribute", { fg = gold })
hl(0, "@markup.heading", { fg = gold, bold = true })
hl(0, "@markup.link", { fg = cyan, underline = true })
hl(0, "@markup.raw", { fg = green_br })

-- LSP / misc -------------------------------------------------------------
hl(0, "LspReferenceText", { bg = bg2 })
hl(0, "LspReferenceRead", { bg = bg2 })
hl(0, "LspReferenceWrite", { bg = bg3 })
hl(0, "LspInlayHint", { fg = border, bg = bg1 })

-- git ------------------------------------------------------------------
hl(0, "GitSignsAdd", { fg = green_br })
hl(0, "GitSignsChange", { fg = gold_br })
hl(0, "GitSignsDelete", { fg = red_br })

-- telescope / lazyvim extras ---------------------------------------------
hl(0, "TelescopeBorder", { fg = border, bg = bg1 })
hl(0, "TelescopeNormal", { fg = fg0, bg = bg1 })
hl(0, "TelescopeSelection", { fg = gold, bg = bg2 })
hl(0, "TelescopePromptNormal", { fg = fg0, bg = bg1 })
hl(0, "NeoTreeNormal", { fg = fg0, bg = bg0 })
hl(0, "NeoTreeNormalNC", { fg = fg0, bg = bg0 })
hl(0, "NeoTreeDirectoryIcon", { fg = gold })
hl(0, "NeoTreeGitAdded", { fg = green_br })
hl(0, "NeoTreeGitModified", { fg = gold_br })
hl(0, "NeoTreeGitDeleted", { fg = red_br })
hl(0, "BufferLineFill", { bg = bg0 })
hl(0, "NoiceCmdlinePopupBorder", { fg = border })

return M
