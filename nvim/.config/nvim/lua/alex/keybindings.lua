-- The mapleader needs to be defined first
vim.g.mapleader = " "
-- Keybindings
local keymap = vim.api.nvim_set_keymap
keymap("n", "<c-s>", ":w<CR>", {})
keymap("i", "<c-s>", "<ESC>:w<CR>a", {})
local opts = { noremap = true }

-- Rust Tools
keymap("n", "<Leader>r", ":RustRunnables<cr>", opts)
keymap("n", "<Leader>h", ":RustEnableInlayHints<cr>", opts)
keymap("n", "<Leader>m", ":RustExpandMacro<cr>", opts)
keymap("n", "<Leader>h", ":RustHoverActions<cr>", opts)
keymap("n", "<Leader>c", ":RustOpenCargo<cr>", opts)

-- Better window navigation
keymap("n", "<c-j>", "<c-w>j", opts)
keymap("n", "<c-h>", "<c-w>h", opts)
keymap("n", "<c-k>", "<c-w>k", opts)
keymap("n", "<c-l>", "<c-w>l", opts)

-- Better buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-p>", ":BufferLinePick<CR>", opts)
keymap("n", "<S-x>", ":Bdelete<CR>", opts)

keymap("n", "<leader>md", ":MarkdownPreview<CR>", opts)

local function nkeymap(key, map)
	keymap("n", key, map, opts)
end

-- LSP keybindings
nkeymap("gd", ":lua vim.lsp.buf.definition()<cr>")
nkeymap("gD", ":lua vim.lsp.buf.declaration()<cr>")
nkeymap("gi", ":lua vim.lsp.buf.implementation()<cr>")
nkeymap("gw", ":lua vim.lsp.buf.document_symbol()<cr>")
-- nkeymap("gw", ":lua vim.lsp.buf.workspace_symbol()<cr>")
nkeymap("gr", ":lua vim.lsp.buf.references()<cr>")
nkeymap("gt", ":lua vim.lsp.buf.type_definition()<cr>")
nkeymap("K", ":lua vim.lsp.buf.hover()<cr>")
nkeymap("<c-k>", ":lua vim.lsp.buf.signature_help()<cr>")
nkeymap("<leader>af", ":lua vim.lsp.buf.code_action()<cr>")
nkeymap("<leader>rn", ":lua vim.lsp.buf.rename()<cr>")

-- Move text up and down (in normal mode)
keymap("n", "<a-j>", ":m .+1<CR>==", opts)
keymap("n", "<a-k>", ":m .-2<CR>==", opts)

-- Move text up and down (in visual mode)
keymap("v", "<a-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<a-k>", ":m '<-2<CR>gv=gv", opts)

-- Move text up and down (in insert mode)
keymap("i", "<a-j>", "<ESC>:m .+1<CR>==gi", opts)
keymap("i", "<a-k>", "<ESC>:m .-2<CR>==gi", opts)

-- Nvim Tree Explorer (in normal mode)
keymap("n", "<c-n>", ":NvimTreeToggle<CR>", opts)
-- todo: define a leader because the leader r doesn't work
keymap("n", "<leader>ref", ":NvimTreeRefresh<CR>", opts)
keymap("n", "<leader>nff", ":NvimTreeFindFile<CR>", opts)

-- Resize windows with arrows
-- Todo: replace the up/down/left/right with something else since we dont use arrows on keyboard
keymap("n", "<c-up>", ":resize -2<CR>", opts)
keymap("n", "<c-down>", ":resize +2<CR>", opts)
keymap("n", "<c-left>", ":vertical resize -2<CR>", opts)
keymap("n", "<c-right>", ":vertical resize +2<CR>", opts)

-- Launch the FTerm
keymap("n", "<A-t>", '<CMD>lua require("FTerm").toggle()<CR>', opts)
keymap("t", "<A-t>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

-- Telescope
keymap("n", "<leader>ff", '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
keymap("n", "<leader>fg", '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
keymap("n", "<leader>bb", '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
keymap("n", "<leader>fh", '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)

-- Project
keymap("n", "<C-p>", ":Telescope projects<cr>", opts)

-- Telescope File Browser
keymap("n", "<leader>fb", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<cr>", opts)

-- Telescopte Todo
keymap("n", "<leader>td", ":TodoTelescope<CR>", opts)

-- How to get into TrueZen mode?
keymap("n", "<leader>ta", ":TZAtaraxis<CR>", opts)
keymap("n", "<leader>tm", ":TZMinimalist<CR>", opts)
keymap("n", "<leader>tf", ":TZFocus<CR>", opts)
