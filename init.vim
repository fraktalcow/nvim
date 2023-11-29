
set autochdir
" call plug#begin('~/AppData/Local/nvim/plugged')
call plug#begin('~/.vim/plugged')

" Vim themes
Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'

" Vim Airline for status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Telescope for file explorer
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

call plug#end()

" Set the colorscheme
" Uncomment one of the themes
" colorscheme onedark
colorscheme NeoSolarized

" Vim Airline configuration
let g:airline_theme = 'theme_of_your_choice'

" Configure Telescope
nnoremap <F2> :Telescope find_files<CR>
nnoremap <F3> :Telescope buffers<CR>
nnoremap <F4> :Telescope help_tags<CR>




" Autodetect and execute Python files
autocmd BufRead,BufNewFile *.py :execute 'autocmd BufWritePost <buffer> !python' shellescape(@%, 1)

" Map F7 to execute current file in terminal
nnoremap <F7> :exec "term " . expand("%")<CR>

" Enable clipboard for copying and pasting between Neovim and system clipboard
set clipboard=unnamedplus

" Enable line numbers
set number

" Enable syntax highlighting
syntax enable

" Enable auto-indentation
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Highlight search results as you type
set incsearch
set hlsearch

" Highlight current line
set cursorline

" Display matching parentheses
set showmatch

" Set highlight on yank
au TextYankPost * silent! lua vim.highlight.on_yank()

" Save session on exit
autocmd VimLeave * mksession! ~/.vim/session

" Reload session on start
autocmd VimEnter * if filereadable(expand("~/.vim/session")) | source ~/.vim/session | endif

" F1 opens/toggles a terminal in the current directory
nnoremap <F1> :term<CR>

" Set the default shell for terminal to PowerShell
if has('win32') || has('win64')
    set shell=powershell
else
    set shell=bash
endif

" Set up the side pane
set splitright

" Define a function to open the side pane with the init.vim file
function! OpenInitPane()
    vsplit $MYVIMRC
    wincmd l
endfunction

" Map F9 to open the side pane
nnoremap <F9> :call OpenInitPane()<CR>


