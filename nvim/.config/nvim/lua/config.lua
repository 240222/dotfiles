local options = {
  expandtab = true,
  shiftwidth = 2,
  softtabstop = 2,
  fileencoding = 'utf-8',
  hlsearch = true,
  ignorecase = true,
  pumheight = 10,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  undofile = true,
  cursorline = true,
  number = true,
  relativenumber = true,
  numberwidth = 4,
  signcolumn = 'yes',
  scrolloff = 8,
  termguicolors = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd [[ colorscheme molokai ]]
