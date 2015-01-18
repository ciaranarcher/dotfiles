" Required by nelstrom/vim-textobj-rubyblock
set nocompatible
filetype off
if has("autocmd")
  filetype indent plugin on
endif

let mapleader = ","

set relativenumber
set number

runtime macros/matchit.vim

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

syntax enable
" if has('gui_running')
" 	set background=light
" else
" 	set background=dark
" endif
" colorscheme solarized
:set t_Co=256 " 256 colors
:set background=dark
:color ir_black

" Show line numbers
set number

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo

Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
nnoremap <leader>. :CtrlPTag<cr>

Plugin 'bling/vim-airline'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_branch_prefix = ''
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

Plugin 'tpope/vim-fugitive'

Plugin 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby'], 'passive_filetypes': ['html', 'css', 'slim'] }

Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'

autocmd FileType ruby,eruby,yaml set tw=80 ai sw=2 sts=2 et expandtab
autocmd FileType ruby,eruby,yaml setlocal foldmethod=manual ts=2 sts=2 sw=2
autocmd User Rails set tw=80 ai sw=2 sts=2 et expandtab

" Open github files in browser
Plugin 'tyru/open-browser.vim'
Plugin 'tyru/open-browser-github.vim'

Plugin 'tpope/vim-commentary'
Plugin 'rking/ag.vim'
Plugin 'Raimondi/delimitMate'

Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

Plugin 'fatih/vim-go'

Plugin 'tpope/vim-surround'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
"
set clipboard=unnamed
set nowrap

"" Easy splitted window navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" Remove trailing whitespaces when saving
" " Wanna know more? http://vim.wikia.com/wiki/Remove_unwanted_spaces
" " If you want to remove trailing spaces when you want, so not automatically,
" " see
" "
" http://vim.wikia.com/wiki/Remove_unwanted_spaces#Display_or_remove_unwanted_whitespace_with_a_script.
autocmd BufWritePre * :%s/\s\+$//e
"
set ignorecase
set smartcase
set gdefault
set hlsearch
"
" " clear search matching
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Remap ,b to :bp
noremap <leader>b :bn<cr>

" bind K to grep word under cursor
nnoremap K :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" bind \ to prepopulate Ag
nnoremap \ :Ag<SPACE>

" run spring tests
function! s:runTests()
    exec ":!mspec ".@%
endfunction
command! RunTests :call s:runTests()
nmap <leader>t :RunTests<cr>

function! s:runNearestTest()
    let spec_line_number = line('.')
    exec ":!mspec " . @% . " -l " . spec_line_number
endfunction
command! RunNearestTest :call s:runNearestTest()
nmap <leader>n :RunNearestTest<cr>
