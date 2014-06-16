filetype on
filetype plugin indent on

set tabstop=4 
set shiftwidth=4

" options for scala files
autocmd Filetype scala setlocal expandtab tabstop=2 shiftwidth=2

" options for ruby files
autocmd Filetype ruby setlocal expandtab tabstop=2 shiftwidth=2

" options for python files
autocmd Filetype python setlocal expandtab tabstop=2 shiftwidth=2

" line wrap at 100 characters
set textwidth=100
set wrap

" if you want to turn on displaying special characters, use :set list
set listchars=eol:$,tab:>-,trail:~
set nolist

set incsearch                     "incremental searching
set hlsearch                      "highlight search
set ignorecase                    "ignore case when searching
set smartcase                     "ignore case when typing lowercase, otherwise match case
set showmatch                     "show matching parenthesis

" set lines=50 columns=150          "initial window size

set history=1000                   "command history
set undolevels=1000				  "undo buffer

set number                        "line numbering
set ruler                         "show current position

set scrolloff=4                   "keep 4 lines of code before & after the cursor

syntax enable
let g:solarized_termcolors=16
set background=dark
colorscheme solarized
" if use vimdiff:
" 1.diable syntax highlighting
" 2.switch to light scheme
" 2.use autocmd to load self-tuned 'vimdiff' iTerm2 profile, color:
" - Green: (197,255,196), Yellow: (253,254,188), Red: (255,197,206)
" 3.use autocmd to load back Default iTerm2 profile
if &diff
      syntax off
      set background=light
      autocmd VimEnter *.* :exec 'silent :!echo -e "\033]50;SetProfile=vimdiff\a"' | :exec 'redraw!'
      autocmd VimLeave *.* :!echo -e "\033]50;SetProfile=Default\a"
endif

highlight DiffAdd cterm=NONE ctermfg=Black ctermbg=Green gui=NONE guifg=bg guibg=Green
highlight DiffChange cterm=NONE ctermfg=Black ctermbg=Yellow gui=NONE guifg=bg guibg=Yellow
highlight DiffText cterm=NONE ctermfg=Black ctermbg=Magenta gui=NONE guifg=bg guibg=Magenta
highlight DiffDelete cterm=NONE ctermfg=Black ctermbg=Red gui=NONE guifg=bg guibg=Red

" Copy to clipboard, this command key mapping only works in MacVim (not working for vim)
" i commented out this as it now works without MacVim (probably due to iTerm2)
" map <D-c> :%w !pbcopy
" Clear highlighted search
nmap <silent> ,/ :nohlsearch<CR>
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" key mapping for toggle paste mode
nnoremap <C-x> :set invpaste paste?<CR>
set pastetoggle=<C-x>
set showmode

" change the mapleader from \ to ,
let mapleader=","

" enable neocomplcache
let g:neocomplcache_enable_at_startup = 1
" Tab completion (after pressing Ctrl+N to pop up window)
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" ctags setup
set tags=tags;/

" remove trailing whitespaces
autocmd BufWritePre *.scala :%s/\s+$//e

" vim pathogen
execute pathogen#infect()

" automatically opens the quickfix window after :Ggrep
autocmd QuickFixCmdPost *grep* cwindow

" easy navigation in quickfix window. note that b is entered by Ctrl+v,
" Alt+UpArrow
nmap [1;2A :cp<CR>
nmap [1;2B :cn<CR>
nmap b :cpf<CR>
nmap f :cnf<CR>

" enable mouse use in all mode
" works with tabs, NERDTree as well
set mouse=a
" set this to the name of your terminal that support mouse codes
set ttymouse=xterm2
" send more characters for redraws
set ttyfast
" map <Ctrl-A> to <F12> which is used by toggle-mouse plugin to switch mouse focus between vim and
" terminal
nmap <C-a> <F12>
