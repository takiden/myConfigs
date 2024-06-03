vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
-- map jk to Esc
vim.keymap.set("i", "jk", "<Esc>", {noremap = true})
-- line number
vim.opt.number = true
vim.opt.relativenumber = true
vim.diagnostic.open_float({focusable = true} )

