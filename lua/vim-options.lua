vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileformat = "unix"
local opts = { noremap = true, silent = true }
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
-- vim.g.mapleader = ' '  -- Establece el espacio como la tecla <leader>
-- Mapeos de ejemplo
map("n", "<Space>ve", ":vsplit $MYVIMRC<CR>", opts) -- Abre la configuración en un split vertical
map("n", "<Space>vs", ":source $MYVIMRC<CR>", opts) -- Recarga la configuración
-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", opts)
vim.keymap.set("n", "<Space>q", ":q<CR>")
vim.keymap.set("n", "<Space>h", ":nohlsearch<CR>", opts)
vim.keymap.set("i", "<c-s>", "<Esc>:w<CR>gi")
vim.keymap.set("n", "<c-s>", ":w<CR>")
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true
vim.opt.clipboard = "unnamedplus"
vim.wo.wrap = true -- Desactiva el ajuste de texto si prefieres desplazamiento horizontal
