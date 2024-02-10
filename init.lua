vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

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
vim.diagnostic.config({
	update_in_insert = true, -- Habilita la actualización de diagnósticos en modo insertar
	virtual_text = true, -- Muestra texto virtual de diagnósticos al lado de la línea
	signs = true, -- Muestra signos en el número de línea
	underline = true, -- Subraya el texto con diagnósticos
	severity_sort = true, -- Ordena los diagnósticos por severidad
})
require("vim-options")
require("lazy").setup("plugins")
-- Example using a list of specs with the default options
--vim.api.nvim_create_autocmd("BufWritePre", {
--  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.json" },
--  callback = function()
--    vim.lsp.buf.format({ async = false })
--  end,
--})
