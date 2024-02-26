--s setting a  global variable mapleder to space
-- g is the vim global, not to be confused with lua global
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true})

-- vim.opt is an interface to access the vim options from lua script.
-- this will enable line numbers and relatvie line numbers in the editor.
vim.opt.number = true
vim.opt.relativenumber = true

-- this will make the split to open the new window in the bottom and vsplit to open the new window in the  right.
vim.opt.splitbelow = true
vim.opt.splitright = true

-- this will disable the wrapping of the text at the end of the line, this will help navigation easy.
vim.opt.wrap = false

-- This will make the tab to be filled with spaces and tab character to be 4 character width.
vim.opt.expandtab = true
vim.opt.tabstop = 4

-- This will make the indent width to 4 characters
vim.opt.shiftwidth = 4

-- This will make the default clipboard to be system clipboard. so that copying will be easy between the editor and other applicatoin, as the editor by default will use the system clipboard.
vim.opt.clipboard = "unnamedplus"

-- This will allow the block selection to move past the last character in the line.
vim.opt.virtualedit = "block"

-- This will show all the lines where the text is being changed in the bottom of the screen within a split window. Very helpful when the changes is in multiple files.
vim.opt.inccommand = "split"

-- This will ignore the case while searching.
vim.opt.ic = true

-- This will make vim to display true colors instead of the terminal settings colors.
vim.opt.termguicolors = true

