set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vimrc

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
call plug#begin('~/.vim/plugged')

        Plug 'eandrju/cellular-automaton.nvim'

        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
        Plug 'nvim-treesitter/nvim-treesitter-context'
        Plug 'p00f/nvim-ts-rainbow'
        " Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
        Plug 'sainnhe/gruvbox-material'

        Plug 'simrat39/inlay-hints.nvim'
        " Plug 'fatih/vim-go'

        Plug 'folke/which-key.nvim'

        Plug 'folke/zen-mode.nvim'

        Plug 'jose-elias-alvarez/null-ls.nvim' " vale

        Plug 'kyazdani42/nvim-web-devicons' " trouble plugin
        Plug 'folke/trouble.nvim'  " trouble plugin

        " Plugins shared with vim need to define here too Plug 'tpope/vim-surround'
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-unimpaired'
        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-fugitive'
        Plug 'sheerun/vim-polyglot'
        Plug 'vim-syntastic/syntastic'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'

        " Plug 'pprovost/vim-ps1' " Powershell syntax highlighting

        " nvim-cmp
        Plug 'neovim/nvim-lspconfig'
        Plug 'hrsh7th/cmp-nvim-lsp'
        Plug 'hrsh7th/cmp-buffer'
        Plug 'hrsh7th/cmp-path'
        Plug 'hrsh7th/cmp-cmdline'
        Plug 'hrsh7th/nvim-cmp'
        Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

        Plug 'windwp/nvim-autopairs'

        " For luasnip users.
        Plug 'L3MON4D3/LuaSnip'
        Plug 'saadparwaiz1/cmp_luasnip'
        Plug 'rafamadriz/friendly-snippets'

        " Color schemes
        Plug 'morhetz/gruvbox' " color scheme
        Plug 'ghifarit53/tokyonight-vim' " color scheme
        Plug 'rebelot/kanagawa.nvim' " color scheme
        Plug 'marko-cerovac/material.nvim'

        Plug 'lukas-reineke/indent-blankline.nvim' " show indentation guides

        Plug 'sheerun/vim-polyglot' " collection of language packs

        Plug 'nvim-lua/plenary.nvim' "  lua functions collection
        Plug 'lewis6991/gitsigns.nvim'
        Plug 'akinsho/toggleterm.nvim'

        Plug 'psliwka/vim-smoothie'

        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'

        Plug 'sainnhe/gruvbox-material'

call plug#end()

colorscheme gruvbox " kanagawa gruvbox  gruvbox-material  gruvbox   kanagawa
highlight Normal guibg=NONE ctermbg=NONE  " transparency (after colorscheme!)
highlight WinSeparator guibg=None
set laststatus=3

" fzf
let g:fzf_preview_window = ['right:55%']  " ['up:60%']

" indent-blankline - https://github.com/lukas-reineke/indent-blankline.nvim
lua require("indent_blankline").setup { }

" nvim-treesitter setup
lua << LUA
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "go", "python", "lua", "vim", "vimdoc", "query" }, -- A list of parser names, or "all" (the five listed parsers should always be installed)
  sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
  auto_install = false, -- Auto install missing parsers when entering buffer; set to false if no `tree-sitter` CLI installed
  highlight = {
    enable = true,
  },
}
LUA

" spelling / spellcheck - toggle spelling: :set spell!
" next:  [s   add to spellfile: zg  correct/candidates:  z=
set spelllang=en
set spellsuggest=best,4 " show four pell checking candidates max

" vale setup - https://bhupesh.me/writing-like-a-pro-with-vale-and-neovim/
lua require("null-ls").setup({ sources = { require("null-ls").builtins.diagnostics.vale, }, })

" trouble.nvim - https://github.com/folke/trouble.nvim
lua << LUA
 require("trouble").setup {
   mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
 }
LUA

" zen-mode
lua require("zen-mode").setup { window = {widgth = 160} }


" vim-polyglot
set conceallevel=0 "0 -> Text is shown normally

" gitsigns - https://github.com/lewis6991/gitsigns.nvim + /issues/498
lua require('gitsigns').setup()
map <leader>gp :Gitsigns preview_hunk<cr>
map <leader>gb :Gitsigns blame_line full=true<cr>
map <leader>gd :Gitsigns diffthis<cr>
" map('n', '<leader>gD', function() gs.diffthis('~') end)

" toggleterm - see <https://github.com/akinsho/toggleterm.nvim>
lua require("toggleterm").setup{ open_mapping = [[<c-\>]] }

" which-key config - https://github.com/folke/which-key.nvim
lua require("which-key").setup {}

" nvim-autopairs
lua require("nvim-autopairs").setup{}



"
" Lsp finding and error navigation
" see also <https://github.com/nvim-lua/diagnostic-nvim/issues/73>
"

" map <leader>p :lua vim.lsp.diagnostic.goto_prev()<cr>
" map <leader>p :lua vim.lsp.diagnostic.get_prev({})<cr>
" map <leader>n :lua vim.lsp.diagnostic.goto_next()<cr>
" map <leader>n :lua vim.lsp.diagnostic.get_next()<cr>
map <leader>n :lua vim.diagnostic.goto_next({ float =  { border = "single" }})<cr>
map <leader>p :lua vim.diagnostic.goto_prev({ float =  { border = "single" }})<cr>
map <leader>lr :lua vim.lsp.buf.rename()<cr>
map <leader>lh :lua vim.lsp.buf.hover()<cr>
map <leader>lf :lua vim.lsp.buf.format()<cr>
map <leader>lsh :lua vim.lsp.buf.signature_help()<cr>
map <leader>lca :lua vim.lsp.buf.code_action()<cr>

" nvim-cmp recommended settings as per https://github.com/hrsh7th/nvim-cmp
set completeopt=menu,menuone,noselect








"
" nvim-cmp setup - see https://github.com/hrsh7th/nvim-cmp
"
lua <<EOF
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  -- Setup nvim-cmp.
  require("luasnip.loaders.from_vscode").lazy_load()
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  cmp.setup({

     snippet = {
      -- REQUIRED - you must specify a snippet engine
       expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
       end,
     },
     window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
     },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

      -- luasnip mapping from https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
      ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              elseif has_words_before() then
                cmp.complete()
              else
                fallback()
              end
       end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
      end, { "i", "s" }),

    }),
    sources = cmp.config.sources({
              { name = 'nvim_lsp_signature_help' },
              { name = 'nvim_lsp' },
              { name = 'luasnip' }, -- For luasnip users.
    }, {
              { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig - see https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion#nvim-cmp
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- local servers = { 'tflint', 'terraformls', 'gopls' } -- 'pyright': see below
  local servers = { 'tflint', 'terraformls'} -- 'pyright': see below
  local lspconfig = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  for _, lsp in ipairs(servers) do
     lspconfig[lsp].setup {
       capabilities = capabilities,
     }
  end

  lspconfig['pyright'].setup {
      capabilities = capabilities,
      settings = {
          python = {
            analysis = { reportTypedDictNotRequiredAccess="information" }
          }
        }
  }


-- local configs = require 'lspconfig/configs'
--
-- if not configs.golangcilsp then
--   configs.golangcilsp = {
--     default_config = {
--       cmd = {'golangci-lint-langserver'},
--       root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
--       init_options = {
--           command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json" };
--       }
--     };
--   }
-- end
-- lspconfig.golangci_lint_ls.setup {
--   filetypes = {'go','gomod'}
-- }


  local inlay_hints = require("inlay-hints")
  inlay_hints.setup({
        renderer = "inlay-hints/render/eol",
  })

  local on_attach = function(client, bufnr)
	  inlay_hints.on_attach(client, bufnr)
  end

  local lspconfig = require("lspconfig")
  lspconfig.gopls.setup({
  	capabilities = capabilities,
  	on_attach = on_attach,
  	settings = {
  		gopls = {
  			gofumpt = true,
        staticcheck = true,
         analyses = { -- https://github.com/golang/tools/blob/master/gopls/doc/settings.md#analyses
          unusedparams = true,
          unusedvariable = true,
        },
  			hints = {
  			-- 	assignVariableTypes = true,
  			compositeLiteralFields = true,
  			-- 	compositeLiteralTypes = true,
  			-- 	constantValues = false,
  			functionTypeParameters = true,
  			parameterNames = true,
  			-- 	rangeVariableTypes = true,
  			},
  		},
  	},
  })


EOF
