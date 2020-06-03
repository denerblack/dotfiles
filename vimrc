set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set number
set t_Co=256
set laststatus=2

highlight LineNr ctermfg=240
"ctermfg=237
"ctermbg=234
highlight Pmenu ctermbg=234 guibg=black ctermfg=237
highlight PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

filetype off
set rtp+=~/.config/nvim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vim-scripts/L9'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-tbone'
Bundle 'tpope/vim-rails'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-fugitive'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'edkolev/promptline.vim'
Bundle 'itchyny/lightline.vim'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Bundle "bonsaiben/bootstrap-snippets"
Bundle "benmills/vimux"
Bundle "Lokaltog/vim-easymotion"
Bundle "terryma/vim-multiple-cursors"
Bundle "tmhedberg/matchit"
Bundle "tpope/vim-surround"
Bundle "nelstrom/vim-visual-star-search"
Bundle "scrooloose/nerdtree"
Bundle "ngmy/vim-rubocop"
Bundle "tpope/vim-jdaddy"
Bundle "airblade/vim-gitgutter"
Bundle "tmux-plugins/vim-tmux"
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
" Bundle 'wakatime/vim-wakatime'
Bundle 'junegunn/vim-easy-align'

" Make sure you use single quotes
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Bundle 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Bundle 'roxma/nvim-yarp'
Bundle 'roxma/vim-hug-neovim-rpc'
Bundle 'fishbullet/deoplete-ruby'
Bundle 'ryanoasis/vim-webdevicons'
Bundle 'numkil/ag.nvim'
Bundle 'mattn/emmet-vim'



set clipboard=unnamedplus

let mapleader = "\\"
let g:ctrlp_map = '<c-p>'

let g:deoplete#enable_at_startup = 1

set wildignore+=*/.git/*,*/log/*,*/tmp/*,*/converage/*,*/doc/*,*/.DS_Store,*/vendor
set guifont=Monaco\ for\ Powerline:h12

syntax on

syntax enable
filetype plugin on
filetype indent on

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby,eruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

set laststatus=2
set noshowmode
set backspace=2
let g:airline_theme='ubaryd'
let g:airline#extensions#tabline#enabled = 1
let g:html5_event_handler_attributes_complete=0
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

map <c-b> :CtrlPBuffer<cr>
map <leader>m :Rmodel<cr>
map <leader>c :Rcontroller<cr>
map <leader>v :Rview<cr>

nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <leader>n :NERDTreeToggle<cr>
map <F7>  :call g:RubyDebugger.step()<CR>
map <F5>  :call g:RubyDebugger.next()<CR>
map <F8>  :call g:RubyDebugger.continue()<CR>

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:ruby_debugger_progname = 'mvim'

let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0

autocmd FileType html,css EmmetInstall

:nnoremap <leader>rap  :RAddParameter<cr>
:nnoremap <leader>rcpc :RConvertPostConditional<cr>
:nnoremap <leader>rel  :RExtractLet<cr>
:vnoremap <leader>rec  :RExtractConstant<cr>
:vnoremap <leader>relv :RExtractLocalVariable<cr>
:nnoremap <leader>rit  :RInlineTemp<cr>
:vnoremap <leader>rrlv :RRenameLocalVariable<cr>
:vnoremap <leader>rriv :RRenameInstanceVariable<cr>
:vnoremap <leader>rem  :RExtractMethod<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" The Silver Searcher
if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor

	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0
endif

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

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

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:powerline_pycmd = 'py3'
