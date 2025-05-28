return {
	"williamboman/mason.nvim", 
  version = "1.11.0" ,
	dependencies = {
		 {"williamboman/mason-lspconfig.nvim", version = "1.32.0" },
   "WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				-- "ts_ls",
				"vtsls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"clangd",
				"dockerls",
				"docker_compose_language_service",
				"helm_ls",
				"pyright",
				"rust_analyzer",
			},
		})

		-- formatters
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"clang-format",
				"csharpier",
				-- "pylint", -- python linter
				"eslint_d", -- js linter
			},
		})
	end,
}
