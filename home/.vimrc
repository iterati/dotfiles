set nocompatible
let mapleader=","
let localleader="/"

" Sometimes my pinky is slow
command! W :w

" No permissions?
cmap W! w !sudo tee % >/dev/null

map <silent> <leader>V :source $MYVIMRC<CR>
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" Open new splits
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>W <C-w>s
nnoremap <leader>s :new<CR>

" Left/Right arrow keys change buffers in all modes
noremap <Left> <Esc>:bp<CR>
inoremap <Left> <Esc>:bp<CR>
nnoremap <Left> <Esc>:bp<CR>
vnoremap <Left> <Esc>:bp<CR>
noremap <Right> <Esc>:bn<CR>
inoremap <Right> <Esc>:bn<CR>
nnoremap <Right> <Esc>:bn<CR>
vnoremap <Right> <Esc>:bn<CR>

" And up/down moves up/down
noremap <up> <c-u>
noremap <down> <c-d>
inoremap <up> <nop>
inoremap <down> <nop>

" Smash escape
inoremap jk <esc>

" Lazy
nnoremap ; :

" More lazy
noremap <silent><leader>/ :nohls<CR>

" Panel plugins
map <leader>n :NERDTreeToggle<CR>
map <leader>g :GundoToggle<CR>
map <leader>td <Plug>TaskList
nnoremap <leader>l :TagbarToggle<CR>

" Indent guides are kewl
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" Yankring is kewl, too
let g:yankring_history_dir = '~/.vim/bundle/yankring'
let g:yankring_history_file = '.clipboard'
nnoremap <leader>r :YRShow<CR>
nnoremap <leader>p :YRGetElem<CR>

" Ultisnips > snipmate? Only time will tell
let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsSnippetsDir = '~/.vim/snippets'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
nnoremap <leader>ue :UltiSnipsEdit<CR>

" Ctrl-P
noremap <c-p> :CtrlP<CR>

" Tabularize
vnoremap <silent> <Leader>t> :Tabularize /=><CR>
vnoremap <silent> <Leader>t= :Tabularize /=<CR>
vnoremap <silent> <Leader>t, :Tabularize /,<CR>

" Minibufexpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplModSelTarget = 1

" Supatab!
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Bundles!!!!
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
syntax on
filetype on
filetype plugin indent on

set number
set numberwidth=3
set background=dark
set title
set wildmenu
set wildmode=full
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**
set noerrorbells
set vb t_vb=
set backspace=indent,eol,start
set cursorline
set ruler
set nostartofline
set virtualedit=block
set scrolloff=8
set showmatch
set nowrap
set tabstop=4
set expandtab
set smarttab
set matchpairs+=<:>
set foldmethod=indent
set foldlevel=99
set noautoread
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions
set noswapfile
set list
set listchars=trail:.

"Display
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="normal"
let g:solarized_visibility="low"
hi IndentGuidesOdgd ctermbg=236
hi IndentGuidesEven ctermbg=8
colorscheme solarized

"Use relative numberings
if exists("&relativenumber")
  set relativenumber
  set undodir=~/.vim/undodir
  set undofile
  silent! autocmd InsertEnter * :set number
  silent! autocmd InsertLeave * :set relativenumber
  silent! au FocusLost * :set number
  silent! au FocusGained * :set relativenumber
endif

autocmd FileType * setlocal colorcolumn=0

" Templates
autocmd BufNewFile,BufRead *.rhtml setlocal ft=eruby
autocmd BufNewFile,BufRead *.mako setlocal ft=mako
autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python
autocmd BufNewFile,BufRead *.html setlocal ft=htmldjango
let html_no_rendering=1
autocmd FileType html,htmldjango,htmljinja,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 colorcolumn=79
      \ formatoptions+=croq softtabstop=4 cindent
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType python set omnifunc=pythoncomplete#Complete
let python_highlight_all=1

" CSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Markdown
autocmd BufNewFile,BufRead *.txt,*.markdown,*.md setlocal ft=markdown colorcolumn=79
autocmd FileType rst setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=79

" Javascript
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=79
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
let javascript_enable_domhtmlcss=1

py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
