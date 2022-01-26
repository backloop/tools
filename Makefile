# absolute dirpath to this file
path:=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: all
all:
	# Use with care. This will overwrite existing symlinks
	ln -sf $(path)/bash/.bash_aliases ~/.bash_aliases
	ln -sf $(path)/bash/.tmux.conf ~/.tmux.conf
	ln -sf $(path)/vim/.vimrc ~/.vimrc

	$(path)/vim/install.sh
