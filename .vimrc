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

" perldoc as <K> over function name..
set keywordprg=perldoc\ -f

" Load file template
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.template

" Few handy hotkeys
map <F2> :Vexplore<CR>
map <F3> :set paste!<CR>
map <F7> :set spell!<CR>

" Custom file-type syntax higlighting
au BufNewFile,BufRead *.phtml set filetype=php
au BufNewFile,BufRead *.tt set filetype=html

" Perl Module Autocompletion
set iskeyword+=:
set completeopt=longest,menu,preview

" Open file to previous position
au BufWinLeave * mkview
au BufWinEnter * silent loadview

" Persistant Undo
set undodir=~/.vim/undo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Set color scheme
set t_Co=256
colorscheme desert

" Auto brackety quotes
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf
" END auto brackety quotes

" To make vimdiff slightly more tolerable..
highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black

