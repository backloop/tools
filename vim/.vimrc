"
" NATIVE VIM CONFIGURATION
"

" https://superuser.com/questions/132029/how-do-you-reload-your-vimrc-file-without-restarting-vim
":so $MYVIMRC
":source $MYVIMRC

" VIM resources
" https://devhints.io/vimscript
" https://learnvimscriptthehardway.stevelosh.com

" load default configuration
source $VIMRUNTIME/defaults.vim

" SECURITY
" For ViM < 8.1.1365
" CVE-2019-12735: Modelines allow arbitrary code execution
" https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
set modelines=0
set nomodeline

" show current active key combo in lower right corner
set showcmd

" better indentation on <enter> and in C code
set autoindent
set smartindent
"
"https://vim.fandom.com/wiki/Toggle_between_tabs_and_spaces
" When in NORMAL mode press F9 to switch tab format
let my_tab=4
execute "set shiftwidth=".my_tab
execute "set softtabstop=".my_tab
set expandtab
function! TabToggle()
  if &expandtab
    set shiftwidth=8
    set softtabstop=0
    set noexpandtab
  else
    execute "set shiftwidth=".g:my_tab
    execute "set softtabstop=".g:my_tab
    set expandtab
  endif
endfunction
nmap <F9> mz:execute TabToggle()<CR>'z

" press F8 to toggle whitespace visualization
set nolist
function! ShowWhitespaceToggle()
    if &list
        set nolist
    else
        " visually show tabs
        set list lcs=tab:\|->
        " visually show spaces
        set list lcs+=space:·
    endif
endfunction
nmap <F8> mz:execute ShowWhitespaceToggle()<CR>'z

" press F7 to toggle line number visualization
set number
set relativenumber
function! ShowLineNumberToggle()
    " &<variable> turns the check into a boolean operation [0,1]
    if &number
        set nonumber
        set norelativenumber
    else
        set number
        set relativenumber
    endif
endfunction
nmap <F7> mz:execute ShowLineNumberToggle()<CR>'z

" easier buffer navigation
set hidden
nnoremap <C-S-Right> :bnext<CR>
nnoremap <C-S-Left> :bprev<CR>

" Easier split navigation
" Instead of ctrl-w then j, it’s just ctrl-j:
nnoremap <C-S-J> <C-W><C-J>
nnoremap <C-S-K> <C-W><C-K>
nnoremap <C-S-L> <C-W><C-L>
nnoremap <C-S-H> <C-W><C-H>

" easier quickfix navigation
nnoremap <C-Up> :cp<CR>
nnoremap <C-Down> :cn<CR>

" Closing a split
" :close
" :q

" Open new split panes to right and bottom,
" which feels more natural than Vim’s default:
set splitbelow
set splitright

" Highlight search results
set hlsearch
" :noh or :nohl - will turn off highligt until next search

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"
" VIM PLUGIN CONGIFURATION
"

" colorscheme
colorscheme codedark
" adjust colorscheme for highlight of search results
hi IncSearch ctermfg=Red
hi IncSearch ctermbg=Yellow
hi Search    ctermfg=Black
hi Search    ctermbg=LightYellow

" vim-numbertoggle


" vim-airline
"let g:airline_theme='dark'
"let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#tabline#enabled = 1


" CtrlP
"nnoremap <C-F> :CtrlPMixed<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

" GLOBAL Gtags
" Get the tags from under the current cursor location
map <C-\> :GtagsCursor<CR>
" Gtags also uses the quickfix window navigation maps above

" vim-fugitive
" :Gblame gets commit hashes in different colors together with CSApprox
" plugin
" Apparently only CSApprox is needed on my system.
"let g:fugitive_dynamic_colors = 1


" TODO:
" GtagsCursor should not open first result by default and mess with the open
" buffer list, test:
" https://github.com/ronakg/quickr-cscope.vim
