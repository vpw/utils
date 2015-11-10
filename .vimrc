set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" was set in vimrc_example - not needed
" writebackup is set
set nobackup

"set diffexpr=MyDiff()
"set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" snipmate
" filetype plugin on

" Find references to current symbol using Gtags
" reference
" map <C-I> :Gtags -r <C-r><C-W><CR> 

" Find definition of current symbol using Gtags
"map <C-F> :Gtags <C-R><C-W><CR>
" goto gtags
"map <C-g> <esc>:Gtags 
"list functions
"map <F9> :Gtags -f%<CR>
"map <F10> :cclose<CR>
"map <F11> :bprevious<CR>
"map <F12> :bnext<CR>

" Go to previous file
"map <C-p> <esc>:bp<CR>

" symbol at cursor
"map <C-j> :GtagsCursor<CR>
"navigate files
"map <C-n> <esc>:cn<CR>
"map <C-p> <esc>:cp<CR>

"test
 "Close Results Window
     nnoremap <C-Q> <C-W><C-W><C-W> q
 "Prepare Grep
 "    nnoremap <Cg>: Gtags -g
 "Find the source of the cursor following definitions
"     nnoremap <Cj>: Gtags <C-R> <C-W> <CR>
 "Look where the cursor using the following
"     nnoremap <Ck>: Gtags -r <C-R> <C-W> <CR>

" nertdtree
"map <F2> :NERDTreeToggle<CR> " New mapping in windows rc

"Title
" map <C-T> :SetVimTitleString 
" ClearVimTitleString
" tabs
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
"map  <C-n> :tabnew<CR>

"Folding related
nnoremap <space> za
vnoremap <space> zf
"nnoremap <silent> <Space> :exe 'silent! normal! za'.(foldlevel('.') ? '' : 'l')<CR>

:syn region myFold start="\#if" end="\#endif" transparent fold
:syn sync fromstart

set foldenable foldmethod=syntax
let c_no_comment_fold=1
map <a-right> zr
map <a-left> zm
map <a-right><a-right> zR
map <a-left><a-left> zM
set foldcolumn=4

set ignorecase
:set smartcase
:set hlsearch
:nmap \q :nohlsearch<CR>
":nmap <C-e> :e#<CR> " Use Ctrl 6
":nmap <C-n> :bnext<CR>
":nmap <C-p> :bprev<CR>
:nmap ;b :CtrlPBuffer<CR>
:nmap ;m :CtrlPMRU<CR>
:nmap ;f :CtrlP<CR>
:nmap \s :set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
:nmap \S :set noexpandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
:nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
:nmap \m :set noexpandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
:nmap \t :Tlist<CR>
:set noexpandtab

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
	set t_Co=256
endif
" make, edit error in Qfix
noremap <leader>m :silent! :make \| :redraw! \| :botright :cw<cr>

"  cnoreabbrev csa cs add
"  cnoreabbrev csf cs find
"  cnoreabbrev csk cs kill
"  cnoreabbrev csr cs reset
"  cnoreabbrev css cs show
"  cnoreabbrev csh cs help
"
""    cnoreabbrev <expr> csa
""              \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs add'  : 'csa')
""        cnoreabbrev <expr> csf
""              \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs find' : 'csf')
""        cnoreabbrev <expr> csk
""              \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs kill' : 'csk')
""        cnoreabbrev <expr> csr
""              \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs reset' : 'csr')
""        cnoreabbrev <expr> css
""              \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs show' : 'css')
""        cnoreabbrev <expr> csh
""              \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs help' : 'csh')
"
"  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
"endif


" global gtags related
" Find definition of current symbol using Gtags
"map <C-G> <esc>:Gtags <CR><CR>

" Find references to current symbol using Gtags
":map <C-R> <esc>:Gtags -r <CR><CR>
":map <F10> :cclose<CR>
":map <F11> :cp<CR>
":map <F12> :cn<CR>
" Go to previous file
"map <C-p> <esc>:bp<CR>
"map <C-]> :Gtags<CR><CR>
"map ^? :GtagsCursor<CR>
"map ^_ :Gtags -r ^R^W<CR>

" Ctags maps
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <C-@> :sp <CR>:exec("tag ".expand("<cword>"))<CR>
"    let g:ctags_path='/path/to/ctags'
"    let g:ctags_args='-I __declspec+'
"        (or whatever other additional arguments you want to pass to ctags)
let g:ctags_title=1	
" To show tag name in title bar.
let g:ctags_statusline=1	
" To show tag name in status line.
let generate_tags=1	
" To start automatically when a supported
"				" file is opened.

nnoremap bp :bprev<CR>
nmap zn zCzjfo
nmap zp zCfczkfo
" remain in the centre
nnoremap j jzz
nnoremap k kzz

"ctrlp-filetype
" CtrlP for filetype
let g:ctrlp_extensions = ['filetype']
silent! nnoremap <unique> <silent> <Leader>f :CtrlPFiletype<CR>

"sessions
:nmap ss :wa<Bar> exe "mksession! " . v:this_session<CR>
set sessionoptions=blank,buffers,folds,tabpages,winpos,curdir
"set sessionoptions=blank,buffers,sesdir,folds,tabpages,winpos,curdir

" Solarized
"syntax enable
"set background=light
"set background=dark
"colorscheme solarized

" Matchit - from vim73
"runtime macros/matchit.vim

nmap <C-K> "+yiw

"nnoremap unc :call Ctco('<C-R>%','mctunc')<CR>
" logs filtering related
function SortLog()
	exe "0,$sort /\%>1c*\%<14c/ r u"
"		/\%>43c.\%<46c
endfunction
nnoremap <leader>sl :call SortLog()<CR>
" clearcase plugin commands
nnoremap <leader>cp :call <SNR>21_CtConsoleDiff('', 1)<CR>
" code reviewer plugin
" Help:
" <leader>cs - set comments filename - default vcomment.rev
" <leader>cf - toggle full path in comments file
" <leader>cc - <not working> set comments file as the current one under review
" ic - insert comment - with clearcase ext
" id - insert comment - without clearcase ext
"
let g:CodeReviewer_reviewer="VardhanW"
let g:CodeReviewer_reviewFile=$HOME."/comments/vcomment.rev"
let g:CodeReviewer_fullpath=0
function CRSetCommentsPath(p)
	let g:CodeReviewer_reviewFile=a:p.'.rev'
endfunction
function CRToggleFullPath()
	if g:CodeReviewer_fullpath == 0
		let g:CodeReviewer_fullpath = 1
	else
		let g:CodeReviewer_fullpath = 0
	endif
endfunction

if has("gui_running")
  colorscheme gruvbox
  set background=dark
  "set background=light
  if has("gui_gtk2")
    "set guifont=Anonymous:h8:cANSI
    set guifont=Source\ Code\ Pro\ 11,Anonymous\ Pro\ Minus\ 12
"    set guifont?
"    set guifont=Inconsolata\ 11
  elseif has("gui_win32")
    "set guifont=Anonymous:h8:cANSI
    set guifont="Source Code Pro 12",Anonymous:h8:cANSI,Inconsolata\ 11
"    set guifont=Consolas:h11:cANSI
  endif
else
	colorscheme koehler
endif

map <silent> <leader>gt :call gruvbox#bg_toggle()<CR>
imap <silent> <leader>gt <ESC>:call gruvbox#bg_toggle()<CR>a
vmap <silent> <leader>gt <ESC>:call gruvbox#bg_toggle()<CR>gv 

" netrw for nerdtree
let g:netrw_liststyle=3

	exe 'vsp ' . l:f
endfunction
function UTExecTC(m)
	let l:f = expand('%:t')
	echo l:f
	let l = getcwd()
	exe 'cd /product/access/s-gsm/src/CALL/BSC/GSPB/' . a:m . '/test'
	"execute '!utlp'
	execute '!./OBJ/hsp/unitTest.hsp -out results -1 1 0x1234 ' . l:f . ' normt'
	exe 'cd ' . l
endfunction
function UTExecTCSplit(m)
	let l:f = expand('%:t')
	echo l:f
	let l = getcwd()
	echo l
	exe 'cd /product/access/s-gsm/src/CALL/BSC/GSPB/' . a:m . '/test'
	"execute '!utlp'
	execute ':new | 0read !./OBJ/hsp/unitTest.hsp -out results -1 1 0x1234 ' . l:f . ' normt'
	exe 'cd ' . l
endfunction

"	for i in g:ccflags
"		echo i
"		let l:flags = l:flags.' '.i
"	endfor
"	let Temp2 = tempname()
"	exe '!awk -f ~/bin/ccdef.awk '.g:gspbbase.'/PrjMngt/rules_PrjMngt/cc_rule.mk > '.Temp2
"	exe 'e '.Temp2
"	let lines=getline(0,line("$"))
"	for i in lines
""		echo i
"		let l:flags = l:flags.' -D'.i
"	endfor
"	exe 'e '.@#
"	let l:cmd = '!unifdef '.l:flags.' '.a:fname.' > '.TempFile
"	"echo l:cmd
"	exe l:cmd
"	exe 'diffsplit ' . TempFile
"			
"endfunction
"
"function! CFDiff() 
"	exe 'diffsplit CF/'.substitute(expand("%:t"),"c$","cf",'')
"endfunction
"
"nnoremap <leader>cfd :let g:ccflags += [' -D<C-r><C-w>']
"nnoremap <leader>cfu :let g:ccflags += [' -U<C-r><C-w>']
"nnoremap <leader>cd :call CFDiff()<CR>
nnoremap <leader>ctd :ctpdif
nnoremap <leader>el :e *<C-R><C-W>*pstack<CR>
nnoremap <leader>cq :!cqr <C-R><C-W><CR>
nnoremap <leader>csk :colorscheme koehler<CR>
