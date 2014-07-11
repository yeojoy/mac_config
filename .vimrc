syntax enable
colorscheme kolor
set encoding=utf-8
set t_Co=256

" 편집기능 설정
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set backspace=indent,eol,start
set ru
set sc
set nu
"set nuw=5
"set backspace=2
set autoindent
"set nowrap
"set noet
"set sts=0
"set magic
set title
"set linespace=100
set paste

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType c      set omnifunc=ccomplete#Complete
autocmd FileType css    set omnifunc=csscomplete#CompleteCSS
autocmd FileType html   set omnifunc=htmlcomplete#CompleteTags
autocmd FileType php    set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType ruby   set omnifunc=rubycomplete#Complete
autocmd FileType sql    set omnifunc=sqlcomplete#Complete
autocmd FileType xml    set omnifunc=xmlcomplete#CompleteTags

" 검색어 기능설정
set hls
set ic

" css3
au BufRead,BufNewFile *.css set ft=css syntax=css3

" coffee
filetype off

" call pathogen#runtime_append_all_bundles()
filetype plugin indent on
filetype on
autocmd BufWritePost *.coffee silent CoffeeMake!

" dart
au BufRead,BufNewFile *.dart set ft=dart syntax=dart

" stylus
autocmd BufNewFile,BufRead *.styl set filetype=stylus
au BufRead,BufNewFile *.styl set syntax=stylus
autocmd BufWritePost *.styl :silent !stylus <afile>

" jade
autocmd BufNewFile,BufRead *.jade set filetype=jade
au BufRead,BufNewFile *.jade set syntax=jade
autocmd BufWritePost *.jade :!jade <afile>

" 단축키설정
" alt: <Char-27>
imap <Char-27><space> <C-x><C-o>
map <Char-27>c :q<CR>
let g:netrw_browse_split=0
map <Char-27>e :Ex<CR>
map <Char-27>v :Ve<CR>
map <Char-27>s :He<CR>
map <Char-27>t :Te<CR>
map <Del> x
map <C-a> :w<CR>
imap <C-a> <ESC>:w<CR>
map <C-j> yyp
map ^c :q<CR>

" 탐색기 열기
map <F2> :20vs ./<CR>

" 주석달기
map <F3> :tabnew<CR>

" 창 최대화
map <F7> :only<CR>

" 이전 파일
map <F8> ^6

" taglist
map <F9> :TlistToggle<CR>

" nerdtree toggle
map <F10> :NERDTreeToggle<CR>

" tab
map <Char-27>j :tabp<CR>
map <Char-27>k :tabn<CR>
map <Tab> >>
vmap <Tab> >gv
vmap <S-Tab> <gv

" 방향키
" 창 이동
map <Char-27><Up> <C-w>k
map <Char-27><Down> <C-w>j
map <Char-27><Left> <C-w>h
map <Char-27><Right> <C-w>l
