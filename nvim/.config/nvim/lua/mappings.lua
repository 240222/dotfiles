require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Nvim Dapui
map("n", "<A-o>", "<CMD>lua require'dapui'.open()<CR>", { desc = "Open Dapui" })
map("n", "<A-w>", "<CMD>lua require'dapui'.close()<CR>", { desc = "Close Dapui" })
-- Nvim Dap for Rust
map("n", "<Leader>di", "<CMD>lua require'dap'.step_into()<CR>", { desc = "DAP step into" })
map("n", "<Leader>do", "<CMD>lua require'dap'.step_over()<CR>", { desc = "DAP step over" })
map("n", "<Leader>dx", "<CMD>lua require'dap'.step_out()<CR>", { desc = "DAP step out" })
map("n", "<Leader>dn", "<CMD>lua require'dap'.continue()<CR>", { desc = "DAP continue/next" })
map("n", "<Leader>db", "<CMD>lua require'dap'.toggle_breakpoint()<CR>", { desc = "DAP toggle breakpoint" })

map("n", "<Leader>dt", "<CMD>lua vim.cmd('RustLsp testables')<CR>", { desc = "DAP RustLsp testables" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
