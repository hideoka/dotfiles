vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>R', ':source $MYVIMRC<CR>', { silent = true })
vim.keymap.set('n', '<leader>r', '<C-l>', { silent = true })
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perljprovider = 0

-- -------------------------------------------------------------------------
--  PLUGIN SETTINGS
-- -------------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  { "mfussenegger/nvim-lint" },
  { "nvim-tree/nvim-web-devicons" },
  { "nvim-tree/nvim-tree.lua" },
  { "akinsho/toggleterm.nvim", version = "*" },
  { "nvim-telescope/telescope.nvim", tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' } },
  { "nvim-telescope/telescope-fzf-native.nvim", build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
  { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
  { "saadparwaiz1/cmp_luasnip" },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  { "j-hui/fidget.nvim" },
  { 'numToStr/Comment.nvim', lazy = false },
  { 'tpope/vim-fugitive' },
  { 'airblade/vim-gitgutter' },
  { 'itchyny/lightline.vim' },
  { 'machakann/vim-sandwich' },
  { 'cohama/lexima.vim' },
  { 'kevinhwang91/nvim-bqf'},
  { 'junegunn/fzf', dir = "~/.fzf", build = "./install --all"},
  { 'junegunn/fzf.vim'},
  { 'plasticboy/vim-markdown', ft = 'markdown' },
  { "iamcco/markdown-preview.nvim", cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" }, ft = { "markdown" }, build = function() vim.fn["mkdp#util#install"]() end, },
  { 'mattn/emmet-vim', ft = { 'html', 'eruby', 'vue', 'javascript', 'typescript.tsx' } },
  -- { 'github/copilot.vim'}
})

-- nvim-treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
    disable = { "embedded_template" },
  },
}

-- indent-blankline.nvim
require("ibl").setup ()


-- mason
require("mason").setup ()
require("mason-lspconfig").setup ()
require('mason-tool-installer').setup {
  ensure_installed = {
    'shellcheck',
    'cspell',
    'astro-language-server',
    'lua-language-server',
    'typescript-language-server',
    'sqls',
    'taplo',
    'bash-language-server'
  },
}

-- nvim-lint
require('lint').linters_by_ft = {
        sh = { 'shellcheck', 'cspell' },
        bash = { 'shellcheck', 'cspell' },
        zsh = { 'shellcheck', 'cspell' },
        ruby = { 'cspell' },
        rust = { 'cspell' },
        javascript = { 'cspell' },
        javascriptreact = { 'cspell' },
        typescript = { 'cspell' },
        typescriptreact = { 'cspell' },
}

local cspell = require('lint').linters.cspell
cspell.args = {
  'lint',
  '--no-color',
  '--no-progress',
  '--no-summary',
  '--show-suggestions',
  '-c',
  '~/.config/cspell/cspell.config.yaml'
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

-- fzf
vim.keymap.set('n', '<leader>t;', ':<C-u>Buffers<CR>', { silent = true })
vim.keymap.set('n', '<leader>tf', ':<C-u>Files<CR>', { silent = true })
vim.keymap.set('n', '<leader>tgf', ':<C-u>GFiles<CR>', { silent = true })
vim.keymap.set('n', '<leader>b', ':<C-u>BLines<CR>', { silent = true })
vim.keymap.set('n', '<leader>tm', ':<C-u>marks<CR>', { silent = true })
vim.keymap.set('n', '<leader>td', ':<C-u>Rg!<Space>')
vim.keymap.set('x', '<leader>td', 'y:Rg!<Space><C-R>"<CR>', { silent = true })
vim.g.fzf_preview_window = {'right:50%', 'ctrl-w'}
vim.cmd(
[[
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --hidden -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': ['--layout=default']}), <bang>0)
]]
)

-- telescope
local telescope = require("telescope")
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

telescope.setup{
  defaults = {
    layout_config = {
      horizontal = {
         preview_width = 0.5,
      },
      width = 0.99,
      height = 0.99,
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-s>"] = actions.to_fuzzy_refine,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-t>"] = action_layout.toggle_preview
      },
      n = {
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<C-t>"] = action_layout.toggle_preview
      }
    },
    vimgrep_arguments = {
      'rg',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
      '--glob=!.git/'
    }
  },
  pickers = {
    find_files = {
      find_command = {'rg', '--files', '--smart-case', '--hidden', '--glob=!.git/'},
    },
    buffers = {
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        },
        n = {
          ["<c-d>"] = "delete_buffer",
        }
      },
      sort_mru = true
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    }
  }
}
telescope.load_extension('fzf')

vim.keymap.set('n', '<leader>f', ':<C-u>Telescope find_files<CR>', { silent = true })
vim.keymap.set('n', '<leader>s', ':<C-u>Telescope grep_string<CR>', { silent = true })
vim.keymap.set('n', '<leader>d', ':<C-u>Telescope grep_string<Space>search=')
vim.keymap.set('n', '<leader>;', ':<C-u>Telescope buffers<CR>', { silent = true })
vim.keymap.set('n', '<leader>tb', ':<C-u>Telescope current_buffer_fuzzy_find<CR>', { silent = true })
vim.keymap.set('n', '<leader>q', ':<C-u>Telescope quickfix<CR>', { silent = true })
vim.keymap.set('n', '<leader>Q', ':<C-u>Telescope quickfixhistory<CR>', { silent = true })


-- nvim-tree.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  git = {
    ignore = false
  }
})

vim.keymap.set('n', '<leader>e', ':<C-u>NvimTreeToggle<CR>', { silent = true })

-- vim-fugitive
vim.keymap.set('n', '<leader>gs', ':<C-u>Gstatus<CR>', { silent = true })
vim.keymap.set('n', '<leader>gd', ':<C-u>Git diff<CR>', { silent = true })
vim.keymap.set('n', '<leader>gb', ':<C-u>Git blame<CR>', { silent = true })

-- vim-sandwich
vim.keymap.set('n', 's', '<Nop>', { remap = true })
vim.keymap.set('x', 's', '<Nop>', { remap = true })

-- vim-markdown
vim.g.vim_markdown_folding_level = 6
vim.g.vim_markdown_auto_insert_bullets = 0
vim.g.vim_markdown_new_list_item_indent = 0
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_new_folding_disabled = 1
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0

-- markdown-preview.nvim
vim.keymap.set('n', '<leader>M', ':<C-u>MarkdownPreview<CR>', { silent = true })
vim.g.mkdp_auto_close = 0


-- nvim-lspconfig, nvim-cmp, cmp-nvim-lsp, LuaSnip, fidget
local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.api.nvim_set_keymap('n', '<leader>le', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap=true, silent=true } )

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>ld', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local servers = { 'hls', 'pylsp', 'astro', 'sqls', 'taplo', 'bashls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("tsconfig.json"),
}

lspconfig.solargraph.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  formatting = true,
  root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
}

lspconfig.denols.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("deno.json"),
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      imports = {
          granularity = {
              group = "module",
          },
          prefix = "self",
      },
      cargo = {
          buildScripts = {
              enable = true,
          },
          autoreload = true
      },
      procMacro = {
          enable = true
      },
    }
  }
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  cmd = {"gopls", "serve"},
  filetypes = {"go", "gomod"},
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    }
  }
}

lspconfig.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT'
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      }
    })
  end,
  settings = {
    Lua = {}
  }
}

require("fidget").setup{}

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Up>'] = cmp.mapping.scroll_docs(-4),
    ['<Down>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'spell' },
  }, {
    { name = 'path' },
    { name = 'buffer' },
  })
})


-- toggleterm.nvim
require("toggleterm").setup{}
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<Cmd>wincmd h<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
vim.keymap.set('n', '<leader>tt', ':<C-u>ToggleTerm direction=float<CR>', { silent = true })


-- Comment.nvim
require('Comment').setup{}

 -- lexima.vim
vim.g.lexima_no_default_rules = 1
vim.fn['lexima#set_default_rules']()
vim.fn['lexima#insmode#map_hook']( 'before', '<CR>', '' )

-- copilot.vim
-- vim.g.copilot_no_tab_map = 'v:true'
-- vim.keymap.set('i', '<C-j>', 'copilot#Accept("\\<CR>")', { silent = true, remap = true, expr = true, script = true })


-- -------------------------------------------------------------------------
--  COLOR SCHEME
-- -------------------------------------------------------------------------

-- vim-nightfly-guicolors
if vim.fn.has('termguicolors') == 1 then
  vim.opt.termguicolors = true
  vim.g.t_8f = '\x1b[38;2;%lu;%lu;%lum'
  vim.g.t_8b = '\x1b[48;2;%lu;%lu;%lum'
end
vim.cmd([[ colorscheme nightfly ]])

vim.g.lightline = {
  colorscheme = 'nightfly',
  active = {
    left = { { 'mode', 'paste' }, { 'readonly', 'filepath', 'modified' } },
  },
  component_function = {
    filepath = 'FilePath'
  }
}

vim.cmd([[
function! FilePath()
  if winwidth(0) > 90
    return expand('%')
  else
    return expand('%:t')
  end
endfunction
]])


-- ----------------------------------------
--   OPTIONS
-- ----------------------------------------

vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.virtualedit = 'block'
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.ambiwidth = 'single'
vim.opt.wildmenu = true
vim.opt.clipboard:append('unnamedplus')
vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.matchtime = 1
vim.opt.cmdheight = 2
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.display = 'lastline'
vim.opt.list = true
vim.opt.expandtab = true
vim.opt.listchars = { tab = '»-', trail = '-', eol = '$', extends = '»', precedes = '«', nbsp = '%', space = '⋅' }
vim.opt.list = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.title = true
vim.opt.number = true
vim.opt.whichwrap:append('b,s,h,l,<,>,[,],~')
vim.opt.mouse = ''


-- ----------------------------------------
--  KEYMAP
-- ----------------------------------------

vim.keymap.set('n', '<S-s>', ':w<CR>', { silent = true })
vim.keymap.set('n', '<leader>p', '"0p', { silent = true })
vim.keymap.set('v', '<leader>p', '"0p', { silent = true })
vim.keymap.set('n', 'Y', 'y$', { silent = true })
vim.keymap.set('i', 'jj', '<ESC>', { silent = true })
vim.keymap.set('i', '<C-f>', '<Right>', { silent = true })
vim.keymap.set('i', '<C-b>', '<Left>', { silent = true })
vim.keymap.set('i', '<C-n>', '<Down>', { silent = true })
vim.keymap.set('i', '<C-p>', '<Up>', { silent = true })
vim.keymap.set('i', '<C-r>;', '<C-r>0', { silent = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })
vim.keymap.set('n', 'j', 'gj', { silent = true })
vim.keymap.set('n', 'k', 'gk', { silent = true })
vim.keymap.set('n', 'H', '^', { silent = true })
vim.keymap.set('n', 'L', '$', { silent = true })
vim.keymap.set('n', '<leader>o', '<C-^>', { silent = true })
vim.keymap.set('n', '<C-n>', ':cn<CR>', { silent = true })
vim.keymap.set('n', '<C-p>', ':cp<CR>', { silent = true })
vim.keymap.set('n', '<leader>co', ':<C-u>botright cwindow<CR>', { silent = true })
vim.keymap.set('n', '<leader>cc', ':<C-u>cclose<CR>', { silent = true })
vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })
vim.keymap.set('n', '*', '*Nzz', { silent = true })
vim.keymap.set('n', '#', '#Nzz', { silent = true })
vim.keymap.set('n', '<C-w><', '10<C-w><', { silent = true })
vim.keymap.set('n', '<C-w>>', '10<C-w>>', { silent = true })
vim.keymap.set('n', '<C-w>+', '10<C-w>+', { silent = true })
vim.keymap.set('n', '<C-w>-', '10<C-w>-', { silent = true })
vim.keymap.set('n', '<ESC><ESC>', ':nohlsearch<CR><ESC>')
vim.keymap.set('c', '<C-b>', '<Left>')
vim.keymap.set('c', '<C-f>', '<Right>')
vim.keymap.set('c', '<C-p>', '<Up>')
vim.keymap.set('c', '<C-n>', '<Down>')
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('c', '<C-e>', '<End>')
vim.keymap.set('c', '<C-d>', '<Delete>')
vim.keymap.set('c', '<C-r>', '<C-r>0')

-- ----------------------------------------
--  FILE TYPE AND MODE TRIGGERS
-- ----------------------------------------

-- Makefile indent
local make_file_indent = vim.api.nvim_create_augroup('MakefileIndent', { clear = true })
vim.api.nvim_create_autocmd({ 'bufNewFile', 'BufRead' }, {
  pattern = 'Makefile',
  command = 'setlocal tabstop=4 shiftwidth=4 softtabstop=4',
  group = make_file_indent
})

-- Rustfile indent
local rust_file_indent = vim.api.nvim_create_augroup('RustfileIndent', { clear = true })
vim.api.nvim_create_autocmd({ 'bufNewFile', 'BufRead' }, {
  pattern = 'Rust',
  command = 'setlocal tabstop=4 shiftwidth=4 softtabstop=4',
  group = rust_file_indent
})

-- Rails Command cmplete
local rails_commands = vim.api.nvim_create_augroup('RailsCommands', { clear = true })
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = 'eruby',
  command = '<silent><C-s> :<C-u><%=  %><Left><Left><Left>',
  group = rails_commands
})
