return {
  {
    "williamboman/mason.nvim",
    -- this plugin to install different lsp, dsp, linter, formatters etc
    config = function()
      require("mason").setup()
    end,
  },
  {
    -- it bridges the gap between mason and lsp-config
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver", "vuels", "volar" },
      })
    end,
  },
  {
    -- it configures NeoVim to communicate with LSPs
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.tsserver.setup({ capabilities = capabilities })
      lspconfig.volar.setup({ capabilities = capabilities })
      lspconfig.vuels.setup({ capabilities = capabilities })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    -- This is your opts table
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
