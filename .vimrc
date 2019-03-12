" Tabbing and indentation
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" For syntax highlighting and keyboard-working-ness
syntax on
syntax enable
set bs=2
set hlsearch
set ruler

" UTF-8
set enc=utf-8
set encoding=utf-8

" Set perldoc / pman as <K> over function name..
au BufNewFile,BufRead *.php set keywordprg=pman
au BufNewFile,BufRead *.pl,*.pm set keywordprg=perldoc\ -f

" Load file template
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.template

" Few handy hotkeys
map <F2> :Ex<CR>
map <F3> :tabp<CR>
map <F4> :tabn<CR>
map <F5> :tabnew<CR>
map <F7> :set spell!<CR>
map <F8> :Vexplore<CR>
map <F9> :set paste!<CR>

" Custom file-type syntax higlighting
au BufNewFile,BufRead *.html set filetype=vue
au BufNewFile,BufRead *.phtml set filetype=php
au BufNewFile,BufRead *.tt set filetype=html
au BufNewFile,BufRead *.ejs set filetype=ejs
au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead *.pug set filetype=pug

" Perl Module Autocompletion
set iskeyword+=:
set completeopt=longest,menu,preview

" Open file to previous position
au BufWinLeave * mkview
au BufWinEnter * silent loadview

" Persistant Undo
"set undodir=~/.vim/undo
"set undofile
"set undolevels=1000 "maximum number of changes that can be undone
"set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Set color scheme
set t_Co=256
colorscheme desert
