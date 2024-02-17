return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
		config = function()
			require("mason").setup()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"lua-language-server",
					"stylua",
					"black",
					"prettier",
					"eslint_d",
					"typescript-language-server",
					"pyright",
					"pylint",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			-- Definir opciones para keymaps
			local opts = { noremap = true, silent = true }

			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			-- vim.keymap.set("n", "<leader>r", ":Lspsaga lsp_rename ++project<CR> ")
			-- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<A-d>", "<cmd> Lspsaga show_cursor_diagnostics<CR>", opts)
			vim.keymap.set("n", "]D", "<cmd> Lspsaga diagnostic_jump_prev<CR>", opts)
			vim.keymap.set("n", "]d", "<cmd> Lspsaga diagnostic_jump_next<CR>", opts)
			vim.keymap.set("n", "<Space>gpD", "<cmd> Lspsaga peek_definition<CR>", opts)
			vim.keymap.set("n", "<M-c>", "<cmd> Lspsaga term_toggle<CR>", opts)
			vim.keymap.set("t", "<M-c>", "<cmd> Lspsaga term_toggle<CR>", opts)
			-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
			-- vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set({ "n", "v" }, "<space>ca", "<cmd>Lspsaga code_action<CR>", opts)
			vim.keymap.set("n", "gR", "<cmd>Lspsaga finder tyd+ref+def<CR>", opts)
		end,
	},
	-- {
	-- 	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	-- 	config = function()
	-- 		require("lsp_lines").setup()
	-- 	end,
	-- },
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({})
		end,
	},
	-- ola
	{
		"chikko80/error-lens.nvim",
		event = "BufRead",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			-- your options go here
		},
	},
}
