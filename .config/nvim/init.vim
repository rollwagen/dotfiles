set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vimrc

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
call plug#begin('~/.vim/plugged')

        Plug 'jose-elias-alvarez/null-ls.nvim' " vale

        Plug 'kyazdani42/nvim-web-devicons' " trouble plugin
        Plug 'folke/trouble.nvim'  " trouble plugin

        " Plugins shared with vim need to define here too Plug 'tpope/vim-surround'
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
        Plug 'hrsh7th/cmp-nvim-lsp'
        Plug 'hrsh7th/cmp-buffer'
        Plug 'hrsh7th/cmp-path'
        Plug 'hrsh7th/cmp-cmdline'
        Plug 'hrsh7th/nvim-cmp'
        " For luasnip users.
        Plug 'L3MON4D3/LuaSnip'
        Plug 'saadparwaiz1/cmp_luasnip'

        Plug 'lukas-reineke/indent-blankline.nvim' " show indentation guides

        Plug 'morhetz/gruvbox' " color scheme
        Plug 'ghifarit53/tokyonight-vim' " color scheme
        Plug 'rebelot/kanagawa.nvim' " color scheme
        Plug 'marko-cerovac/material.nvim'

        Plug 'sheerun/vim-polyglot' " collection of language packs

        Plug 'nvim-lua/plenary.nvim' "  lua functions collection
        Plug 'lewis6991/gitsigns.nvim'
        Plug 'akinsho/toggleterm.nvim'

        Plug 'psliwka/vim-smoothie'

        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'

call plug#end()

colorscheme kanagawa
highlight Normal guibg=NONE ctermbg=NONE  " transparency (after colorscheme!)
highlight WinSeparator guibg=None
set laststatus=3

" fzf
let g:fzf_preview_window = ['right:55%']
" let g:fzf_preview_window = ['up:60%']

" indent-blankline - https://github.com/lukas-reineke/indent-blankline.nvim
lua require("indent_blankline").setup { }

" spelling / spellcheck - toggle spelling: :set spell!
" next:  [s   add to spellfile: zg  correct/candidates:  z=
set spelllang=en
set spellsuggest=best,4 " show four pell checking candidates max

" vale setup - https://bhupesh.me/writing-like-a-pro-with-vale-and-neovim/
lua << EOF
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.vale,
    },
})
EOF

" trouble.nvim - https://github.com/folke/trouble.nvim
lua << EOF
  require("trouble").setup { }
EOF

" vim-polyglot
set conceallevel=0 "0 -> Text is shown normally

" gitsigns - https://github.com/lewis6991/gitsigns.nvim
"   see also https://github.com/lewis6991/gitsigns.nvim/issues/498
lua require('gitsigns').setup()
map <leader>gp :Gitsigns preview_hunk<cr>
map <leader>gb :Gitsigns blame_line full=true<cr>
map <leader>gd :Gitsigns diffthis<cr>
" map('n', '<leader>gD', function() gs.diffthis('~') end)

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
map <leader>lr :lua vim.lsp.buf.rename()<cr>
map <leader>lh :lua vim.lsp.buf.hover()<cr>
map <leader>lsh :lua vim.lsp.buf.signature_help()<cr>

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
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
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
  local servers = { 'pyright', 'tflint', 'terraformls', 'gopls' }
  -- local servers = { 'pyright', 'tflint' }
  local lspconfig = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  for _, lsp in ipairs(servers) do
     lspconfig[lsp].setup {
       capabilities = capabilities,
     }
  end
EOF
