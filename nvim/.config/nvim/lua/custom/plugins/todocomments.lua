return {
  "folke/todo-comments.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    require("todo-comments").setup {}
  end,
}
