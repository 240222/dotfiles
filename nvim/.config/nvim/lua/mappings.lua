require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- RustLsp
map("n", "<S-i>", "<CMD>RustLsp openDocs<CR>", { desc = "Info on Docs.rs" })

-- Nvim Dapui
map("n", "<A-d>", "<CMD>lua require'dapui'.open()<CR>", { desc = "Open Dapui" })
map("n", "<A-w>", "<CMD>lua require'dapui'.close()<CR>", { desc = "Close Dapui" })
-- Nvim Dap for Rust
map("n", "<A-i>", "<CMD>lua require'dap'.step_into()<CR>", { desc = "DAP step into" })
map("n", "<A-o>", "<CMD>lua require'dap'.step_over()<CR>", { desc = "DAP step over" })
map("n", "<A-x>", "<CMD>lua require'dap'.step_out()<CR>", { desc = "DAP step out" })
map("n", "<A-c>", "<CMD>lua require'dap'.continue()<CR>", { desc = "DAP continue/next" })
map("n", "<A-b>", "<CMD>lua require'dap'.toggle_breakpoint()<CR>", { desc = "DAP toggle breakpoint" })
map("n", "<A-t>", "<CMD>lua vim.cmd('RustLsp testables')<CR>", { desc = "DAP RustLsp testables" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
