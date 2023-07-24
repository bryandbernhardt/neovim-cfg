" Enable plugins
call plug#begin()
  " Plugins here
  Plug 'tiagovla/tokyodark.nvim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ryanoasis/vim-devicons'
  Plug 'sheerun/vim-polyglot'
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'zacanger/angr.vim'
  " Plug 'preservim/nerdtree'
  " Plug 'Xuyuanp/nerdtree-git-plugin'
  " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'dense-analysis/ale'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'honza/vim-snippets'
  Plug 'jiangmiao/auto-pairs'
  Plug 'powerline/powerline'
  Plug 'tpope/vim-fugitive'
  " vuejs
  Plug 'yaegassy/coc-volar', { 'do': 'yarn install --frozen-lockfile' }
  Plug 'yaegassy/coc-volar-tools', { 'do': 'yarn install --frozen-lockfile' }
  Plug 'weirongxu/coc-explorer'

  if (has("nvim"))
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

  endif

call plug#end()

:lua require('init')

" Global sets
syntax on		" syntax highlight
set nu			" line numbers
set tabstop=2		" tab space
set softtabstop=2	" tab space
set shiftwidth=2	" tab space
set expandtab		" tab space
set smarttab		" insert tabs on the start of a line
set smartindent		" insert identation correctly inside scopes
set hidden		" don't close buffers
set incsearch		" incremental search
set ignorecase		" ignore case search
set smartcase		" smart case search
set scrolloff=8		" keep lines when scroll
set signcolumn=yes	" column left of line numbers
set cmdheight=2		" command line with 2 lines
set updatetime=100	" update 100ms
set encoding=utf-8	" encoding with font icons
set nobackup		" no vim backups
set nowritebackup	" no vim backups
set splitright		" vertical split on the right
set splitbelow		" hotizontal splits below
set autoread		" update vim when update externally
set mouse=a		" enable mouse support
filetype on		" detect filetype
filetype plugin on	" load plugins for the filetype
filetype indent on	" load ident for the filetype



" Themes
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='minimalist'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.dirty='⚡'
let g:airline_enable_branch = 1


" Auto cmds """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()



" Telescope """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (has("nvim"))
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
endif



" ALE
let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'typescript': ['eslint'],
  \   'vue': ['eslint'],
  \}

  let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'javascript': ['eslint'],
  \   'typescript': ['eslint'],
  \   'vue': ['eslint'],
  \}

  let g:ale_sign_error = '🚩'
  let g:ale_sign_warning = '⚠️'
  let g:ale_fix_on_save = 1



" COC Explorer """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
:nnoremap <space>e :CocCommand explorer<CR>

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'tab:$': {
\     'position': 'tab:$',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }
