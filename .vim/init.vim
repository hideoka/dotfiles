let g:mapleader = "\<Space>"
nnoremap <silent> <leader>R :source $MYVIMRC<CR>
nnoremap <silent> <leader>r <C-l>

let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0

set ttimeout
set ttimeoutlen=50

"-------------------------------------------------------------------------
" PLUGIN SETTINGS
"-------------------------------------------------------------------------

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source '~/.config/nvim/init.vim'
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rails'
Plug 'machakann/vim-sandwich'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim', { 'for': ['html', 'eruby', 'vue', 'javascript', 'typescript.tsx'] }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'cohama/lexima.vim'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'posva/vim-vue'
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'easymotion/vim-easymotion'
Plug 'liuchengxu/vista.vim'
Plug 'hashivim/vim-terraform'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
" Plug 'f3fora/cmp-spell'
Plug 'j-hui/fidget.nvim', { 'tag': 'legacy' }
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'kevinhwang91/nvim-bqf'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'mfussenegger/nvim-lint'
Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'
" Plug 'github/copilot.vim'

call plug#end()


" nvim-treesitter
lua <<EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    highlight = {
      enable = true,
      disable = { "embedded_template" },
    },
  }

  require("ibl").setup ()
EOF

" mason
lua <<EOF
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
      'taplo'
    },
  }
EOF

" nvim-lint
lua <<EOF
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
EOF

" fzf
nnoremap <silent> <leader>t; :<C-u>Buffers<CR>
nnoremap <silent> <leader>tf :<C-u>Files<CR>
nnoremap <silent> <leader>tgf :<C-u>GFiles?<CR>
nnoremap <silent> <leader>b :<C-u>BLines<CR>
nnoremap <silent> <leader>tm :<C-u>Marks<CR>
nnoremap          <leader>td :<C-u>Rg!<Space>
nnoremap          <leader>ts :<C-u>Rg!<Space><C-R><C-W><CR>
xnoremap          <leader>td y:Rg!<Space><C-R>"<CR>
let g:fzf_preview_window = ['right:50%', 'ctrl-w']

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --hidden -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': ['--layout=default']}), <bang>0)

" terescope
nnoremap <leader>f :<C-u>Telescope find_files<CR>
nnoremap <leader>s :<C-u>Telescope grep_string<CR>
nnoremap <leader>d :<C-u>Telescope grep_string<Space>search=
nnoremap <leader>; :<C-u>Telescope buffers<CR>
nnoremap <leader>tb :<C-u>Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>q :<C-u>Telescope quickfix<CR>
nnoremap <leader>Q :<C-u>Telescope quickfixhistory<CR>

lua << EOF
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
EOF

" nvim-tree.lua
nnoremap <leader>e :<C-u>NvimTreeToggle<CR>
lua << EOF
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
EOF

" vim-fugitive
nnoremap <silent> <Leader>gs :<C-u>Gstatus<CR>
nnoremap <silent> <Leader>gd :<C-u>Git diff<CR>
nnoremap <silent> <Leader>gb :<C-u>Git blame<CR>

" vim-sandwich
nmap s <Nop>
xmap s <Nop>

" vista.vim
let g:vista_default_executive = 'lcn'
nnoremap <silent> <leader>vv :<C-u>Vista!!<CR>
nnoremap <silent> <leader>vm :<C-u>Vista toc<CR>
nnoremap <silent> <leader>vf :<C-u>Vista toc<CR>

" vim-markdown
let g:vim_markdown_folding_level = 6
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" markdown-preview.nvim
nnoremap <silent> <leader>M :<C-u>MarkdownPreview<CR>
let g:mkdp_auto_close = 0
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" nvim-lspconfig, nvim-cmp, cmp-nvim-lsp, LuaSnip
lua <<EOF
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

local servers = { 'hls', 'pylsp', 'astro', 'sqls', 'taplo' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig['tsserver'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("tsconfig.json"),
}

lspconfig['solargraph'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  formatting = true,
  root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
}

lspconfig['denols'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("deno.json"),
}

lspconfig['rust_analyzer'].setup {
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

lspconfig['gopls'].setup {
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

require"fidget".setup{}

local cmp = require 'cmp'
local luasnip = require 'luasnip'

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
EOF

" toggleterm.nvim
lua <<EOF
require"toggleterm".setup{}
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<Cmd>wincmd h<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
EOF
nnoremap <silent> <leader>tt :<C-u>ToggleTerm direction=float<CR>

" Comment.nvim
lua <<EOF
require('Comment').setup{}
EOF


" lexima.vim
let g:lexima_no_default_rules = 1
call lexima#set_default_rules()
call lexima#insmode#map_hook('before', '<CR>', '')

" rust.vim
let g:rustfmt_autosave = 1

" easymotion
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-overwin-f2)

" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

"-------------------------------------------------------------------------
" COLOR SCHEME
"-------------------------------------------------------------------------

" vim-nightfly-guicolors
if has('termguicolors')
  set termguicolors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

colorscheme nightfly

" lightline.vim
let g:lightline={
  \ 'colorscheme': 'nightfly',
  \ 'active': {
  \   'left': [ ['mode', 'paste'],
  \             ['readonly', 'filepath', 'modified'] ]
  \ },
  \ 'component_function': {
  \   'filepath': 'FilePath',
  \ },
  \ }
function! FilePath()
  if winwidth(0) > 90
    return expand('%')
  else
    return expand('%:t')
  end
endfunction

" copilot.vim
" imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
" let g:copilot_no_tab_map = v:true

"----------------------------------------
"  OPTIONS
"----------------------------------------

set nowritebackup
set nobackup
set virtualedit=block
set backspace=indent,eol,start
set ambiwidth=single
set wildmenu
set clipboard+=unnamedplus
set completeopt=menuone,noinsert,noselect
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
set showmatch matchtime=1
set cmdheight=2
set laststatus=2
set showcmd
set display=lastline
set list
set listchars=tab:»-,trail:-,eol:$,extends:»,precedes:«,nbsp:%,space:⋅
set expandtab
set shiftwidth=2
set showmatch
set smartindent
set noswapfile
set title
set number
set whichwrap=b,s,h,l,<,>,[,],~
set mouse=


"----------------------------------------
" KEYMAP
"----------------------------------------

nnoremap <silent> <S-s> :w<CR>
nnoremap <silent> <leader>p "0p
vnoremap <silent> <leader>p "0p
nnoremap <silent> Y y$
inoremap <silent> jj <ESC>
inoremap <silent> <C-f> <Right>
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-n> <Down>
inoremap <silent> <C-p> <Up>
inoremap <silent> <C-r>; <C-r>0
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> H ^
nnoremap <silent> L $
nnoremap <silent> <leader>o <C-^>
nnoremap <silent> <C-n> :cn<CR>
nnoremap <silent> <C-p> :cp<CR>
nnoremap <silent> <leader>co :<C-u>botright cwindow<CR>
nnoremap <silent> <leader>cc :<C-u>cclose<CR>
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *Nzz
nnoremap <silent> # #Nzz
nnoremap <silent> <C-w>< 10<C-w><
nnoremap <silent> <C-w>> 10<C-w>>
nnoremap <silent> <C-w>+ 10<C-w>+
nnoremap <silent> <C-w>- 10<C-w>-
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Delete>
cnoremap <C-r>; <C-r>0

"----------------------------------------
" FILE TYPE AND MODE TRIGGERS
"----------------------------------------

" Makefile indent
augroup MakefileIndent
  autocmd!
  autocmd bufNewFile,BufRead Makefile setlocal tabstop=4 shiftwidth=4 softtabstop=4
augroup END

augroup RustfileIndent
  autocmd!
  autocmd bufNewFile,BufRead Rust setlocal tabstop=4 shiftwidth=4 softtabstop=4
augroup END

" Rails Command complete
augroup RailsCommands
  autocmd!
  autocmd FileType eruby inoremap <silent><C-s> :<C-u><%=  %><Left><Left><Left>
augroup END
