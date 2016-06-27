" no <down> <Nop>
" no <left> <Nop>
" no <right> <Nop>
" no <up> <Nop>
"
" ino <down> <Nop>
" ino <left> <Nop>
" ino <right> <Nop>
" ino <up> <Nop>
" Get off my lawn
nnoremap <Left> :echoe "Stop being lazy use h"<CR>
nnoremap <Right> :echoe "Stop being lazy use l"<CR>
nnoremap <Up> :echoe "Stop being lazy use k"<CR>
nnoremap <Down> :echoe "Stop being lazy use j"<CR>


"===================Leader===================
let mapleader=","
"============================================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required


Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'myusuf3/numbers.vim'
"Plugin 'scrooloose/syntastic' 
" if $(hostname) == "heppc"* 
" 	Plugin 'Valloric/YouCompleteMe' 
" endif
Plugin 'vim-scripts/tComment' "Comment easily with gcc
Plugin 'lfilho/cosco.vim'
Plugin 'tpope/vim-surround' 
Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'ervandew/supertab' " this clashes with snipmate
Plugin 'chriskempson/base16-vim'
Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-unimpaired'
Plugin 'godlygeek/tabular.git'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'sjl/gundo.vim'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

" Bundle 'LucHermitte/lh-vim-lib'
" Bundle 'LucHermitte/VimFold4C'

call vundle#end()            " required 
filetype plugin indent on    " required

"toggle search highlighting.
" set hlsearch!

nnoremap <Leader>l :set hlsearch!<CR>
set hidden
set tabstop =2


map <silent> <C-n> :NERDTreeToggle<cr>
let g:NERDTreeToggleQuitOnOpen=1
let NERDTreeShowHidden=1
nmap <silent> <leader>y :NERDTreeFind<cr>

" map <CR> o " This mapping is bad for command line window.
nnoremap <Space> za
map <Leader>= mmggVG9<ggVG=`m
map <Leader>gq mmggVGgq`m
map <Leader>gq gqip
" momentment shortcuts
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

" These mappings help opening files from current working directory.
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%


" :Wrap sets nice wrapping.
command! -nargs=* Wrap set wrap linebreak nolist

""" Moving in lines
" vmap <D-j> gj
" vmap <D-k> gk
" vmap <D-4> g$
" vmap <D-6> g^
" vmap <D-0> g^
" nmap <D-j> gj
" nmap <D-k> gk
" nmap <D-4> g$
" nmap <D-6> g^
" nmap <D-0> g^

"sets par as the qg formater program, gw is still assigned to vims enturnal
"formater.
if executable("par")
set formatprg=par\ -w78
endif
"
" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>

" Set region to British English
set spelllang=en_gb

"Editing vimrc
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

nmap <leader>v :tabedit $MYVIMRC<CR>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

nmap gV `[v`]
"Tabular shortcuts
if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:\zs<CR>
	vmap <Leader>a: :Tabularize /:\zs<CR>
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

"Gundo mapping
nnoremap <F5> :GundoToggle<CR>

""" SYSTEM CLIPBOARD COPY & PASTE SUPPORT
set pastetoggle=<F2> "F2 before pasting to preserve indentation
"Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"

set background=dark
set number
syntax on


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

" airline symbols
"let g:airline_left_sep = '<U+E0B0>'
" let g:airline_left_alt_sep = '<U+E0B1>'
" let g:airline_right_sep = '<U+E0B2>'
" let g:airline_right_alt_sep = '<U+E0B3>'
" let g:airline_symbols.branch = '<U+E0A0>'
" let g:airline_symbols.readonly = '<U+E0A2>'
" let g:airline_symbols.linenr = '<U+E0A1>'

set t_Co=256


let g:ycm_confirm_extra_conf = 0 
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

let g:syntastic_cpp_config_file ='.syntastic_cpp_config'



" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

set laststatus=2

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files

set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" LaTeX (rubber) macro for compiling
nnoremap <leader>c :w<CR>:!rubber --pdf --warn all %<CR>

" View PDF macro; '%:r' is current file's root (base) name.
nnoremap <leader>p :!evince %:r.pdf -w &<CR><CR>
" nnoremap <leader>v :!mupdf %:r.pdf &<CR><CR>

" function! Smart_TabComplete()
"   let line = getline('.')                         " current line
"
"   let substr = strpart(line, -1, col('.')+1)      " from the start of the current
"                                                   " line to one character right
"                                                   " of the cursor
"   let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
"   if (strlen(substr)==0)                          " nothing to match on empty string
"     return "\<tab>"
"   endif
"   let has_period = match(substr, '\.') != -1      " position of period, if any
"   let has_slash = match(substr, '\/') != -1       " position of slash, if any
"   if (!has_period && !has_slash)
"     return "\<C-X>\<C-P>"                         " existing text matching
"   elseif ( has_slash )
"     return "\<C-X>\<C-F>"                         " file matching
"   else
"     return "\<C-X>\<C-O>"                         " plugin matching
"   endif
" endfunction
"
" inoremap <tab> <c-r>=Smart_TabComplete()<CR>
"
