return {
  'projekt0n/github-nvim-theme',
  tag = 'v0.0.7',
  config = function()
    require('github-theme').setup({
      theme_style = 'light',
      -- theme_style = 'dark',
    })
  end
}
