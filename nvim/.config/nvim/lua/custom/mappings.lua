---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
  },

  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>dt"] = {
      ":DapToggleBreakpoint<CR>",
      "toggle dap breakpoint",
      opts = { nowait = true },
    },
    ["<leader>dc"] = {
      ":DapContinue<CR>",
      "Dap Continue",
    },
    ["<leader>do"] = {
      ":DapStepOver<CR>",
      "Dap Step Over",
    },
    ["<leader>di"] = {
      ":DapStepInto<CR>",
      "Dap Step Into",
    },
    ["<leader>dx"] = {
      ":DapTerminate<CR>",
      "Dap Terminate",
    },
    ["<leader>dr"] = {
      ":DapToggleRepl<CR>",
      "Dap Toggle Repl",
    },
    ["<leader>df"] = {
      function()
        local widgets = require("dap.ui.widgets")
        widgets.centered_float(widgets.frames)
      end,
      "Dap Float Widgets",
    },
  },
}
require("core.utils").load_mappings "dap"

-- more keybinds!

return M
