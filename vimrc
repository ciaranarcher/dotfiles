
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugins
filetype off
if has("autocmd")
  filetype indent plugin on
endif

" Sets how many lines of history VIM has to remember
set history=500

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" zsh shell
set shell=zsh

" Clipboard should be shared with the system
set clipboard=unnamed

" Ugh, no wrapping!
set nowrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
let mapleader = ","

" Keep cursor centered on screen 5 chars
set so=5

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Don't let vim leave temp files around
set noswapfile
set nobackup
set nowb

" Use relative line numbers
set number
set relativenumber

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned, rather than having to save it
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Make regex /g (global) by default
set gdefault

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2


" Enable syntax highlighting
syntax enable

set foldenable " enable code folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested folds max
set updatetime=500
noremap <space> za
set foldmethod=indent " fold based on indent level

" save session
nnoremap <leader>s :mksession<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=100

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

:set t_Co=256 " 256 colors

" LIGHT
" :set background=light
" colorscheme grb-light

" IR BLACK
:set background=dark
:color grb256


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Weird stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Required by nelstrom/vim-textobj-rubyblock
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Performance tweaks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Address slow scrolling
set ttyfast
set lazyredraw
" http://superuser.com/questions/161178/why-does-vim-delay-for-a-second-whenever-i-use-the-o-command-open-a-new-line
set ttimeoutlen=0

" Faster ctags (http://stackoverflow.com/questions/155449/vim-auto-generate-ctags)
au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Easy splitted window navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" Remove trailing whitespaces when saving
" Wanna know more? http://vim.wikia.com/wiki/Remove_unwanted_spaces
" If you want to remove trailing spaces when you want, so not automatically,
" see http://vim.wikia.com/wiki/Remove_unwanted_spaces#Display_or_remove_unwanted_whitespace_with_a_script.
autocmd BufWritePre * :%s/\s\+$//e

" Clear search matching
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle settings and plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


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

" airline for a fancy status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='simple'
set noshowmode " Hides the original vim mode (INSERT / V-BLOCK etc.)

Plugin 'tpope/vim-fugitive'

au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'

autocmd FileType ruby,eruby,yaml set tw=80 ai sw=2 sts=2 et expandtab
autocmd FileType ruby,eruby,yaml setlocal ts=2 sts=2 sw=2
autocmd User Rails set tw=80 ai sw=2 sts=2 et expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype json setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype go setlocal noet ts=4 sw=4 sts=4
" Default files with no filetype enabled to ruby syntax
au BufNewFile,BufRead * if &syntax == '' | set syntax=ruby | endif


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

" Map j/k to navigate autocomplete rather than C-p/C-n
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

Plugin 'w0rp/ale' " Async lint engine...
let g:ale_sign_column_always = 1

Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'
let g:go_fmt_command = "goimports"
let g:go_list_type = "location" " or quickfix
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'structcheck', 'maligned', 'deadcode', 'goimports', 'errcheck', 'varcheck', 'interfacer', 'unconvert', 'goconst', 'gas',]

set autowrite " Save automatically when running a command"
autocmd FileType go setlocal ts=4 commentstring=//\ %s
" Open alternate (i.e. test)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AH call go#alternate#Switch(<bang>0, 'split')
noremap <leader>i :GoInfo<cr>
noremap <leader>m :GoMetaLinter<cr>
noremap <leader>c :GoCoverage<cr>
nmap gt :GoTest<CR>
vmap gt :GoTest<CR>

Plugin 'tpope/vim-surround'

" Extend text objects
Plugin 'kana/vim-textobj-user'
Plugin 'tek/vim-textobj-ruby'

Plugin 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. eaip)
nmap ea <Plug>(EasyAlign)

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'mzlogin/vim-markdown-toc'

" Project-wide search and replace
Plugin 'dyng/ctrlsf.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
