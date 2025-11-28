local M = {}

function M.setup(p)
  local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- === Base UI ===
  hi("Normal",       { fg = p.fg, bg = p.bg })
  hi("NormalFloat",  { fg = p.fg, bg = p.bg_alt })
  hi("FloatBorder",  { fg = p.base6, bg = p.bg_alt })

  hi("CursorLine",   { bg = p.base1 })
  hi("CursorColumn", { bg = p.base1 })
  hi("LineNr",       { fg = p.base5 })
  hi("CursorLineNr", { fg = p.yellow })

  hi("Visual",       { bg = p.base3 })
  hi("Search",       { bg = p.yellow, fg = p.base0 })
  hi("IncSearch",    { bg = p.orange, fg = p.base0 })

  -- === Syntax ===
  hi("Comment",      { fg = p.base6, italic = true })
  hi("String",       { fg = p.green })
  hi("Number",       { fg = p.orange })
  hi("Function",     { fg = p.blue })
  hi("Identifier",   { fg = p.fg })
  hi("Statement",    { fg = p.red })
  hi("Keyword",      { fg = p.red, bold = true })
  hi("Type",         { fg = p.teal })
  hi("Constant",     { fg = p.yellow })

  -- === Diagnostics ===
  hi("DiagnosticError", { fg = p.red })
  hi("DiagnosticWarn",  { fg = p.yellow })
  hi("DiagnosticInfo",  { fg = p.blue })
  hi("DiagnosticHint",  { fg = p.teal })

  -- === Diff ===
  hi("DiffAdd",    { bg = p.green .. "20" })
  hi("DiffDelete", { bg = p.red .. "20" })
  hi("DiffChange", { bg = p.blue .. "20" })
end

return M

