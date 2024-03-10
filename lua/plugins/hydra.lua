return {

	"nvimtools/hydra.nvim",
	config = function()
		-- local Hydra = require("hydra")
		local gitHydra = require("plugins.hydras.git") -- Configura y activa la Hydra de Git
		local optionsHydra = require("plugins.hydras.options-hydra") -- Configura y activa la Hydra de WindowManager

		gitHydra()
		optionsHydra()
	end,
}
