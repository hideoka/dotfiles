let g:mapleader = "\<Space>"
nnoremap <silent> <leader>R :source $MYVIMRC<CR>
nnoremap <silent> <leader>r <C-l>

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
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rails'
Plug 'machakann/vim-sandwich'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim', { 'for': ['html', 'eruby', 'vue', 'javascript', 'typescript.tsx'] }
Plug 'w0rp/ale'
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
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

call plug#end()


" nvim-treesitter
lua <<EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    highlight = {
      enable = true,
    },
  }

  require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
  }
EOF

" nerdtree
let NERDTreeShowHidden=1
nnoremap <silent> <leader>e :<C-u>NERDTreeToggle<CR>

" fzf
nnoremap <silent> <leader>; :<C-u>Buffers<CR>
nnoremap <silent> <leader>f :<C-u>Files<CR>
nnoremap <silent> <leader>gf :<C-u>GFiles?<CR>
nnoremap <silent> <leader>b :<C-u>BLines<CR>
nnoremap <silent> <leader>m :<C-u>Marks<CR>
nnoremap          <leader>d :<C-u>Rg!<Space>
nnoremap          <leader>s :<C-u>Rg!<Space><C-R><C-W><CR>
xnoremap          <leader>d y:Rg!<Space><C-R>"<CR>
let g:fzf_preview_window = ['right:50%', 'ctrl-w']

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --hidden -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" terescope
nnoremap <leader>tf :<C-u>Telescope find_files<CR>
nnoremap <leader>ts :<C-u>Telescope grep_string<CR>
nnoremap <leader>td :<C-u>Telescope grep_string<Space>search=
nnoremap <leader>t; :<C-u>Telescope buffers<CR>
nnoremap <leader>tb :<C-u>Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>tq :<C-u>Telescope quickfix<CR>
nnoremap <leader>tQ :<C-u>Telescope quickfixhistory<CR>

lua << EOF
local telescope = require("telescope")
local actions = require("telescope.actions")
telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-s>"] = actions.to_fuzzy_refine
      },
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

" ale
nnoremap <silent> <leader>al :<C-u>ALEToggle<CR>
nnoremap <silent> <leader>af :<C-u>ALEFix<CR>
let g:ale_linters = {
  \ 'ruby': [],
  \ 'javascript': ['eslint'],
  \ 'typescript': ['eslint'],
  \ 'rust': [],
  \ 'haskell': [],
  \ }
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['prettier'],
  \ 'typescript': ['prettier'],
  \ 'haskell': [],
  \ }
let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1

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
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>ld', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local servers = { 'solargraph', 'hls' }
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
  }, {
    { name = 'path' },
    { name = 'buffer' },
  })
})
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
" FILE TYPE TRIGGERS
"----------------------------------------

" Makefile indent
augroup MakefileIndent
  autocmd!
  autocmd bufNewFile,BufRead Makefile setlocal tabstop=4 shiftwidth=4 softtabstop=4
augroup END

" Rails Command complete
augroup RailsCommands
  autocmd!
  autocmd FileType eruby inoremap <silent><C-s> :<C-u><%=  %><Left><Left><Left>
augroup END
