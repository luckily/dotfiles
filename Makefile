.PHONY: install bootstrap-basic bootstrap-devtools install-homebrew-formulas configure reconfigure cleanup debug-zsh debug-bash

install: bootstrap-basic \
	bootstrap-devtools \
	install-homebrew-formulas \
	configure


bootstrap-basic:
	./scripts/bootstrap-basic


bootstrap-devtools:
	./scripts/bootstrap-devtools


install-homebrew-formulas: bootstrap-devtools
	./scripts/install-homebrew-formulas


configure: install-homebrew-formulas
	./scripts/configure


reconfigure:
	./scripts/configure


cleanup:
	rm -rf ../.sdkman ../.oh-my-zsh ../.zshrc.pre-oh-my-zsh ../.zshrc ../.bash_profile .bin .homebrew .sdkman
	find $HOME -iname '.bash_profile.backup*' -or -iname '.zshrc.backup*' -maxdepth 1 | xargs rm


debug-zsh: SHELL:=/bin/zsh
debug-zsh:
	source $$HOME/.dotfiles/configs/.zshrc
	printenv


debug-bash: SHELL:=/bin/bash
debug-bash:
	source $$HOME/.dotfiles/configs/.bash_profile
	printenv



