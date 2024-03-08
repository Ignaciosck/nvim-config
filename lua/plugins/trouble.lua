return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- settings without a patched font or icons
		{
			icons = false,
			fold_open = "v", -- icon used for open folds
			fold_closed = ">", -- icon used for closed folds
			indent_lines = false, -- add an indent guide below the fold icons
			signs = {
				-- icons / text used for a diagnostic
				error = "error",
				warning = "warn",
				hint = "hint",
				information = "info",
			},
			use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
		},
	},
	{
		"ellisonleao/glow.nvim",
		cmd = "Glow",
		config = function()
			require("glow").setup({
				glow_path = "", -- will be filled automatically with your glow bin in $PATH, if any
				install_path = "~/.local/bin", -- default path for installing glow binary
				border = "shadow", -- floating window border config
				pager = false,
				width = 100,
				height = 100,
				width_ratio = 0.9, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
				height_ratio = 0.9,
			})
		end,
	},
}
