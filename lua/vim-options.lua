vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.clipboard = "unnamedplus"
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
vim.opt.foldnestmax = 1
vim.opt.signcolumn = "yes"
--vim.opt.undo = true
vim.opt.undofile = true
-- vim.opt.shell = "powershell"
vim.opt.shell = vim.fn.executable("pwsh") and "pwsh" or "powershell"
vim.opt.shellcmdflag =
	"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""
-- vim.g.mapleader = ' '  -- Establece el espacio como la tecla <leader>
-- Mapeos de ejemplo
map("n", "<Space>ve", ":vsplit $MYVIMRC<CR>", opts) -- Abre la configuración en un split vertical
map("n", "<Space>vs", "<cmd>vsplit<CR>", opts) -- Recarga la configuración
-- Navigate vim panes better

vim.keymap.set("n", "<C-c>", "<cmd>yank<CR>", opts)
vim.keymap.set("v", "<C-c>", "<cmd>yank<CR>", opts)
vim.keymap.set("i", "<C-c>", "<cmd>yank<CR>", opts)
vim.keymap.set("n", "<M-Up>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<M-Down>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<M-Left>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<M-Right>", ":wincmd l<CR>", opts)
vim.keymap.set("n", "<Space>q", ":q<CR>")
vim.keymap.set("n", "<Space>h", ":nohlsearch<CR>", opts)
vim.keymap.set("i", "<c-s>", "<Esc>:w<CR>gi")
vim.keymap.set("n", "<c-s>", ":w<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>")
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>")
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>")
vim.wo.number = true
vim.wo.wrap = true -- Desactiva el ajuste de texto si prefieres des
