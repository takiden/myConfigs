" ================================
" Basic Vim Configuration
" ================================

" ----- Key Mappings -----
" Map 'jk' to ESC in insert mode
inoremap jk <Esc>

" ----- Cursor Style -----
" Block cursor in normal/visual/command modes, vertical line in insert
if exists('&guicursor')
  set guicursor=n-v-c:block,i:ver25,r-cr:hor20
endif

" ----- Line Numbers -----
" Show absolute number for current line, relative for others
set number
set relativenumber

" ----- Clipboard -----
" Use system clipboard for all operations
set clipboard=unnamedplus

" Optional shortcuts for yanking to system clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y
vnoremap <leader>p "+p
nnoremap <leader>p "+p

" ----- Searching -----
" Highlight search results
set hlsearch
" Incremental search as you type
set incsearch

" ----- Tabs and Indentation -----
set tabstop=2       " Number of spaces a tab counts for
set shiftwidth=2    " Number of spaces to use for each step of (auto)indent
set expandtab       " Use spaces instead of tab characters
set smartindent     " Auto-indent new lines

" ----- Visual Enhancements -----
" Enable syntax highlighting
syntax on
" Enable 256-color support
set t_Co=256
" Show matching brackets
set showmatch
" Set line wrapping
set nowrap

" ----- Misc -----
" Enable mouse support
set mouse=a
" Faster scrolling
set ttyfast
" Show status line always
set laststatus=2

" ----- Leader Key -----
let mapleader = " "

