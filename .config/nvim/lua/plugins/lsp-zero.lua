return {

	{ "rafamadriz/friendly-snippets" },

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				build = ":MasonUpdate", -- :MasonUpdate updates registry contents
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{
				"L3MON4D3/LuaSnip", -- Required
				dependencies = {
					"rafamadriz/friendly-snippets",
					"saadparwaiz1/cmp_luasnip",
				},
			},

			{ "onsails/lspkind.nvim" },
		},

		config = function()
			-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			-- luasnip
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			-- lsp
			local lsp = require("lsp-zero").preset({
				manage_nvim_cmp = {
					set_sources = "recommended",
				},
			})

			lsp.on_attach(function(_, bufnr)
				lsp.default_keymaps({ buffer = bufnr })
			end)

			lsp.ensure_installed({
				"lua_ls",
				"gopls",
				-- "golangci_lint_ls",
				"pylsp",
				"pyright",
				"terraformls",
				"tflint",
			})

			lsp.set_preferences({
				suggest_lsp_servers = false,
			})

			-- Configure lua language server for neovim
			require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

			-- Configure lua language server for gopls
			require("lspconfig").gopls.setup({
				staticcheck = true,
				completeUnimported = true,
				settings = {
					gopls = {
						-- usePlaceholders = true,
						gofumpt = true,
						analyses = {
							nilness = true,
							unusedparams = true,
							unusedvariable = true,
							unusedwrite = true,
							useany = true,
						},
						codelenses = {
							run_govulncheck = true,
							tidy = true,
						},
						hints = {
							-- assignVariableTypes = true,
							compositeLiteralFields = true,
							-- compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							-- rangeVariableTypes = true,
						},
					},
				},
			})

			-- Configure pylsp language server for python
			require("lspconfig").pylsp.setup({
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								ignore = { "W391" }, -- Blank line at end of file
								maxLineLength = 120,
							},
							isort = { enabled = true },
							black = {
								enabled = true,
								line_length = 120,
							},
						},
					},
				},
			})

			-- Configure pyright language server for python
			require("lspconfig").pyright.setup({
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "off", -- basic / off / strict
						},
						diagnosticMode = "openFilesOnly",
					},
				},
			})

			-- Global mappings; see `:help vim.diagnostic.*` for doc on any of the below functions
			vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

			-- LspAttach autocommand to only map the below keys after the language server attaches to current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					vim.keymap.set(
						"n",
						"gD",
						vim.lsp.buf.declaration,
						{ buffer = ev.buf, desc = "[LSP] Goto declaration" }
					)
					vim.keymap.set(
						"n",
						"gd",
						vim.lsp.buf.definition,
						{ buffer = ev.buf, desc = "[LSP] Goto definition" }
					)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "[LSP] Hover info" })
					vim.keymap.set(
						"n",
						"gi",
						vim.lsp.buf.implementation,
						{ buffer = ev.buf, desc = "[LSP] Goto implementation" }
					)
					vim.keymap.set(
						"n",
						"<C-k>",
						vim.lsp.buf.signature_help,
						{ buffer = ev.buf, desc = "[LSP] Signature help" }
					)
					-- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder,  { buffer = ev.buf, desc = "" })
					-- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder,  { buffer = ev.buf, desc = "" })
					-- vim.keymap.set("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,  { buffer = ev.buf, desc = "" })
					vim.keymap.set(
						"n",
						"<space>D",
						vim.lsp.buf.type_definition,
						{ buffer = ev.buf, desc = "[LSP] Type definition" }
					)
					vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "[LSP] Rename" })
					vim.keymap.set(
						{ "n", "v" },
						"<space>ca",
						vim.lsp.buf.code_action,
						{ buffer = ev.buf, desc = "[LSP] Code action" }
					)
					vim.keymap.set(
						"n",
						"gr",
						vim.lsp.buf.references,
						{ buffer = ev.buf, desc = "[LSP] List references" }
					)
					vim.keymap.set("n", "<space>f", function()
						vim.lsp.buf.format({ async = true })
					end, { buffer = ev.buf, desc = "[LSP] Format buffer" })
				end,
			})

			lsp.set_sign_icons({
				error = "✗", -- '✘'
				warn = "▲", -- "∆"
				hint = "⚑",
				info = "»",
			})

			lsp.setup()

			-- cmp
			local cmp = require("cmp") -- local cmp_action = require('lsp-zero').cmp_action()
			require("luasnip.loaders.from_vscode").lazy_load()
			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
					{ name = "cody" },
					{ name = "luasnip" },
					{ name = "buffer", keyword_length = 5 },
				},
				mapping = cmp.mapping.preset.insert({
					["<c-a>"] = cmp.mapping.complete({
						config = {
							sources = {
								{ name = "cody" },
							},
						},
					}),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<C-e>"] = cmp.mapping.abort(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					-- ['<C-f>'] = cmp_action.luasnip_jump_forward(),
					-- ['<C-b>'] = cmp_action.luasnip_jump_backward(),
				}),
				formatting = {
					fields = { "abbr", "kind", "menu" },
					format = require("lspkind").cmp_format({
						mode = "symbol_text", -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
						maxwidth = 40, -- prevent the popup from showing more than provided characters
						ellipsis_char = "…", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
					}),
				},
			})

			vim.diagnostic.config({
				virtual_text = {
					prefix = "▎", -- "■", '●', '▎', 'x'
				},
			})
		end,
	},
}
