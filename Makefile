DOT_FILES = .zshrc .vimrc .tmux.conf

all: zsh vim tmux

zsh: $(foreach f, $(filter .zsh%, $(DOT_FILES)), link-dot-file-$(f))

vim:
	@if[ -d $(HOME)/.vim/bundle ] || mkdir -p $(HOME)/.vim/bundle
	@git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
	$(foreach f, $(filter .vim%, $(DOT_FILES)), link-dot-file-$(f))

tmux: $(foreach f, $(filter .tmux%, $(DOT_FILES)), link-dot-file-$(f))
  
.PHONY: clean
clean: $(foreach f, $(DOT_FILES), unlink-dot-file-$(f))

link-dot-file-%: %
	@echo "Create Symlink $< => $(HOME)/$<"
	@ln -snf $(CURDIR)/$< $(HOME)/$<

unlink-dot-file-%: %
	@echo "Remove Symlink $(HOME)/$<"
	@$(RM) $(HOME)/$<
