vim.cmd("lang en_US.UTF-8")

vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.swapfile = false
vim.o.smartindent = true
vim.o.winborder = "rounded"
vim.o.signcolumn = "yes"
vim.o.undofile = true
vim.o.termguicolors = true
vim.o.incsearch = true
vim.o.scrolloff = 8
vim.o.ignorecase = true
vim.o.smartcase = true

vim.g.mapleader = " "

local map = vim.keymap.set

map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>ww', ':w<CR>')

map({ 'n', 'v', 'x' }, '<leader>y', '"+y')
map({ 'n', 'v', 'x' }, '<leader>d', '"+d')
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-e>", "<C-e>j")
map("n", "<C-y>", "<C-y>k")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("x", "<leader>p", '"_dP')

map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")
map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

map("n", "<leader>1", "<cmd>tabn 1<CR>", { desc = "Go to tab page 1" })
map("n", "<leader>2", "<cmd>tabn 2<CR>", { desc = "Go to tab page 2" })
map("n", "<leader>3", "<cmd>tabn 3<CR>", { desc = "Go to tab page 3" })
map("n", "<leader>4", "<cmd>tabn 4<CR>", { desc = "Go to tab page 4" })
map("n", "<leader>5", "<cmd>tabn 5<CR>", { desc = "Go to tab page 5" })
map("n", "<leader>6", "<cmd>tabn 6<CR>", { desc = "Go to tab page 6" })
map("n", "<leader>7", "<cmd>tabn 7<CR>", { desc = "Go to tab page 7" })
map("n", "<leader>8", "<cmd>tabn 8<CR>", { desc = "Go to tab page 8" })
map("n", "<leader>9", "<cmd>tabn 9<CR>", { desc = "Go to tab page 9" })

map(
  "n",
  "<leader>xc",
  ":call setreg('+', expand('%:.') .. ':' .. line('.'))<CR>",
  { noremap = true, desc = "Copy location to clipboard with line" }
)
map(
  "n",
  "leader>xp",
  ":call setreg('+', expand('%'))<CR>",
  { noremap = true, desc = "Copy location to clipboard" }
)
map("n", "<leader>xo", ":e <C-r>+<CR>", { noremap = true, desc = "Go to location in clipboard" })

vim.pack.add({
  { src = "https://github.com/ellisonleao/dotenv.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/folke/snacks.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/kylechui/nvim-surround" },
  { src = "https://github.com/rmagatti/auto-session" },
  { src = "https://github.com/saghen/blink.cmp",               version = vim.version.range('1.*') },
  { src = "https://github.com/szw/vim-maximizer", },
  { src = "https://github.com/christoomey/vim-tmux-navigator", },
  { src = "https://github.com/echasnovski/mini.pairs", }
})

require("mason").setup()
require('nvim-treesitter.configs').setup({
  ensure_installed = { "c", "lua", "markdown", "markdown_inline", "typescript", "css", "javascript", "python" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
require("nvim-surround").setup()
require("auto-session").setup({
  auto_restore_enabled = false,
  auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
})
require("blink.cmp").setup({
  completion = {
    documentation = { auto_show = true },
    trigger = {
      show_on_insert_on_trigger_character = false,
    },
    -- accept = { auto_brackets = { enabled = true } }
  },
  keymap = {
    preset = 'super-tab',
    ['<C-k>'] = { 'select_prev', 'fallback' },
    ['<C-j>'] = { 'select_next', 'fallback' },
  },
})
require("mini.pairs").setup()

map("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
map("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })
map("n", "<leader>sm", "<cmd>MaximizerToggle<CR>", { desc = "Maximize/minimize a split" })

-- Lsp
vim.lsp.enable({
  "lua_ls",
  "vtsls",
  -- "html",
  "cssls",
  "tailwindcss",
  -- "emmet_ls",
  -- "prismals",
  -- "pyright",
  -- "clangd",
  "dockerls",
  "docker_compose_language_service",
  -- "helm_ls",
  -- "pyright",
  -- "rust_analyzer"
})
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
map("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" })
map('n', '<leader>lf', vim.lsp.buf.format)

require("snacks").setup(
---@type snacks.Config
  {
    picker = {
      enabled = true,
      hidden = true,
      sources = {
        explorer = {
          win = {
            input = {
              keys = {
                ['<C-t>'] = { 'tab', mode = { 'i', 'n' } },
                ["<Tab>"] = { "confirm", mode = { "n", "i" } },
                ["<CR>"] = { "confirm", mode = { "n", "i" } },
                ["<S-Tab>"] = { "select_and_next", mode = { "i", "n" } },
                -- ["<S-CR>"] = { "select_and_prev", mode = { "i", "n" } },
              },
            },
            list = {
              keys = {
                -- ['<C-t>'] = 'tab',
                ['<C-t>'] = 'tab',
                ["<Tab>"] = "confirm",
                ["<CR>"] = "confirm",
                ["<S-Tab>"] = { "select_and_next", mode = { "x", "n" } },
                -- ["<S-CR>"] = { "select_and_prev", mode = { "x", "n" } },
              }
            }
          }
        },
        files = {
          hidden = true,
        }
      }
    },
    explorer = {
      enabled = true,
      replace_netrw = true
    },
    lazygit = {
      enabled = true,
      configure = true,
    },
    terminal = {
      enabled = false,
    },
    indent = {
      animate = {
        enabled = false,
      },
      indent = {
        enabled = false,
      },
    }
    -- hidden = true,
  })

map('n', "<leader><space>", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
map('n', "<leader>g", function() Snacks.picker.git_files() end, { desc = "Find git files" })
map('n', "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })

map('n', "<leader>h", function() Snacks.picker.help() end, { desc = "Help pages" })
map('n', "<leader>e", function() Snacks.explorer() end, { desc = "File Explorer" })
map('n', "<leader>wh", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
map('n', "<leader>qf", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
map('n', "<leader>u", function() Snacks.picker.undo() end, { desc = "Undo list" })
map('n', "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
map('n', "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
map('n', "<leader>spm", function() Snacks.picker.marks() end, { desc = "Marks" })
map('n', "<leader>,", function() Snacks.picker.buffers() end, { desc = "Buffers" })
map('n', "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep" })
map('n', "<leader>lg", function() Snacks.lazygit() end, { desc = "Lazy git" })
map('n', "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
map("n", "ge", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", { desc = "Goto definition in new tab" })
map('n', "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
map('n', "gr", function() Snacks.picker.lsp_references() end, { desc = "References" })
map('n', "gI", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
map('n', "gy", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })

-- Dotenv
require('dotenv').setup()
vim.cmd.Dotenv(vim.fn.stdpath("config") .. "/.env")

require('dawid')

--
-- Snacks.picker.colorschemes()
