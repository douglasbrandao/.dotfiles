return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"saghen/blink.cmp",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		local lspconfig = require("lspconfig")

		mason.setup({})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"pyright",
				"vimls",
				"rust_analyzer",
			},
			automatic_installation = true,
		})

		-- local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- lspconfigs
		lspconfig.lua_ls.setup({
			-- capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
						disable = { "missing-parameters", "missing-fields" },
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})

		lspconfig.ts_ls.setup({
			-- capabilities = capabilities,
		})
		lspconfig.pylsp.setup({
			-- capabilities = capabilities,
			settings = {
				pylsp = {
					configurationSources = { "flake8" },
					plugins = {
						mccabe = { enabled = false },
						pycodestyle = { enabled = false },
						pyflakes = { enabled = false },
						flake8 = {
							enabled = true,
						},
					},
				},
			},
		})
		lspconfig.vimls.setup({
			-- capabilities = capabilities,
		})
		lspconfig.rust_analyzer.setup({
			-- capabilities = capabilities,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				-- vim.keymap.set('n', '<space>f', function()
				--   vim.lsp.buf.format { async = true }
				-- end, opts)
			end,
		})
	end,
}
