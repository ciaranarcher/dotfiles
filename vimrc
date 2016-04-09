" Required by nelstrom/vim-textobj-rubyblock
set nocompatible
filetype off
if has("autocmd")
  filetype indent plugin on
endif

let mapleader = ","

set noswapfile
set relativenumber
set number
set cursorline " highlight current line

set foldenable " enable code folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested folds max
noremap <space> za
set foldmethod=indent " fold based on indent level

" save session
nnoremap <leader>s :mksession<CR>

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

" zsh shell
set shell=zsh

" Some performance optimisations for slow scrolling
set ttyfast
set lazyredraw
" http://superuser.com/questions/161178/why-does-vim-delay-for-a-second-whenever-i-use-the-o-command-open-a-new-line
set ttimeoutlen=0

" Show line numbers
set number

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo

" Plugin 'airblade/vim-gitgutter' " Disabled because was slow
Plugin 'kien/ctrlp.vim'
nnoremap <leader>. :CtrlPTag<cr>
" set your own custom ignore settings
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|node_modules$\|Godeps$\|vendor$\|log$\|public$\|tmp$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

" Autocomplete open command
"set wildmenu
"set wildmode=list:longest

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" let g:airline_branch_prefix = ''
" let g:airline_symbols = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='papercolor'
set laststatus=2

Plugin 'tpope/vim-fugitive'

" Plugin 'scrooloose/syntastic'
" let g:syntastic_enable_signs=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby'], 'passive_filetypes': ['html', 'css', 'slim', 'go', 'js'] }
" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']

au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'

autocmd FileType ruby,eruby,yaml set tw=80 ai sw=2 sts=2 et expandtab
autocmd FileType ruby,eruby,yaml setlocal ts=2 sts=2 sw=2
autocmd User Rails set tw=80 ai sw=2 sts=2 et expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype go setlocal noet ts=4 sw=4 sts=4

Plugin 'mustache/vim-mustache-handlebars'
au BufReadPost *.hbs.erb set syntax=mustache

" Open github files in browser
Plugin 'tyru/open-browser.vim'
Plugin 'tyru/open-browser-github.vim'
let g:openbrowser_github_url_exists_check = 'ignore'
nmap gh :OpenGithubFile<CR>
vmap gh :OpenGithubFile<CR>



Plugin 'tpope/vim-commentary'
Plugin 'rking/ag.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'ervandew/supertab'

Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
" Open current buffer in nerd tree
map <leader>t :NERDTreeFind<CR>

Plugin 'fatih/vim-go'
autocmd FileType go setlocal ts=4
let g:go_fmt_command = 'goimports'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

Plugin 'tpope/vim-surround'

" Extend text objects
Plugin 'kana/vim-textobj-user'
Plugin 'tek/vim-textobj-ruby'

Plugin 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. eaip)
nmap ea <Plug>(EasyAlign)

" Plugin 'Valloric/YouCompleteMe'
" let g:ycm_collect_identifiers_from_tags_files = 1

" Faster ctags (http://stackoverflow.com/questions/155449/vim-auto-generate-ctags)
au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" **** COLOURS ****
:set t_Co=256 " 256 colors
:set background=light
colorscheme grb-light

" IR BLACK
" :set background=dark
" :color grb256

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
" Copy file path register to clipboard register
noremap <leader>f :let @+=@%<cr>

" bind K to grep word under cursor
nnoremap K :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" bind \ to prepopulate Ag
nnoremap \ :Ag<SPACE>
"  Close current buffer but keep split open
nnoremap <leader>d :bp\|bd #<CR>

" move to beginning / end of a line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" source ~/.vim/functions/test_runner.vim
