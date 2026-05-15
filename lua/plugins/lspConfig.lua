return {
	{
		"mason-org/mason.nvim",
		opts = {},
		config = function()
			require("mason").setup()
		end,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd" },
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- vim.diagnostic.config({ virtual_text = true })

			vim.lsp.config("lua_ls", { capabilites = capabilities })
			vim.lsp.config("clangd", { capabilites = capabilities })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.declaration, {})
		end,
	},
}
