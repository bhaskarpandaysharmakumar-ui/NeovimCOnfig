return {
	"ray-x/lsp_signature.nvim",
	event = "InsertEnter",
	config = function()
		require("lsp_signature").setup({
			hint_enable = false,
		})

		vim.keymap.set({ "i" }, "<C-l>", function()
			require("lsp_signature").toggle_float_win()
		end, { silent = true, noremap = true, desc = "toggle signature" })
	end,
}
