return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup()
		vim.keymap.set("n", "<Space>hk", ":Gitsigns preview_hunk_inline<CR>", { noremap = true, silent = true })
	end,
}
