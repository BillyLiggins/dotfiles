" Get off my lawn
nnoremap <Left> :echoe "Stop being lazy use h"<CR>
nnoremap <Right> :echoe "Stop being lazy use l"<CR>
nnoremap <Up> :echoe "Stop being lazy use k"<CR>
nnoremap <Down> :echoe "Stop being lazy use j"<CR>
vmap <expr> <LEFT> DVB_Drag('left')
vmap <expr> <RIGHT> DVB_Drag('right')
vmap <expr> <DOWN> DVB_Drag('down')
vmap <expr> <UP> DVB_Drag('up')

vmap <expr>	D DVB_Duplicate()

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
" Plugin 'scrooloose/syntastic' 
" if $(hostname) == "heppc"* 
" Plugin 'Valloric/YouCompleteMe' 
" endif
Plugin 'vim-scripts/tComment' "Comment easily with gcc
Plugin 'lfilho/cosco.vim'
Plugin 'tpope/vim-surround' 
Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-unimpaired'
" Plugin 'tpope/vim-vinegar.git' 
Plugin 'godlygeek/tabular.git'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'sjl/gundo.vim'
Plugin 'flazz/vim-colorschemes'

" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
"
" " Optional:
" Plugin 'honza/vim-snippets'

"Track the engine.
Plugin 'SirVer/ultisnips'

"Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'


Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
" Bundle "honza/vim-snippets"
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'metakirby5/codi.vim'
Plugin 'skywind3000/asyncrun.vim'
" Plugin 'w0rp/ale'


call vundle#end()            " required 
filetype plugin indent on    " required

" file finding
set path+=**
set wildmenu
set complete-=i

let g:netrw_banner = 0
let g:netrw_altv = 1
let g:netrw_liststyle = 3
let g:netrw_list_hide = netrw_gitignore#Hide()


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



"toggle search highlighting.
nnoremap <Leader>l :set hlsearch!<CR>
set hidden
set tabstop =2
set backspace=indent,eol,start
set diffopt+=vertical
" set tabstop =2
map <Leader>tw :set tw=80<CR>

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

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

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" undo
map U <C-R>

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
nmap <silent> <leader>z [sz=

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
map <silent><Leader>h :tabe %:r.h<CR>

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


set t_Co=256


let g:ycm_confirm_extra_conf = 0 
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

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
"++++ Additions from Instantly better vim +++
    " This rewires n and N to do the highlighing...
    nnoremap <silent> n   n:call HLNext(0.4)<cr>
    nnoremap <silent> N   N:call HLNext(0.4)<cr>


    " " EITHER blink the line containing the match...
    " function! HLNext (blinktime)
    "     set invcursorline
    "     redraw
    "     exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    "     set invcursorline
    "     redraw
    " endfunction
    "
    " OR ELSE ring the match in red...
    function! HLNext (blinktime)
        highlight RedOnRed ctermfg=red ctermbg=red
        let [bufnum, lnum, col, off] = getpos('.')
        let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
        echo matchlen
        let ring_pat = (lnum > 1 ? '\%'.(lnum-1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.\|' : '')
                \ . '\%'.lnum.'l\%>'.max([col-4,1]) .'v\%<'.col.'v.'
                \ . '\|'
                \ . '\%'.lnum.'l\%>'.max([col+matchlen-1,1]) .'v\%<'.(col+matchlen+3).'v.'
                \ . '\|'
                \ . '\%'.(lnum+1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.'
        let ring = matchadd('RedOnRed', ring_pat, 101)
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        call matchdelete(ring)
        redraw
    endfunction
    "
    " " OR ELSE briefly hide everything except the match...
    " function! HLNext (blinktime)
    "     highlight BlackOnBlack ctermfg=black ctermbg=black
    "     let [bufnum, lnum, col, off] = getpos('.')
    "     let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    "     let hide_pat = '\%<'.lnum.'l.'
    "             \ . '\|'
    "             \ . '\%'.lnum.'l\%<'.col.'v.'
    "             \ . '\|'
    "             \ . '\%'.lnum.'l\%>'.(col+matchlen-1).'v.'
    "             \ . '\|'
    "             \ . '\%>'.lnum.'l.'
    "     let ring = matchadd('BlackOnBlack', hide_pat, 101)
    "     redraw
    "     exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    "     call matchdelete(ring)
    "     redraw
    " endfunction

    " " OR ELSE just highlight the match in red...
    " function! HLNext (blinktime)
    "     let [bufnum, lnum, col, off] = getpos('.')
    "     let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    "     let target_pat = '\c\%#\%('.@/.'\)'
    "     let ring = matchadd('WhiteOnRed', target_pat, 101)
    "     redraw
    "     exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    "     call matchdelete(ring)
    "     redraw
    " endfunction

" "====[ Swap : and ; to make colon commands easier to type ]======
"
"     nnoremap  ;  :
"     nnoremap  :  ;

vmap <expr>	 ++ VMATH_YankAndAnalyse ()
nmap 				 ++ vip++


" LaTeX (rubber) macro for compiling
nnoremap <leader>c :w<CR>:!rubber --pdf --warn all %<CR>

" View PDF macro; '%:r' is current file's root (base) name.
nnoremap <leader>p :!evince %:r.pdf &<CR><CR>
" LaTeX from Matt P's vimrc.
	autocmd BufNewFile,BufRead *.tex set filetype=tex" nnoremap <leader>p :!evince %:r.pdf -w &<CR><CR>
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

