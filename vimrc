set nocompatible
highlight LineNr ctermfg=240
"ctermfg=237
"ctermbg=234
highlight Pmenu ctermbg=234 guibg=black ctermfg=237
highlight PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff

highlight TabLineSel guibg=#ff0000 guifg=#ffffff

set foldmethod=indent  " Fold based on indent level 
set foldlevelstart=99  " Open all folds by default
set foldnestmax=3      " Limit folding to 3 levels
set foldenable         " Enable folding

set number " Show line numbers
set t_Co=256 " Support 256 colors
set laststatus=2 " Always show status line
"set tabstop=2 " Number of spaces tabs count for
"set shiftwidth=2 " Number of spaces to use for autoindent
"set softtabstop=2 " Number of spaces for tab key

filetype off                  " Required

call plug#begin('~/.vim/plugged')

" General Plugins
Plug 'tpope/vim-sensible' " Sensible defaults for Vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy file finder
Plug 'junegunn/fzf.vim' " FZF integration for Vim

" Syntax Highlighting and Code Navigation
Plug 'sheerun/vim-polyglot' " Language pack for Vim
Plug 'preservim/nerdtree' " File system explorer
Plug 'Xuyuanp/nerdtree-git-plugin' " Git integration for NERDTree
Plug 'majutsushi/tagbar' " Display tags of the current file
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter for better syntax highlighting
Plug 'vim-ruby/vim-ruby' " Ruby syntax highlighting
Plug 'tree-sitter/tree-sitter-ruby' " Ruby syntax highlighting
Plug 'nanotech/jellybeans.vim'

" Git Integration
Plug 'tpope/vim-fugitive' " Git wrapper for Vim
Plug 'airblade/vim-gitgutter' " Git diff in the gutter
Plug 'kdheepak/lazygit.nvim' " Lazygit integration

" Code Completion and Snippets
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense engine
Plug 'honza/vim-snippets' " Snippets for various languages

" Status Line and Aesthetics
Plug 'vim-airline/vim-airline' " Lean & mean status/tabline
Plug 'vim-airline/vim-airline-themes' " Themes for vim-airline
Plug 'ryanoasis/vim-devicons' " Icons for various plugins

" JSON Support
Plug 'tpope/vim-jdaddy' " JSON manipulation

" Additional Utilities
Plug 'junegunn/vim-easy-align' " Easy text alignment
Plug 'tpope/vim-surround' " Surround text objects easily
Plug 'terryma/vim-multiple-cursors' " Multiple cursors support
Plug 'easymotion/vim-easymotion' " Easy motion for quick navigation
Plug 'nvim-lua/plenary.nvim' " Lua functions for Neovim
Plug 'nvim-telescope/telescope.nvim' " Fuzzy finder over lists
Plug 'nvim-neotest/nvim-nio' " File explorer for Neovim
Plug 'rest-nvim/rest.nvim' " REST client for Neovim
Plug 'jghauser/mkdir.nvim' " Automatically create missing directories
Plug 'antoinemadec/FixCursorHold.nvim' " Fix CursorHold performance issue
Plug 'ngmy/vim-rubocop' " Rubocop integration for Vim
Plug 'sheerun/vim-polyglot'

" Copilot Plugin
Plug 'github/copilot.vim' " Copilot for Vim

" Copilot Chat Plugin
Plug 'zbirenbaum/copilot.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary' }

Plug 'MunifTanjim/nui.nvim'
Plug 'wthollingsworth/pomodoro.nvim'

call plug#end()
:lua << EOF
require("copilot").setup {}
require("CopilotChat").setup {}
require('telescope').setup{
defaults = {
    mappings = {
        i = {
            ["<C-h>"] = "which_key"
            }
        }
    },
}
EOF


syntax on
syntax enable 
set smartindent
set autoindent
filetype plugin on
filetype indent on

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby,eruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

set laststatus=2
set noshowmode
set backspace=2

" General Settings
set number " Show line numbers
set relativenumber " Show relative line numbers
set tabstop=4 " Number of spaces tabs count for
set shiftwidth=4 " Number of spaces to use for autoindent
set expandtab " Use spaces instead of tabs
set smartindent " Smart autoindenting on new lines
set wrap " Wrap long lines
set cursorline " Highlight the current line
set clipboard=unnamedplus " Use system clipboard
set mouse=a " Enable mouse support

" Key Mappings
nnoremap <C-n> :NERDTreeToggle<CR> " Toggle NERDTree
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <F8> :TagbarToggle<CR> " Toggle Tagbar


nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Open vimrc with <lead>v
nnoremap <leader>v :edit ~/.config/nvim/init.vim <CR>
" Reload vimrc with <lead>sv
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>a :edit ~/.config/alacritty/alacritty.toml<CR>
nnoremap <leader>t :edit ~/.config/tmux/tmux.conf<CR>

nnoremap <leader>- :split<CR>
nnoremap <leader>\| :vsplit<CR>


" EasyAlign configuration
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Custom alignment rules
nmap <leader>a= :EasyAlign=<CR>
" Enable the airline plugin
let g:airline#extensions#tabline#enabled = 1

" Set the colors for the buffer tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1 " Enable Powerline fonts
let g:airline_theme='minimalist'



" Customize the colors (example)
highlight AirlineTabFill guibg=#282c34 guifg=#abb2bf
highlight AirlineTab guibg=#3e4451 guifg=#abb2bf
highlight AirlineTabSel guibg=#61afef guifg=#282c34

" CoC Configuration
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-python']

" GitGutter Configuration
let g:gitgutter_enabled = 1

" Enable Copilot
let g:copilot_no_tab_map = v:false
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")

let mapleader = "\\"

" Initialize configuration dictionary
let g:fzf_vim = {}
let g:fzf_vim.buffers_jump = 1


" EasyAlign Configuration
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

" NERDTree Configuration
" Highlight files with specific extensions
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction


map <leader>n :NERDTreeToggle<cr>
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

"hi NERDTreeDir guifg=#FF0000 ctermfg=white
"hi NERDTreeFlags guifg=#FF0000 ctermfg=grey


let g:loaded_perl_provider = 0
let g:ruby_host_prog = 'rvm system do neovim-ruby-host'

colorscheme jellybeans 
set termguicolors

" You might have to force true color when using regular vim inside tmux as the
" colorscheme can appear to be grayscale with "termguicolors" option enabled.
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set tabstop=2 " Number of spaces tabs count for
set shiftwidth=2 " Number of spaces to use for autoindent
set softtabstop=2 " Number of spaces for tab key
