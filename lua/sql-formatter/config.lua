
-- SQL Formatter Plugin Initialization config

local M = {}

-- Default configuration
M.default_opts = {
  format_on_save = true,
  dialect = "postgresql",
  indent = "  ",
  tab_width = 2,
  use_tabs = false,
  uppercase = true,
  identifier_case = "lower",
  function_case = "upper",
  datatype_case = "upper",
  lines_between_queries = 2,
  max_column_length = 80,
  comma_start = false,
  operator_padding = true,
  filetypes = { "sql", "mysql", "plsql", "pgsql" },
  keybindings = {
    format_buffer = "<leader>sf",
    format_selection = "<leader>ss",
    toggle_format_on_save = "<leader>st",
  },
  notify = {
    enabled = true,
    level = "info",
    timeout = 2000,
  },
  -- External formatter command (using sql-formatter or sqlparse)
  -- To use sql-formatter (Node.js):
  --   command = "sql-formatter",
  --   args = { "--config", "/path/to/.sql-formatter.json" } -- optional
  -- To use sqlparse (Python):
  --   command = "sqlformat",
  --   args = { "--reindent", "--keywords", "upper", "--identifiers", "lower", "--strip-comments", "-" }
  external_formatter = {
    enabled = true,
    command = "sql-formatter", -- or "sqlformat"
    args = {}, -- see above for examples
  }
}

-- Plugin configuration

-- Setup function
M.setup = function(opts)
  local opts = opts or {}
  local global_var_opts = {}

  for k, _ in pairs(M.default_opts) do
      global_var_opts[k] = vim.g["sqlformatter_" .. k]
  end

  opts = vim.tbl_deep_extend("force", M.default_opts, global_var_opts, opts)
  for k, v in pairs(opts) do
      vim.g["sqlformatter_" .. k] = v
  end

end

return M

