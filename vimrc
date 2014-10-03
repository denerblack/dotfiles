set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set number

set t_Co=256

highlight LineNr ctermfg=237  ctermbg=234
highlight Pmenu ctermbg=234 guibg=black ctermfg=237
highlight PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff

"colorscheme solarized

"call pathogen#infect()

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/L9'
Bundle 'kien/ctrlp.vim'
"Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-tbone'
Bundle 'tpope/vim-rails'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-ruby/vim-ruby'
Bundle 'othree/vim-autocomplpop'
Bundle 'tpope/vim-fugitive'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'bling/vim-airline'
"Bundle 'vim-scripts/Gist.vim'
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


let mapleader = "\\"
let g:ctrlp_map = '<c-p>'


set guifont=ProggyCleanTT\ 12

syntax on

syntax enable
filetype plugin on
filetype indent on

"autocmd vimenter * NERDTree

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby,eruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

set laststatus=2
set noshowmode
let g:airline_theme='bubblegum'
let g:html5_event_handler_attributes_complete=0

"try
"	source ~/.vim/bundle/snipmate-snippets/support_functions.vim
"endtry

"let g:ctrlp_custom_ignore = 'vendor'


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

map <F7>  :call g:RubyDebugger.step()<CR>
map <F5>  :call g:RubyDebugger.next()<CR>
map <F8>  :call g:RubyDebugger.continue()<CR>

let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:ruby_debugger_progname = 'mvim'


:nnoremap <leader>rap  :RAddParameter<cr>
:nnoremap <leader>rcpc :RConvertPostConditional<cr>
:nnoremap <leader>rel  :RExtractLet<cr>
:vnoremap <leader>rec  :RExtractConstant<cr>
:vnoremap <leader>relv :RExtractLocalVariable<cr>
:nnoremap <leader>rit  :RInlineTemp<cr>
:vnoremap <leader>rrlv :RRenameLocalVariable<cr>
:vnoremap <leader>rriv :RRenameInstanceVariable<cr>
:vnoremap <leader>rem  :RExtractMethod<cr>

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
