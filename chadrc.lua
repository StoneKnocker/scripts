---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "chadtain",
  theme_toggle = { "chadtain", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  tabufline = {
    show_numbers = false,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
