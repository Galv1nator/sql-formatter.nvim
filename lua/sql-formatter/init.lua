-- author: anvndev
-- https://github.com/andev0x/sql-formatter.nvim
-- SQL Formatter Plugin Initialization

local M = {}

-- Plugin configuration

-- Setup function
function M.setup(opts)
  require("sql-formatter.config").setup(opts)

  -- Load core modules
  -- require("sql-formatter.formatter").setup()
  require("sql-formatter.commands").setup()
  require("sql-formatter.autocmds").setup()
  require("sql-formatter.keybindings").setup()

  -- Check if external formatter is available
   if vim.g["sqlformatter_external_formatter"] and
      vim.g["sqlformatter_external_formatter"].enabled then
     require("sql-formatter.formatter").check_external_formatter()
   end
end

return M
