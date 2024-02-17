return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"aaronhallaert/advanced-git-search.nvim",
		config = function()
			-- optional: setup telescope before loading the extension
			require("telescope").setup({
				-- move this to the place where you call the telescope setup function
				extensions = {
					advanced_git_search = {
						-- See Config
					},
				},
			})

			require("telescope").load_extension("advanced_git_search")
		end,
		dependencies = {
			"nvim-telescope/telescope.nvim",
			-- to show diff splits and open commits in browser
			"tpope/vim-fugitive",
			--- See dependencies
			--or not jjjjjjjjjjjj
		},
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.5",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"debugloop/telescope-undo.nvim",
				"nvim-telescope/telescope-live-grep-args.nvim",
			},
			config = function()
				require("telescope").setup({
					extensions = {
						["ui-select"] = {
							require("telescope.themes").get_dropdown({}),
						},
						["advanced_git_search"] = {
							-- The "git" action will be used instead of the "grep" action
							git = {
								-- true: search in the current file
								-- false: search in the entire repo
								current_file = true,
							},
						},
						["undo"] = {
							use_delta = true,
							use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
							side_by_side = false,
							diff_context_lines = vim.o.scrolloff,
							entry_format = "state #$ID, $STAT, $TIME",
						},
					},
					mappings = {
						i = {
							["<C-1>"] = require("telescope.actions").preview_scrolling_up,
							["<C-2>"] = require("telescope.actions").preview_scrolling_down,
						},
					},
					defaults = {
						wrap_results = true,
						layout_strategy = "horizontal",
					},
				})
				local builtin = require("telescope.builtin")
				vim.keymap.set("n", "<Space>tf", builtin.find_files, {})
				vim.keymap.set("n", "<Space>to", builtin.oldfiles, {})
				-- vim.keymap.set("n", "<Space>tg", builtin.live_grep, {})
				vim.keymap.set("n", "<Space>th", builtin.help_tags, {})
				vim.keymap.set("n", "<Space>tb", builtin.buffers, {})
				vim.keymap.set("n", "<Space>ts", builtin.lsp_document_symbols, {})
				vim.keymap.set("n", "<Space>tp", ":Telescope projects<CR>", { noremap = true, silent = true })
				vim.keymap.set("n", "<Space>ti", "<cmd>AdvancedGitSearch<CR>", { desc = "AdvancedGitSearch" })
				vim.keymap.set("n", "<Space>tu", "<cmd>Telescope undo<CR>", { desc = "UndoTree" })
				vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep_args<CR>", { desc = "Live Grep" })
				require("telescope").load_extension("ui-select")
				require("telescope").load_extension("advanced_git_search")
				require("telescope").load_extension("live_grep_args")
				require("telescope").load_extension("advanced_git_search")

				require("telescope").load_extension("undo")
			end,
		},
	},
}
