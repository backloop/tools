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
