"
" NATIVE VIM CONFIGURATION
"

" https://superuser.com/questions/132029/how-do-you-reload-your-vimrc-file-without-restarting-vim
":so $MYVIMRC
":source $MYVIMRC

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

" press F8 to toggle whitespace visalization
set nolist
function! ShowHiddenToggle()
    if &list
        set nolist
    else
        " visually show tabs
        set list lcs=tab:\|->
        " visually show spaces
        set list lcs+=space:·
    endif
endfunction
nmap <F8> mz:execute ShowHiddenToggle()<CR>'z

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


