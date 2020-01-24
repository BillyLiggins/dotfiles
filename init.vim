""" Optixal's Neovim Init.vim
"
""" Vim-Plug
call plug#begin()

Plug 'psf/black'
Plug 'SkyLeach/pudb.vim'
Plug 'tpope/vim-rhubarb'
Plug 'itchyny/vim-gitbranch'
Plug 'myusuf3/numbers.vim'
Plug 'vim-scripts/tComment' "Comment easily with gcc
Plug 'tpope/vim-unimpaired'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'hhatto/autopep8'
Plug 'w0rp/ale'
Plug 'Chiel92/vim-autoformat'
Plug 'JamshedVesuna/vim-markdown-preview'

" Aesthetics - Main
Plug 'dracula/vim', { 'commit': '147f389f4275cec4ef43ebc25e2011c57b45cc00' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-journal'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'nightsense/forgotten'
Plug 'zaki/zazen'

" Aethetics - Additional
Plug 'nightsense/nemo'
Plug 'yuttie/hydrangea-vim'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'rhysd/vim-color-spring-night'

" Functionalities
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
" Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/Colorizer'
Plug 'heavenshell/vim-pydocstring'
Plug 'vim-scripts/loremipsum'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'metakirby5/codi.vim'
Plug 'dkarter/bullets.vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Entertainment
Plug 'dansomething/vim-hackernews'
"

"  from fred's init
" Plug 'junegunn/vim-github-dashboard'
" Plug 'tpope/vim-rhubarb'
" Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-markdown'
" Plug 'airblade/vim-gitgutter'
" Plug 'skywind3000/asyncrun.vim'
" Plug 'tomasr/molokai'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'davidhalter/jedi-vim'
" Plug 'mattn/emmet-vim'
" Plug 'moll/vim-node'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'lifepillar/pgsql.vim'
" Plug 'nvie/vim-flake8'


call plug#end()

"Editing vimrc
" if has("autocmd")
"   autocmd bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim
" endif
""" Python3 VirtualEnv
let g:python3_host_prog = expand('~/.config/nvim/env/bin/python')

""" Coloring
syntax on
color dracula
highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold guifg=#a4d692
highlight Normal gui=none
highlight NonText guibg=none
highlight SpellBad gui=italic guifg=Yellow guibg=black

" Opaque Background (Comment out to use terminal's profile)
set termguicolors

" Transparent Background (For i3 and compton)
highlight Normal guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE

""" Other Configurations
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\ 
set wrap breakindent
set encoding=utf-8
" set number
set title
set history=10000

" UI
" middle-click mouse paste
set mouse=v
set termguicolors
" relative line numbers, but absolute current line
set number relativenumber

" HIGHLIGHTING
set hlsearch
" Show matching brackets
set showmatch
set cursorline
set cursorcolumn
let g:markdown_fenced_languages = ['html', 'js=javascript', 'json=javascript', 'python', 'sql', 'bash=sh', 'sh']
" Don't mess up latex.
let g:tex_conceal = ""

""" Plugin Configurations

" NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'
let g:NERDTreeWinSize=80

" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
"let g:airline#extensions#tabline#enabled = 1

" Neovim :Terminal
tmap <Esc> C-\><C-n>
tmap <C-w> <Esc><C-w>
"tmap <C-d> <Esc>:q<CR>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" Deoplete
let g:deoplete#enable_at_startup = 1
" Disable documentation window
set completeopt-=preview

" Supertab
let g:SuperTabDefaultCompletionType = "<C-n>"

" Ultisnips
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-x>"

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'

" TagBar
let g:tagbar_width = 40
let g:tagbar_iconchars = ['↠', '↡']

" fzf-vim
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'Type'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Character'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Ale linter
" keep the linting gutter open
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\ 'javascript': ['prettier'],
\ 'python': ['autopep8', 'remove_trailing_lines']
\}

" let g:ale_max_line_length=120
let g:autopep8_max_line_length=119

" \ 'python': ['autopep8', 'remove_trailing_lines']
" air-line
let g:airline_powerline_fonts = 1

"let g:airline_theme='wombat'
let g:airline_theme='distinguished'

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" " Pymode
" let g:pymode_python = 'python3'
" let g:pymode_trim_whitespaces = 1
" let g:pymode_virtualenv = 1
" " let g:pymode_rope = 1
" " let g:pymode_rope_goto_definition_bind = '<C-c>j'
" let g:pymode_lint_checkers = ['pep8']


""" Filetype-Specific Configurations

" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Python
autocmd FileType python set
    \ tabstop=4
    \ shiftwidth=4
    \ softtabstop=4
    \ textwidth=119
    \ expandtab
    \ autoindent
    \ fileformat=unix

autocmd FileType python set colorcolumn=80,120

""" Custom Functions

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

" Dracula Mode (Dark)
function! ColorDracula()
    let g:airline_theme=''
    color dracula
    IndentLinesEnable
endfunction

" Seoul256 Mode (Dark & Light)
function! ColorSeoul256()
    let g:airline_theme='silver'
    color seoul256
    IndentLinesDisable
endfunction

" Forgotten Mode (Light)
function! ColorForgotten()
    " Light airline themes: tomorrow, silver, alduin
    " Light colors: forgotten-light, nemo-light
    let g:airline_theme='tomorrow'
    color forgotten-light
    IndentLinesDisable
endfunction

" Zazen Mode (Black & White)
function! ColorZazen()
    let g:airline_theme='badcat'
    color zazen
    IndentLinesEnable
endfunction


" COMMANDS
" ensure dir exists for current buffer
nnoremap <leader>m :!mkdir -p <c-r>=expand("%:h")<cr>/<CR>
" open files as expected (including URLs)
let g:netrw_browsex_viewer = 'xdg-open'

""" Custom Mappings

"===================Leader===================
let mapleader=","
"============================================
nmap <leader>q :NERDTreeToggle<CR>
nmap <C-n> :NERDTreeToggle<CR>
nmap \ <leader>q
nmap \\ :NERDTree<CR>:TagbarOpen<CR><C-l>
nmap <leader>w :TagbarToggle<CR>
nmap <leader>ee :Colors<CR>
nmap <leader>ea :AirlineTheme
nmap <leader>eaa :AirlineTheme random<CR>
nmap <leader>e1 :call ColorDracula()<CR>
nmap <leader>e2 :call ColorSeoul256()<CR>
nmap <leader>e3 :call ColorForgotten()<CR>
nmap <leader>e4 :call ColorZazen()<CR>
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>rc :tabe ~/.config/nvim/init.vim<CR>
nmap <leader>tt :call TrimWhitespace()<CR>
xmap <leader>a gaip*
nmap <leader>a gaip*
" nmap <leader>s <C-w>s<C-w>j:terminal<CR>
" nmap <leader>vs <C-w>v<C-w>l:terminal<CR>
nmap <leader>d <Plug>(pydocstring)
nmap <leader>f :Files<CR>
nmap <leader>t :Tags<CR>
nmap <leader>g :Goyo<CR>
nmap <leader>h :RainbowParentheses!!<CR>
nmap <leader>k :ColorToggle<CR>
nmap <leader>l :Limelight!!<CR>
xmap <leader>l :Limelight!!<CR>
" autocmd FileType python nmap <leader>x :0,$!~/.config/nvim/env/bin/python -m yapf<CR>
"nmap <leader>n :HackerNews best<CR>J
nmap <silent> <leader><leader> :noh<CR>
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

""" Picks from vimrc

" autocmd BufWritePost,FileWritePost *.py :silent! !ctags -R -o ./veTags $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))")

set t_Co=256

nnoremap <Left> :bprevious<CR>
nnoremap <Right> :bnext<CR>
nnoremap <Up> :ls<CR>
nnoremap <Down> :ls<CR>

""" Move buffer without saving.
set hidden

nnoremap <Space> zizz
map <Leader>= mmggVG9<ggVG=`m
map <Leader>gq mmggVGgq`m
map <Leader>gq gqip
" movementment shortcuts
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" for moving along tabs
map <C-S-]> gt
map <C-S-[> gT
map <C-1> 1gt
map <C-2> 2gt
map <C-3> 3gt
map <C-4> 4gt
map <C-5> 5gt
map <C-6> 6gt
map <C-7> 7gt
map <C-8> 8gt
map <C-9> 9gt
map <C-0> :tablast<CR>

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
" nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
" inoremap <C-t>     <Esc>:tabnew<CR>

" undo
map U <C-R>

" select recent paste
nmap gV `[v`]

"" These mappings help opening files from current working directory.
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Toggle spell checking on and off with `,s`
" autocmd FileType * setlocal spell
nmap <silent> <leader>s :set spell!<CR>
nmap <silent> <leader>z [sz=1<CR>
nmap <silent> <leader>Z [sz=

" Set region to British English
set spelllang=en_gb

" SYSTEM INTERACTION
" copy/paste to/from system clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P


" Json formatting
com! FormatJSON %!python -m json.tool
nnoremap =j :FormatJSON<CR>

" Find usages of word under cursor
nnoremap <leader>u :Ag <C-R><C-W><CR>
nnoremap <leader>/ :Tag <CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>ag :Ag<CR>

" VCS / GIT
nnoremap <leader>gs :20G<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gm :Gmove
nnoremap <leader>gd :Gvdiff<CR>

" Scrolloff
set so=999
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

" Autoformat
nnoremap <C-A-l> :Autoformat<CR>
inoremap <C-A-l> :Autoformat<CR>

" " Semshi
nmap <silent> <leader>rr :Semshi rename<CR>

" resize
nmap <silent> <C-Right> <C-w>>
nmap <silent> <C-Left> <C-w><
nmap <silent> <C-Up> <C-w>-
nmap <silent> <C-Down> <C-w>+

" ctags
set tags+=$VIRTUAL_ENV/tags

" " Nvim python environment settings
" if has('nvim')
"   let g:python_host_prog='~/.virtualenvs/neovim2/bin/python'
"   let g:python3_host_prog='~/.virtualenvs/neovim3/bin/python'
"   " set the virtual env python used to launch the debugger
"   let g:pudb_python=$VIRTUAL_ENV.'/bin/python3'
"   " set the entry point (script) to use for pudb
"   " let g:pudb_entry_point='~/src/poweruser_tools/test/test_templates.py'
"   " Unicode symbols work fine (nvim, iterm, tmux, nyovim tested)
"   let g:pudb_breakpoint_symbol='☠'
" endif
