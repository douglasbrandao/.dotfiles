return {
	"nvim-pack/nvim-spectre",
	config = function()
		vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
			desc = "Toggle Spectre",
		})
		vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
			desc = "Search current word",
		})
		vim.keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
			desc = "Search on current file",
		})
		vim.keymap.set("n", "<leader>R", '<cmd>lua require("spectre.actions").run_current_replace()<CR>', {
			desc = "Replace current item",
		})
		vim.keymap.set("n", "<leader>RR", '<cmd>lua require("spectre.actions").run_replace()<CR>', {
			desc = "Replace All",
		})
	end,
}
