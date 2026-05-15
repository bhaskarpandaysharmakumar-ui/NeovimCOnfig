return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			-- vim.cmd("colorscheme kanagawa-dragon")
		end,
	},

	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup({
				contrast = "",
			})

			vim.cmd("colorscheme gruvbox")
		end,
	},
}
