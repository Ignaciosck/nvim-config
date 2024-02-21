return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
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
