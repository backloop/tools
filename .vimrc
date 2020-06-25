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


