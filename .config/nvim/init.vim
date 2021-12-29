set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vimrc

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
call plug#begin('~/.vim/plugged')

        " Plugins shared with vim
        " need to define here too
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-commentary'
        Plug 'pprovost/vim-ps1'
        Plug 'vim-syntastic/syntastic'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'


	" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

        " nvim-cmp recommended settings as per
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'

	Plug 'lukas-reineke/indent-blankline.nvim' " show indentation guides 

call plug#end()

" nvim-cmp recommended settings as per
" https://github.com/hrsh7th/nvim-cmp
set completeopt=menu,menuone,noselect 
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
         { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    capabilities = capabilities
  }
EOF
