
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

-- language highlight
-- local config = require("nvim-treesitter.configs")
-- config.setup({
--   ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "typescript", "vue", "css", "scss", "java" },
  -- highlight = { enable = true },
  -- indent = { enable = true },
-- })

-- theme
-- require("catppuccin").setup()
-- vim.cmd.colorscheme "catppuccin"
