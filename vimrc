set rtp+=~/.vim/bundle/Vundle.vim
filetype off    " required
if has_key(environ(),"VIRTUAL_ENV")
	let $PATH=substitute($PATH,join([$VIRTUAL_ENV,"bin:"],"/"),"","g")
endif
call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  Plugin 'vim-scripts/LargeFile'
  Plugin 'w0rp/ale'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'jmcantrell/vim-virtualenv'
  Plugin 'python-rope/ropevim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'chrisbra/NrrwRgn'
  Plugin 'preservim/tagbar'
  Plugin 'bling/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'luochen1990/rainbow'
  Plugin 'farseer90718/vim-taskwarrior'
  Plugin 'vimwiki/vimwiki'
  Plugin 'tbabej/taskwiki'
  Plugin 'vim-scripts/Align'
  Plugin 'vim-perl/vim-perl'
  Plugin 'Yggdroot/indentLine'
  Plugin 'honza/vim-snippets'
  Plugin 'sirver/ultisnips'
  Plugin 'mtikekar/vim-bsv'
  Plugin 'joereynolds/SQHell.vim'
  "Plugin 'lpinilla/vim-codepainter'
  "Plugin 'vim-latex/vim-latex'
  "Plugin 'HerringtonDarkholme/yats.vim'
  "Plugin 'Shougo/vimproc.vim'
  "Plugin 'Quramy/tsuquyomi'
  "Plugin 'scrooloose/syntastic'
  "Plugin 'leafgarland/typescript-vim'
  "Plugin 'jason0x43/vim-js-indent'
  "Plugin 'jahagirdar/Vimplate-Enhanced'
  "Plugin 'MarcWeber/vim-addon-mw-utils'
  "Plugin 'tomtom/tlib_vim'
  "Plugin 'garbas/vim-snipmate'
 "Plugin 'ervandew/supertab'
  "Plugin 'ledger/vim-ledger' 
  "Plugin 'kalafut/vim-taskjuggler'
  "Plugin 'nathangrigg/vim-beancount'
  "Plugin 'fatih/vim-go'
  "Plugin 'bling/vim-bufferline'
"  Bundle 'ervandew/supertab'
call vundle#end()            " required
set t_Co=256
"#set t_AB=^[[48;5;%dm
"#set t_AF=^[[38;5;%dm
filetype plugin indent on    " required
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

set laststatus=2
source $VIMRUNTIME/vimrc_example.vim
set wildignore+=*.bo,*.ba,*.obj,*.pdf,*~
set nu
nmap bu :buffers<cr>:b
  nmap <silent> <C-k> <Plug>(ale_previous)
  nmap <silent> <C-j> <Plug>(ale_next)
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
set hidden



" UltiSnips triggering
let g:UltiSnipsListSnippets="<tab>"
 let g:UltiSnipsExpandTrigger = '<C-j>'
 let g:UltiSnipsJumpForwardTrigger = '<C-j>'
 let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

let g:ale_linters ={
			\ 'perl':['perl','perlcritic','podchecker'],
			\ 'cpp' :['clang', 'clangcheck', 'clangtidy', 'cppcheck', 'g++'],
			\ 'tjp':['alex', 'languagetool', 'proselint', 'redpen', 'textlint', 'vale', 'writegood'],
			\ 'md':['alex', 'languagetool', 'proselint', 'redpen', 'textlint', 'vale', 'writegood'],
			\ 'bsv':['bsv'],
			\}
let g:ale_linter_aliases = {
			\ 'tjp': ['tjp', 'text']
			\ }

let g:ale_fixers = {
			\'cpp' : [
			\'clang-format'
			\],
			\'c' : [
			\'clang-format'
			\],
			\'python' : [
			\'autopep8'
			\],
			\'html':['tidy'],
			\'perl':['perltidy'],
			\'go':[
			\'gofmt', 'goimports'
			\],
			\'typescript':[
			\'tslint'
			\]
			\}

let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker','perlcritic']

let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2 
"setglobal spell spelllang=en_us

colorscheme elflord

"""""""""
" Vim-Snippets setting. TODO Change this
"""""""""
let g:snips_author = 'Vijayvithal Jahagirdar'
let g:snips_email = 'jvs@dyumnin.com'

"""""""""""""""""
" RAinbow brackets
" """""""""""""""
let g:rainbow_active = 1
	let g:rainbow_conf = {
		\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
		\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
		\	'operators': '_,_',
		\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
		\	'separately': {
		\		'*': {},
		\		'tex': {
		\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
		\		},
		\		'lisp': {
		\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
		\		},
		\		'vim': {
		\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
		\		},
		\		'html': {
		\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
		\		},
		\		'css': 0,
		\	}
		\}

	"
	let g:vimwiki_markdown_list_ext = 1
	let g:taskwiki_markup_syntax= 'markdown'
	let g:markdown_folding =1

" Using a different diff program
set diffexpr=DiffW()
function DiffW()
  let opt = ""
   if &diffopt =~ "icase"
     let opt = opt . "-i "
   endif
   if &diffopt =~ "iwhite"
     let opt = opt . "-w " " swapped vim's -b with -w
   endif
   silent execute "!diff -a --binary " . opt .
     \ v:fname_in . " " . v:fname_new .  " > " . v:fname_out
endfunction
map ,af :ALEFix<CR>
set mouse=

" Enable spell checking
autocmd FileType latex, tex,mail, html, vimwiki, tt, text,markdown setlocal spell


"highlight BlankLine cterm=underline,bold
highlight BlankLine ctermbg=NONE ctermfg=NONE cterm=underline,bold
match  BlankLine /^\s*\n.*/
au BufNewFile,BufRead Jenkinsfile setf groovy
set modeline
