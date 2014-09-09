DOT_FILES = .zshrc .vimrc .vim .tmux.conf .gitconfig .gitignore-global .gemrc

all: zsh vim tmux git gem

zsh::
	@ln -snf $(DOTFILES)/.zshrc $(HOME)/.zshrc

vim: $(foreach f, $(filter .vim%, $(DOT_FILES)), link-dot-file-$(f))

tmux: $(foreach f, $(filter .tmux%, $(DOT_FILES)), link-dot-file-$(f))

git: $(foreach f, $(filter .git%, $(DOT_FILES)), link-dot-file-$(f))

gem: $(foreach f, $(filter .gem%, $(DOT_FILES)), link-dot-file-$(f))

.PHONY: clean
clean: $(foreach f, $(DOT_FILES), unlink-dot-file-$(f))


link-dot-file-%: %
	@echo "Create Symlink $< => $(HOME)/$<"
	@ln -snf $(CURDIR)/$< $(HOME)/$<

unlink-dot-file-%: %
	@echo "Remove Symlink $(HOME)/$<"
	@$(RM) $(HOME)/$<
