dotfiles = ./dotfiles
install_kitty:
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

install_oh_my_zsh:
	curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh

link_dotfiles: $(dotfiles)/.[!.]*
	for file in $^; do \
		echo `basename $${file}`; \
	        rm -rf ~/`basename $${file}` ;\
		ln -s $(shell pwd)/$${file} ~/`basename $${file}` ;\
	done
