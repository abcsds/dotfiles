-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- General
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Appearance
vim.o.termguicolors = true

vim.o.number = true
-- vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.autoindent = true
-- vim.o.fileencoding = 'utf-8'
-- vim.o.expandtab = true
-- vim.o.smarttab = true
-- vim.o.smartindent = true
-- vim.o.autoindent = true
-- vim.o.ignorecase = true
-- vim.o.smartcase = true

-- vim.o.mouse = 'a'
-- vim.o.clipboard = 'unnamedplus'
-- vim.o.hidden = true
-- vim.o.splitbelow = true
-- vim.o.splitright = true
-- vim.o.termguicolors = true
-- vim.o.showmode = false
-- vim.o.showcmd = true
vim.o.updatetime = 300
-- vim.o.timeoutlen = 500

-- Keymaps
vim.keymap.set("n", "<a-/>", "<CMD>NvimTreeToggle<CR>", { silent = true, desc = "Toggle File Explorer" })
vim.keymap.set("n", "<a-\\>", "<CMD>NvimTreeFocus<CR>", { silent = true, desc = "Focus File Explorer" })
-- leader g b to toggle git blame inline with gitsigns
vim.keymap.set("n", "<leader>gb", "<CMD>Gitsigns toggle_current_line_blame<CR>", { silent = true, desc = "Toggle Git Blame" })
vim.keymap.set("n", "<leader>gg", "<CMD>DiffviewOpen<CR>", { silent = true, desc = "Open Git Diffview" })
-- run the lg alias (git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit)
vim.keymap.set("n", "<leader>gl", "<CMD>!git log --color --graph --pretty=oneline --abbrev-commit<CR>", { silent = true, desc = "Git Log" })