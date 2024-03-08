return {
	"folke/which-key.nvim",
	lazy = false,
	config = function()
		-- Configuración general de which-key
		require("which-key").setup({
			-- Configuración general de which-key aquí (si es necesario)
		})

		-- Define tus atajos de teclado aquí
		local keybindings = {
			v = {
				e = { "<cmd>e $MYVIMRC<CR>", "Editar configuración Neovim" },
			},

			-- ["ca"] = { "<cmd>Lspsaga code_action<CR>", "Acción de código LSP" },
			b = {
				name = "+Buffers",
				d = { "<cmd>bd<CR>", "Cerrar buffer" },
				D = { "<cmd>bufdo bd<CR>", "Cerrar todos los buffers" },
				n = { "<cmd>bn<CR>", "Siguiente buffer" },
				p = { "<cmd>bp<CR>", "Buffer anterior" },
			},
			t = {
				name = "+Telescope",
				p = { "<cmd>Telescope projects<CR>", "Proyectos" },
				f = { "<cmd>Telescope find_files<CR>", "Buscar archivos" },
				o = { "<cmd>Telescope oldfiles<CR>", "Archivos recientes" },
				g = { "<cmd>Telescope live_grep_args<CR>", "Buscar con Grep" },
				-- h = { "<cmd>Telescope help_tags<CR>", "Ayuda" },
				b = { "<cmd>Telescope buffers<CR>", "Buffers" },
				i = { "<cmd>AdvancedGitSearch<CR>", "Búsqueda avanzada de Git" },
				u = { "<cmd>Telescope undo<CR>", "Árbol de deshacer" },
				s = { "<cmd>Telescope lsp_document_symbols<CR>", "Símbolos del documento LSP" },
				d = { "<cmd>Telescope diagnostics bufnr=0<CR>", "Diagnosticos" },
				-- m = { "<cmd>Telescope grapple tags<CR>", "Marcar" },
				-- t = { "<cmd>Grapple tag<CR>", "Ver marcas" },
				-- r = { "<cmd>Telescope lsp_references<CR>", "Eliminar marca" },
			},
			q = { "<cmd>q<CR>", "Cerrar" },
			h = { "<cmd>nohlsearch<CR>", "Ocultar búsqueda" },
			["<M-Up>"] = { "<cmd>wincmd k<CR>", "Moverse arriba en paneles" },
			["<M-Down>"] = { "<cmd>wincmd j<CR>", "Moverse abajo en paneles" },
			["<M-Left>"] = { "<cmd>wincmd h<CR>", "Moverse a la izquierda en paneles" },
			["<M-Right>"] = { "<cmd>wincmd l<CR>", "Moverse a la derecha en paneles" },
			["g"] = {
				--      vim.keymap.set("n", "<Space>gpD", "<cmd> Lspsaga peek_definition<CR>", opts)
				-- vim.keymap.set("n", "<Space>gpd", "<cmd> Lspsaga peek_type_definition<CR>", opts)

				name = "Git&LSP",
				D = { "<cmd>Telescope lsp_type_definitions<CR>", "Declaración LSP" },
				d = { "<cmd>Telescope lsp_definitions<CR>", "Definición LSP" },
				p = {
					name = "Peek",
					D = { "<cmd>Lspsaga peek_definition<CR>", "Ver definición" },
					d = { "<cmd>Lspsaga peek_type_definition<CR>", "Ver definición de tipo" },
				},
				-- pD = { "<cmd>Lspsaga peek_definition", "Ver definición" },
				-- pd = { "<cmd>Lspsaga peek_type_definition", "Ver definición de tipo" },
				i = { "<cmd>Telescope lsp_implementations bufnr=0<CR>", "Implementación" },
				R = { "<cmd>Telescope lsp_references<CR>", "Referencias" },
				r = { "<cmd>Lspsaga rename<CR>", "Renombrar LSP" },
				k = { "<cmd>Gitsigns preview_hunk_inline<CR>", "Git: Vista previa del fragmento" },
				n = { "<cmd>Gitsigns next_hunk<CR>", "Git: Siguiente fragmento" },
				N = { "<cmd>Gitsigns prev_hunk<CR>", "Git: Fragmento anterior" },
				o = { "<cmd>Lspsaga outline<CR>", "Outline" },
				-- f2 = {},
			},
		}

		-- Registra tus keybindings con which-key
		require("which-key").register(keybindings, { prefix = "<leader>" })
	end,
}
