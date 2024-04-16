local Hydra = require("hydra")
local resizeWindowsHydra = Hydra({
	name = "WindowManager",
	mode = { "n" },
	body = "<Space>hr",
	hint = [[
Move between windows:
  _<C-h>_: Left    _<C-j>_: Down
  _<C-k>_: Up      _<C-l>_: Right

Resize windows:
  _H_: Decrease width    _L_: Increase width
  _K_: Increase height   _J_: Decrease height

Other:
  _e_: Equalize sizes    _Q_/_<C-q>_: Close window
  _q_/_;_/_<Esc>_: Exit Hydra
]],
	config = {
		color = "pink",
		invoke_on_body = true,
		hint = {
			type = "window",
			offset = 0, -- Posición del hint
			float_opts = {
				-- row, col, height, width, relative, and anchor should not be
				-- overridden
				-- style = "statusline",
				border = "rounded",
				title = "Window Manager Hydra",
				focusable = false,
				noautocmd = true,
			},
			-- Texto del hint
		},
	},
	heads = {
		-- move between windows
		{ "<C-h>", "<C-w>h" },
		{ "<C-j>", "<C-w>j" },
		{ "<C-k>", "<C-w>k" },
		{ "<C-l>", "<C-w>l" },

		-- resizing window
		{ "H", "<C-w>3<" },
		{ "L", "<C-w>3>" },
		{ "K", "<C-w>2+" },
		{ "J", "<C-w>2-" },

		-- equalize window sizes
		{ "e", "<C-w>=" },

		-- close active window
		{ "Q", ":q<cr>" },
		{ "<C-q>", ":q<cr>" },

		-- exit this Hydra
		{ "q", nil, { exit = true, nowait = true } },
		{ ";", nil, { exit = true, nowait = true } },
		{ "<Esc>", nil, { exit = true, nowait = true } },
	},
})
return resizeWindowsHydra
