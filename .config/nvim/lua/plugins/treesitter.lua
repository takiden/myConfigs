return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local config = require("nvim-treesitter.configs")
    config.setup({
    --  not needed due to auto_install option
    ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "typescript", "vue", "css", "scss", "java" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
