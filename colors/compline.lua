local palette = require("compline.palette")
local theme = require("compline.theme")

local M = {}

-- Expose la palette (VERY IMPORTANT)
function M.get_palette(mode)
  mode = mode or vim.o.background
  return palette[mode] or palette.dark
end

function M.setup()
  local p = M.get_palette()
  theme.setup(p)
end

return M

