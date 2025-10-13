vim.pack.add({
	{ src = "https://github.com/AlexvZyl/nordic.nvim" },
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/nyoom-engineering/oxocarbon.nvim" },
	{ src = "https://github.com/EdenEast/nightfox.nvim" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/rebelot/kanagawa.nvim" },
	{ src = "https://github.com/Mofiqul/vscode.nvim" },
	{ src = "https://github.com/sainnhe/sonokai" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/rose-pine/neovim" },
})

-- vim.opt.background = "dark"
-- vim.cmd("colorscheme catppuccin-mocha")
vim.cmd("colorscheme carbonfox")


 -- require("catppuccin").setup({
-- 	integrations = {
-- 		treesitter = true,
-- 		snacks = {
-- 			enabled = false,
-- 			-- indent_scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
-- 		},
-- 		native_lsp = {
-- 			enabled = true,
-- 			virtual_text = {
-- 				errors = { "italic" },
-- 				hints = { "italic" },
-- 				warnings = { "italic" },
-- 				information = { "italic" },
-- 				ok = { "italic" },
-- 			},
-- 			underlines = {
-- 				errors = { "underline" },
-- 				hints = { "underline" },
-- 				warnings = { "underline" },
-- 				information = { "underline" },
-- 				ok = { "underline" },
-- 			},
-- 			inlay_hints = {
-- 				background = true,
-- 			},
-- 		},
-- 	},
-- })

vim.keymap.set('n', "<leader>uC", function() Snacks.picker.colorschemes() end, { desc = "Colorschemes" })

-- Transparent bg idk
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
