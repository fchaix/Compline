local palette = require("compline.palette")
local theme = require("compline.theme")

-- Utilise l'option globale vim.o.background (dark / light)
local mode = vim.o.background == "light" and "light" or "dark"
local p = palette[mode]

theme.setup(p)

