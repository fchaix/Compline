local function blend(fg, bg, alpha)
  local function hex_to_rgb(hex)
    hex = hex:gsub("#", "")
    return {
      tonumber(hex:sub(1, 2), 16),
      tonumber(hex:sub(3, 4), 16),
      tonumber(hex:sub(5, 6), 16)
    }
  end

  local function rgb_to_hex(rgb)
    return string.format("#%02x%02x%02x", rgb[1], rgb[2], rgb[3])
  end

  local f = hex_to_rgb(fg)
  local b = hex_to_rgb(bg)

  local blend_rgb = {
    math.floor((alpha * f[1]) + ((1 - alpha) * b[1])),
    math.floor((alpha * f[2]) + ((1 - alpha) * b[2])),
    math.floor((alpha * f[3]) + ((1 - alpha) * b[3])),
  }

  return rgb_to_hex(blend_rgb)
end

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
hi("DiffAdd", {
  bg = blend(p.green, p.bg, 0.15)
})
hi("DiffDelete", {
  bg = blend(p.red, p.bg, 0.15)
})
hi("DiffChange", {
  bg = blend(p.blue, p.bg, 0.15)
})
end

return M

