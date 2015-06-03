" .vimrc
" Shivesh Mandalia
" http://dougblack.io/words/a-good-vimrc.html

" Launch Config {{{
" use pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
call pathogen#helptags()
" }}}

" Colors {{{
syntax enable           " enable snytax processing
set background=dark     " dark colour scheme
colorscheme solarized   " solarized colour scheme
" }}}

" Movement {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" delete buffer without closing window
nnoremap <C-c> :bp\|bd #<CR>
" keep cursor and window position when switching buffers
au BufLeave * let b:winview = winsaveview()
au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
" }}}

" Spacing {{{
set shiftwidth=4        " behaviour of >>, << and ==
set softtabstop=4       " number of space in tab when editing
set expandtab           " tabs are spaces
set textwidth=79        " text width to 79 characters
" }}}

" UI Config {{{
set laststatus=2        " always show status line
set number              " show line number of current line
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set colorcolumn=79      " show column at 79 characters
" load filetype-specific indent files
filetype plugin indent on
" }}}

" Searching {{{
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
let mapleader=","       " leader is comma
nnoremap <leader><space> :nohlsearch<CR>
" look for ctags up to ~ directory
set tags=./tags;$HOME
" }}}

" Folding {{{
set foldenable          " enable folding
set foldlevelstart=99   " open most folds by default
set foldnestmax=10      " 10  nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold method based on indent level
" }}}

" Headers {{{
" tex files
autocmd BufReadPost,filewritepre *.tex execute "normal ma"
autocmd BufReadPost,filewritepre *.tex exe "1," . 10 . "g/Last Change:.*/s/Last Change:.*/Last Change " .strftime("%c")
autocmd bufwritepost,filewritepre *.tex execute "normal ma" | normal zz
" }}}

" CtrlP {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
" }}}

" Syntastic {{{
" Errors appear in statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Toggle Syntastic using <leader>E
nnoremap <leader>E :SyntasticCheck<CR>:Errors<CR>:SyntasticToggleMode<CR>

" Load headers specified by config file
let g:syntastic_cpp_config_file = '.syntastic_cpp_config'
" }}}

" Airline {{{
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show buffer number
let g:airline#extensions#tabline#buffer_idx_mode = 1
" Key mappings for buffer numbers
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" enable/disable syntastic integration
let g:airline#extensions#syntastic#enabled = 1
" }}}

" YouCompleteMe {{{
" autocomplete for c family
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
" remap make run to F4
nnoremap <F4> :make run<cr>
" turn off YCM diagnostic display features as it conflicts with Syntastic
let g:ycm_show_diagnostics_ui = 0
" }}}

" Commentary {{{
" // only for cpp files
autocmd FileType cpp set commentstring=//\ %s
" }}}

" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

" Misc {{{
" allow switching buffers without saving
set hidden
" allow backspace over indent and end of line
set backspace=indent,eol
" save session
nnoremap <leader>s :mksession<CR>
" Remember cursor location
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Rebind yank to end of line
nnoremap Y y$
" Rebind redo
nnoremap U <C-r>
" }}}

" vim:foldmethod=marker:foldlevel=0
