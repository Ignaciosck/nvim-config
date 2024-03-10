return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = function()
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		local hydra_status = require("hydra.statusline")
		local function adjust_color(active_color, default_color)
			if hydra_status.is_active() then
				return active_color -- Color cuando Hydra está activo
			else
				return default_color -- Color por defecto
			end
		end
		require("lualine").setup({
			options = {
				theme = "catppuccin-frappe",
				icons_enabled = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = {
					{
						function()
							if hydra_status.is_active() then
								return hydra_status.get_name() .. " HYDRA"
							else
								-- Devuelve el modo actual si no está en Hydra. Puedes ajustar esto según lo que prefieras mostrar.
								return require("lualine.utils.mode").get_mode()
							end
						end,
						color = function()
							-- Cambia el color del fondo a rojo y el texto a blanco cuando Hydra está activo
							if hydra_status.is_active() then
								return { fg = "#313447", bg = "#EE817A" } -- Texto blanco, fondo rojo
							end
						end,
					},
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "filetype" },
				},
				lualine_b = {
					{
						"branch",
						color = function()
							return { fg = adjust_color("#EE817A", nil) }
						end,
					},
					{ "diff" },
					{ "diagnostics" },
				},
				lualine_c = { "filename" },

				lualine_y = {
					{
						"progress",
						color = function()
							return { fg = adjust_color("#EE817A", nil) }
						end,
					},
				},
				lualine_z = {
					{
						"location",
						color = function()
							return { bg = adjust_color("#EE817A", nil) }
						end,
					},
				},
			},
		})
	end,
}
