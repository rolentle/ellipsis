dotfiles = ./dotfiles

update_neovim:
	brew upgrade neovim-nightly

install_kitty:
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

install_oh_my_zsh:
	curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh

install_ruby_lsp:
	gem install --user-install solargraph

link_dotfiles: $(dotfiles)/*
	for file in $^; do \
		echo `basename $${file}`; \
	        rm -rf ~/.`basename $${file}` ;\
		ln -sF $(shell pwd)/$${file} ~/.`basename $${file}` ;\
	done

link_config:
	ln -s $(shell pwd)/config ~/.config
