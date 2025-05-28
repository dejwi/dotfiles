return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	-- opts = {
	--   options = {
	--     mode = "tabs",
	--     separator_style = "slant",
	--   },
	-- },
	after = "catppuccin",
	config = function()
		require("bufferline").setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
			options = {
				mode = "tabs",
				separator_style = "slant",
			},
		})
	end,
}
