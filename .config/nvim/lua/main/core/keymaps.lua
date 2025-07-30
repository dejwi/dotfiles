-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<leader>sw", "<cmd>:vertical resize +4<CR>", { desc = "Make vertical split wider" })
keymap.set("n", "<leader>ss", "<cmd>:vertical resize -4<CR>", { desc = "Make vertical split smaller" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<leader>1", "<cmd>tabn 1<CR>", { desc = "Go to tab page 1" })
keymap.set("n", "<leader>2", "<cmd>tabn 2<CR>", { desc = "Go to tab page 2" })
keymap.set("n", "<leader>3", "<cmd>tabn 3<CR>", { desc = "Go to tab page 3" })
keymap.set("n", "<leader>4", "<cmd>tabn 4<CR>", { desc = "Go to tab page 4" })
keymap.set("n", "<leader>5", "<cmd>tabn 5<CR>", { desc = "Go to tab page 5" })
keymap.set("n", "<leader>6", "<cmd>tabn 6<CR>", { desc = "Go to tab page 6" })
keymap.set("n", "<leader>7", "<cmd>tabn 7<CR>", { desc = "Go to tab page 7" })
keymap.set("n", "<leader>8", "<cmd>tabn 8<CR>", { desc = "Go to tab page 8" })
keymap.set("n", "<leader>9", "<cmd>tabn 9<CR>", { desc = "Go to tab page 9" })
keymap.set("n", "<PageUp>", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<PageDown>", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab

-- delete without clipboard
keymap.set({ "n", "v" }, "d", '"_d')

keymap.set(
	"n",
	"<leader>xc",
	":call setreg('+', expand('%:.') .. ':' .. line('.'))<CR>",
	{ noremap = true, desc = "Copy location to clipboard" }
)
keymap.set(
	"n",
	"<leader>xp",
	":call setreg('+', expand('%'))<CR>",
	{ noremap = true, desc = "Copy location to clipboard" }
)
keymap.set("n", "<leader>xo", ":e <C-r>+<CR>", { noremap = true, desc = "Go to location in clipboard" })
