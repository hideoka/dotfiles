let g:pipenv_path = '/.pyenv/versions/py3nvim/bin/python'

let g:python3_host_prog = $HOME . g:pipenv_path
let g:python2_host_prog = ''

let g:mapleader = "\<Space>"
nnoremap <silent> <leader>R :source $MYVIMRC<CR>
nnoremap <silent> <leader>r <C-l>

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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rails'
Plug 'machakann/vim-sandwich'
Plug 'cocopon/iceberg.vim'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim', { 'for': ['html', 'eruby', 'vue', 'javascript', 'typescript.tsx'] }
Plug 'w0rp/ale'
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'cohama/lexima.vim'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'posva/vim-vue'
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'Zaptic/elm-vim', { 'for': 'elm' }
Plug 'easymotion/vim-easymotion'
Plug 'liuchengxu/vista.vim'
Plug 'hashivim/vim-terraform'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'bluz71/vim-nightfly-guicolors'

call plug#end()


" nvim-treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
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

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --hidden -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

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
  \ 'ruby': ['rubocop'],
  \ 'javascript': ['eslint'],
  \ 'typescript': ['eslint'],
  \ 'rust': [],
  \ 'elm': [],
  \ }
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['eslint'],
  \ 'typescript': ['eslint'],
  \ 'haskell': ['brittany']
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

" LanguageClient-neovim
set hidden
let g:LanguageClient_serverCommands = {
  \ 'ruby': ['solargraph', 'stdio'],
  \ 'rust': ['rust-analyzer'],
  \ 'javascript': ['typescript-language-server', '--stdio'],
  \ 'typescript': ['typescript-language-server', '--stdio'],
  \ 'javascript.jxs': ['typescript-language-server', '--stdio'],
  \ 'typescript.tsx': ['typescript-language-server', '--stdio'],
  \ 'elm': ['elm-language-server'],
  \ }
let g:LanguageClient_rootMarkers = {
  \ 'elm': ['elm.json'],
  \ 'javascript': ['jsconfig.json'],
  \ 'typescript': ['tsconfig.json'],
  \ }
nnoremap <silent><leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent><leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent><leader>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <silent><leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
nnoremap <silent><leader>lx :call LanguageClient#textDocument_references()<CR>
nnoremap <silent><leader>la :call LanguageClient_workspace_applyEdit()<CR>
nnoremap <silent><leader>lc :call LanguageClient#textDocument_completion()<CR>
nnoremap <silent><leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent><leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent><leader>lm :call LanguageClient_contextMenu()<CR>
nnoremap <silent> <leader>ll :call LanguageClientRestart()<CR>

function LanguageClientRestart()
  LanguageClientStop
  sleep 1
  LanguageClientStart
endfunction

" deoplete.vim
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction
call deoplete#custom#option('_', {
  \ 'max_list': '30',
  \ 'auto_complete_delay': 0,
  \ 'auto_complete_start_length': 1,
  \ 'enable_refresh_always': 0,
  \ 'enable_buffer_path': 1,
  \ 'enable_smart_case': 1,
  \ })

" neosnippet.vim
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif

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
set listchars=tab:»-,trail:-,eol:$,extends:»,precedes:«,nbsp:%
set expandtab
set shiftwidth=2
set showmatch
set smartindent
set noswapfile
set title
set number
set whichwrap=b,s,h,l,<,>,[,],~
set completeopt-=preview

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
