vim.pack.add({
  -- { src = "https://github.com/AlexvZyl/nordic.nvim" },
  -- { src = "https://github.com/vague2k/vague.nvim" },
  -- { src = "https://github.com/nyoom-engineering/oxocarbon.nvim" },
  { src = "https://github.com/EdenEast/nightfox.nvim" },
  -- { src = "https://github.com/folke/tokyonight.nvim" },
  -- { src = "https://github.com/rebelot/kanagawa.nvim" },
  -- { src = "https://github.com/Mofiqul/vscode.nvim" },
  -- { src = "https://github.com/sainnhe/sonokai" },
  -- { src = "https://github.com/catppuccin/nvim" },
  -- { src = "https://github.com/rose-pine/neovim" },
})

-- vim.opt.background = "dark"
vim.cmd("colorscheme carbonfox")

-- vim.keymap.set('n', "<leader>uC", function() Snacks.picker.colorschemes() end, { desc = "Colorschemes" })

-- Transparent bg idk
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
