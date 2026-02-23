# tools
Assorted tools for development in the console

### Suggested repository setup
Cloning this repository to the same location will enable the examples below to work out of the box.
```
$ mkdir -p ~/git
$ cd ~/git
$ git clone https://github.com/backloop/tools.git
```

## vim 
VIM configuration (.vimrc) and native VIM plugin management

### vim setup
```
$ ln -s ~/git/tools/vim/.vimrc ~/.vimrc
$ ~/git/tools/vim/install.sh
```

### Add plugins
```
$ vi ~/git/tools/vim/install.sh
```

### Upgrade plugins
```
$ ~/git/tools/vim/install.sh
```

## bash
Mixed bag of goodies for CLI tasks
```
$ ln -s ~/git/tools/bash/.bash_aliases ~/.bash_aliases
```
Add to ~/.bashrc
```
if [ -f ~/git/tools/bash/.bash_extras ]; then
    . ~/git/tools/bash/.bash_extras
fi

## tmux
```
$ ln -s ~/git/tools/tmux/.tmux.conf ~/.tmux.conf
```
