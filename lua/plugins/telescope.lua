return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<c-p>", builtin.find_files, {})
			vim.keymap.set("n", "<Space><Space>", builtin.oldfiles, {})
			vim.keymap.set("n", "<Space>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<Space>fh", builtin.help_tags, {})
			vim.keymap.set("n", "<Space>fb", builtin.buffers, {})

			require("telescope").load_extension("ui-select")
		end,
	},
}
