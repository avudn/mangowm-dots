vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "alacritty-purple"

local c = {
  bg = "#080711",
  surface = "#1c1a2e",
  dim = "#4b357a",
  mid = "#6e5ac2",
  fg = "#9c8ef7",
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor
hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalFloat", { fg = c.fg, bg = c.surface })
hl("FloatBorder", { fg = c.dim, bg = c.surface })
hl("CursorLine", { bg = c.surface })
hl("CursorLineNr", { fg = c.fg, bold = true })
hl("LineNr", { fg = c.dim })
hl("SignColumn", { bg = c.bg })
hl("ColorColumn", { bg = c.surface })
hl("Visual", { bg = c.dim })
hl("Search", { fg = c.bg, bg = c.mid })
hl("IncSearch", { fg = c.bg, bg = c.fg })
hl("MatchParen", { fg = c.fg, bg = c.dim, bold = true })
hl("VertSplit", { fg = c.surface })
hl("WinSeparator", { fg = c.surface })
hl("Pmenu", { fg = c.fg, bg = c.surface })
hl("PmenuSel", { fg = c.bg, bg = c.mid })
hl("StatusLine", { fg = c.fg, bg = c.surface })
hl("StatusLineNC", { fg = c.dim, bg = c.surface })
hl("TabLine", { fg = c.dim, bg = c.surface })
hl("TabLineSel", { fg = c.fg, bg = c.bg, bold = true })
hl("TabLineFill", { bg = c.surface })
hl("Folded", { fg = c.mid, bg = c.surface })
hl("NonText", { fg = c.surface })
hl("Whitespace", { fg = c.surface })
hl("EndOfBuffer", { fg = c.bg })
hl("Directory", { fg = c.mid })
hl("Title", { fg = c.fg, bold = true })
hl("ErrorMsg", { fg = c.fg, bold = true, underline = true })
hl("WarningMsg", { fg = c.mid, bold = true })

-- Syntax
hl("Comment", { fg = c.dim, italic = true })
hl("Constant", { fg = c.mid })
hl("String", { fg = c.mid, italic = true })
hl("Number", { fg = c.mid, bold = true })
hl("Boolean", { fg = c.mid, bold = true })
hl("Identifier", { fg = c.fg })
hl("Function", { fg = c.fg, bold = true })
hl("Statement", { fg = c.mid, bold = true })
hl("Keyword", { fg = c.mid, bold = true })
hl("Operator", { fg = c.dim })
hl("PreProc", { fg = c.dim, bold = true })
hl("Type", { fg = c.fg, italic = true })
hl("Special", { fg = c.mid })
hl("Delimiter", { fg = c.dim })
hl("Todo", { fg = c.bg, bg = c.mid, bold = true })
hl("Error", { fg = c.fg, underline = true })

-- Treesitter / LSP links
hl("@variable", { fg = c.fg })
hl("@property", { fg = c.fg })
hl("@parameter", { fg = c.fg, italic = true })
hl("@constructor", { fg = c.fg, bold = true })
hl("@punctuation", { fg = c.dim })
hl("@keyword.return", { fg = c.mid, bold = true, italic = true })
hl("@lsp.type.macro", { fg = c.dim, bold = true })

-- Diagnostics (differentiated by underline style, since hue is shared)
hl("DiagnosticError", { fg = c.fg, bold = true })
hl("DiagnosticWarn", { fg = c.mid })
hl("DiagnosticInfo", { fg = c.dim })
hl("DiagnosticHint", { fg = c.dim, italic = true })
hl("DiagnosticUnderlineError", { undercurl = true, sp = c.fg })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = c.mid })
hl("DiagnosticUnderlineInfo", { underline = true, sp = c.dim })
hl("DiagnosticUnderlineHint", { underdotted = true, sp = c.dim })

-- Git / diff
hl("DiffAdd", { fg = c.fg, bg = c.surface })
hl("DiffChange", { fg = c.mid, bg = c.surface })
hl("DiffDelete", { fg = c.dim, bg = c.surface })
hl("DiffText", { fg = c.bg, bg = c.mid })
hl("GitSignsAdd", { fg = c.fg })
hl("GitSignsChange", { fg = c.mid })
hl("GitSignsDelete", { fg = c.dim })

-- Telescope / snacks / which-key / cmp
hl("TelescopeNormal", { fg = c.fg, bg = c.surface })
hl("TelescopeBorder", { fg = c.dim, bg = c.surface })
hl("TelescopeSelection", { fg = c.bg, bg = c.mid })
hl("SnacksPickerDir", { fg = c.dim })
hl("WhichKey", { fg = c.fg })
hl("WhichKeyDesc", { fg = c.mid })
hl("CmpItemAbbrMatch", { fg = c.fg, bold = true })
hl("CmpItemKind", { fg = c.mid })
