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
					"vim-language-server",
					"stylua",
					"black",
					"prettier",
					"eslint-lsp",
					"eslint_d",
					"typescript-language-server",
					"pyright",
					"pylint",
					"markdownlint",
					"marksman",
					-- "clangd",
					"sonarlint-language-server",
					-- "clang-format",
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
		config = function()
			require("mason-lspconfig").setup({
				-- ensure_installed = { "lua_ls", "tsserver", "html", "pyright" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local opts = { noremap = true, silent = false }
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.offsetEncoding = "utf-8"
			local on_attach = function(client, bufnr)
				-- Definir opciones para keymaps
				-- require("lsp_signature").on_attach({
				-- 	bind = true, -- This is mandatory, otherwise border config won't get registered.
				-- 	handler_opts = {
				-- 		border = "rounded",
				-- 	},
				-- }, bufnr)
				vim.o.updatetime = 250
				-- vim.api.nvim_create_autocmd("CursorHold", {
				-- 	buffer = bufnr,
				-- 	callback = function()
				-- 		local opts1 = {
				-- 			focusable = false,
				-- 			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				-- 			border = "rounded",
				-- 			source = "always",
				-- 			prefix = "",
				-- 			-- scope = "cursor",
				-- 		}
				-- 		-- vim.diagnostic.open_float(nil, opts1)
				-- 	end,
				-- })
				opts.desc = "Show LSP implementations"
				vim.keymap.set("n", "<Space>gi", "<cmd>Telescope lsp_implementations bufnr=0<CR>", opts)
				opts.desc = "Show LSP type definitions"
				vim.keymap.set("n", "<Space>gD", "<cmd>Telescope lsp_type_definitions<CR>", opts)
				opts.desc = "Show LSP definitions"
				vim.keymap.set("n", "<Space>gd", "<cmd>Telescope lsp_definitions<CR>", opts)
				opts.desc = "Show LSP docs"
				-- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
				-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				-- vim.keymap.set("n", "<leader>r", ":Lspsaga lsp_rename ++project<CR> ")
				-- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
				opts.desc = "Show buffer diagnostics"
				vim.keymap.set("n", "<Space>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

				opts.desc = "Prev LSP diagnostic"
				vim.keymap.set("n", "]D", "<cmd> Lspsaga diagnostic_jump_prev<CR>", opts)
				opts.desc = "Next LSP diagnostic"
				vim.keymap.set("n", "]d", "<cmd> Lspsaga diagnostic_jump_next<CR>", opts)
				opts.desc = "Peek definition"
				vim.keymap.set("n", "<Space>gpD", "<cmd> Lspsaga peek_definition<CR>", opts)
				opts.desc = "Terminal toggle"
				vim.keymap.set("n", "<M-c>", "<cmd> Lspsaga term_toggle<CR>", opts)
				vim.keymap.set("t", "<M-c>", "<cmd> Lspsaga term_toggle<CR>", opts)
				-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
				opts.desc = "Show documentation for what is under cursor"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				-- vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
				opts.desc = "Show LSP code actions"
				vim.keymap.set({ "n", "v" }, "<Space>ca", "<cmd>Lspsaga code_action<CR>", opts)
				opts.desc = "Show LSP references"
				vim.keymap.set("n", "gR", "<cmd>Lspsaga finder tyd+ref+def<CR>", opts)
			end

			mason_lspconfig.setup_handlers({
				function(server_name)
					if server_name ~= "jdtls" or "clangd" then
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
							on_attach = on_attach,
						})
						if server_name == "clangd" then
							require("lspconfig")[server_name].setup({
								capabilities = capabilities,
								on_attach = on_attach,
								cmd = { "clangd", "--query-driver=C:/ProgramData/mingw64/mingw64/bin/g++.exe" },
							})
						end
					end
				end,
			})

			-- lspconfig["tsserver"].setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- })
			-- lspconfig.html.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- })
			-- lspconfig.lua_ls.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- })
			-- lspconfig.pyright.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- })
			-- lspconfig.marksman.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- })
			--
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
			require("lspsaga").setup({
				code_action_prompt = {
					enable = false,
					sign = false,
					sign_priority = 20,
					virtual_text = false,
				},
				ui = {
					code_action = "",
				},
			})
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
	{
		"onsails/lspkind.nvim",
		config = function()
			require("lspkind").init({
				-- DEPRECATED (use mode instead): enables text annotations
				--
				-- default: true
				-- with_text = true,

				-- defines how annotations are shown
				-- default: symbol
				-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
				mode = "symbol_text",

				-- default symbol map
				-- can be either 'default' (requires nerd-fonts font) or
				-- 'codicons' for codicon preset (requires vscode-codicons font)
				--
				-- default: 'default'
				preset = "codicons",

				-- override preset symbols
				--
				-- default: {}
				symbol_map = {
					Text = "󰉿",
					Method = "󰆧",
					Function = "󰊕",
					Constructor = "",
					Field = "󰜢",
					Variable = "󰀫",
					Class = "󰠱",
					Interface = "",
					Module = "",
					Property = "󰜢",
					Unit = "󰑭",
					Value = "󰎠",
					Enum = "",
					Keyword = "󰌋",
					Snippet = "",
					Color = "󰏘",
					File = "󰈙",
					Reference = "󰈇",
					Folder = "󰉋",
					EnumMember = "",
					Constant = "󰏿",
					Struct = "󰙅",
					Event = "",
					Operator = "󰆕",
					TypeParameter = "",
				},
			})
		end,
	},
	{
		"aznhe21/actions-preview.nvim",
		config = function()
			vim.keymap.set({ "v", "n" }, "ca", require("actions-preview").code_actions)
		end,
	},
	{
		"soulis-1256/eagle.nvim",
		config = function()
			require("eagle").setup()
		end,
	},
}
