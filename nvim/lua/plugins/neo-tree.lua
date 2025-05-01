-- return {
--   "nvim-tree/nvim-tree.lua",
--   version = "*",
--   lazy = false,
--   dependencies = {
--     "nvim-tree/nvim-web-devicons",
--   },
--   config = function()
--     require("nvim-tree").setup ({})
--     vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
--     vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>")
--   end
-- }

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    -- fill any relevant options here
  },
  config = function()
   vim.keymap.set("n", "<leader>e", ":Neotree focus filesystem left<cr>")
   vim.keymap.set("n", "<leader>et", ":Neotree toggle filesystem left<cr>")
   vim.keymap.set("n", "<leader>eb", ":Neotree toggle buffers right<cr>")
  end
}
