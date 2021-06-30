dotfiles = ./dotfiles

install_homebrew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

update_neovim:
	brew upgrade neovim-nightly

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
	ln -sF $(shell pwd)/config ~/.config

link_hammerspoon:
	ln -sF $(shell pwd)/.hammerspoon ~/.hammerspoon
