return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({})
		local finders = require("telescope.finders")
		local function generate_new_finder(harpoon_files)
			local files = {}
			for i, item in ipairs(harpoon_files.items) do
				table.insert(files, i .. ". " .. item.value)
			end

			return finders.new_table({
				results = files,
			})
		end
		-- basic telescope configuration
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({
					prompt_title = "Harpoon",
					finder = generate_new_finder(harpoon_files),
					initial_mode = "normal",
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
					attach_mappings = function(_, map)
						actions.select_default:replace(function(prompt_bufnr)
							local curr_entry = action_state.get_selected_entry()
							if not curr_entry then
								return
							end
							actions.close(prompt_bufnr)

							harpoon:list():select(curr_entry.index)
						end)
						-- Delete entries in insert mode from harpoon list with <C-d>
						-- Change the keybinding to your liking
						map({ "n", "i" }, "<C-d>", function(prompt_bufnr)
							local curr_picker = action_state.get_current_picker(prompt_bufnr)

							curr_picker:delete_selection(function(selection)
								harpoon:list():removeAt(selection.index)
							end)
						end)

						return true
					end,
				})
				:find()
		end

		vim.keymap.set("n", "<Space>tm", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })

		vim.keymap.set("n", "<Space>tt", function()
			harpoon:list():append()
		end, { desc = "Harpoon Mark" })
		vim.keymap.set("n", "<Space>tr", function()
			harpoon:list():remove()
		end, { desc = "Harpoon Unmark" })
		-- vim.keymap.set("n", "<leader><Space>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
		--     { desc = "Open harpoon window" })

		vim.keymap.set("n", "<M-1>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<M-2>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<M-3>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<M-4>", function()
			harpoon:list():select(4)
		end)
		vim.keymap.set("n", "<M-5>", function()
			harpoon:list():select(5)
		end)
		vim.keymap.set("n", "<M-6>", function()
			harpoon:list():select(6)
		end)
		vim.keymap.set("n", "<M-7>", function()
			harpoon:list():select(7)
		end)
		vim.keymap.set("n", "<M-8>", function()
			harpoon:list():select(8)
		end)
		vim.keymap.set("n", "<M-9>", function()
			harpoon:list():select(9)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<M-,>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<M-.>", function()
			harpoon:list():next()
		end)
	end,
}
