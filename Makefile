DOTFILES = $(PWD)

all:: zsh vim tmux git

zsh::
	@ln -snf $(DOTFILES)/.zshrc $(HOME)/.zshrc

vim::
	@mkdir -p $(HOME)/.vim/bundle
	@git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
	@ln -snf $(DOTFILES)/.vimrc $(HOME)/.vimrc

tmux:
	@ln -snf $(DOTFILES)/.tmux.conf ${HOME}/.tmux.conf

git:
	@ln -snf $(DOTFILES)/.gitconfig ${HOME}/.gitconfig
