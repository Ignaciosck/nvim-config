return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			opleader = {
				line = "<C-_>",
				block = "gb",
			},
			toggler = {
				line = "<C-_>",
				block = "cb",
			},
			extra = {
				above = "gcO",
				below = "gco",
				eol = "gcA",
			},
			mappings = {
				basic = true,
				extra = true,
			},
		})

		local api = require("Comment.api")
		vim.keymap.set("i", "<C-_>", api.toggle.linewise.current)
		-- Para mapeos en modo visual, puedes descomentar y ajustar según necesites
		-- vim.keymap.set('x', '<leader>c', function()
		--     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'nx', false)
		--     api.toggle.linewise(vim.fn.visualmode())
		-- end)
	end,
	-- Aquí especificas bajo qué condiciones cargar el plugin, como eventos, comandos específicos, etc.
	-- Si quieres cargarlo bajo condiciones específicas, ajusta según necesites.
}
