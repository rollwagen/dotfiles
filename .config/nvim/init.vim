set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vimrc

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
call plug#begin('~/.vim/plugged')

        " Plugins shared with vim need to define here too
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-unimpaired'
        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-fugitive'
        Plug 'sheerun/vim-polyglot'
        Plug 'vim-syntastic/syntastic'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'

        " Plug 'pprovost/vim-ps1' " Powershell syntax highlighting
        " Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

        " nvim-cmp
        Plug 'neovim/nvim-lspconfig'
        Plug 'hrsh7th/nvim-cmp'
        Plug 'hrsh7th/cmp-nvim-lsp'
        Plug 'hrsh7th/cmp-buffer'

        Plug 'lukas-reineke/indent-blankline.nvim' " show indentation guides

        Plug 'morhetz/gruvbox' " color scheme
        Plug 'ghifarit53/tokyonight-vim' " color scheme
        Plug 'rebelot/kanagawa.nvim' " color scheme
        Plug 'sheerun/vim-polyglot' " collection of language packs

        Plug 'nvim-lua/plenary.nvim'
        Plug 'lewis6991/gitsigns.nvim'
        Plug 'akinsho/toggleterm.nvim'

        Plug 'psliwka/vim-smoothie'

        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'

call plug#end()

colorscheme kanagawa
hi Normal guibg=NONE ctermbg=NONE "transparency (after colorscheme!)

" fzf
let g:fzf_preview_window = ['right:55%']
" let g:fzf_preview_window = ['up:60%']

" indent-blankline - https://github.com/lukas-reineke/indent-blankline.nvim
lua require("indent_blankline").setup { }

" spelling / spellcheck - toggle spelling: :set spell!
" next:  [s   add to spellfile: zg  correct/candidates:  z=
set spelllang=en
set spellsuggest=best,4 " show four pell checking candidates max

" vim-polyglot
set conceallevel=0 "0 -> Text is shown normally

" gitsigns
lua require('gitsigns').setup()

" toggleterm - see <https://github.com/akinsho/toggleterm.nvim>
lua require("toggleterm").setup{ open_mapping = [[<c-\>]] }

" Lsp finding/error navigation
" see also <https://github.com/nvim-lua/diagnostic-nvim/issues/73>
" map <leader>p :lua vim.lsp.diagnostic.goto_prev()<cr>
" map <leader>p :lua vim.lsp.diagnostic.get_prev({})<cr>
" map <leader>n :lua vim.lsp.diagnostic.goto_next()<cr>
" map <leader>n :lua vim.lsp.diagnostic.get_next()<cr>
map <leader>n :lua vim.diagnostic.goto_next({ float =  { border = "single" }})<cr>
map <leader>p :lua vim.diagnostic.goto_prev({ float =  { border = "single" }})<cr>
map <leader>r :lua vim.lsp.buf.rename()<cr>
map <leader>K :lua vim.lsp.buf.hover()<cr>

" nvim-cmp recommended settings as per
" https://github.com/hrsh7th/nvim-cmp
set completeopt=menu,menuone,noselect
lua <<EOF

  -- vim.diagnostic.config({virtual_text = false})

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
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

  -- Setup lspconfig - see https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion#nvim-cmp
  local lspconfig = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local servers = { 'pyright', 'tflint', 'terraformls', 'gopls' }
  -- local servers = { 'pyright', 'tflint' }
  for _, lsp in ipairs(servers) do
     lspconfig[lsp].setup {
       capabilities = capabilities,
     }
   end
EOF

