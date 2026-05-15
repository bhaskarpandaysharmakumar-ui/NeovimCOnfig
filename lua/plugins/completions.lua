return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},

	{
		"L3MON4D3/LuaSnip",
		dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		config = function()
			local ELLIPSIS_CHAR = "…"
			local MAX_LABEL_WIDTH = 10
			local MAX_KIND_WIDTH = 4

			local get_ws = function(max, len)
				return (" "):rep(max - len)
			end

			local format = function(_, item)
				local content = item.abbr
				local kind_symbol = symbols[item.kind]
				item.kind = kind_symbol .. get_ws(MAX_KIND_WIDTH, #kind_symbol)

				if #content > MAX_LABEL_WIDTH then
					item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. ELLIPSIS_CHAR
				else
					item.abbr = content .. get_ws(MAX_LABEL_WIDTH, #content)
				end

				return item
			end

			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					-- { name = "vsnip" }, -- For vsnip users.
					{ name = "luasnip" }, -- For luasnip users.
					-- { name = "nvim_lsp_signature_help" },
					-- { name = 'ultisnips' }, -- For ultisnips users.
					-- { name = 'snippy' }, -- For snippy users.
				}, {
					{ name = "buffer" },
				}),

				{
					format = format,
				},
			})
		end,
	},
}
