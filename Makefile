.PHONY: install bootstrap-basic bootstrap-devtools install-homebrew-formulas configure reconfigure patch-install cleanup debug-zsh debug-bash

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


patch-install:
	./scripts/patch/install-aws-tools


cleanup:
	rm -rf ../.sdkman ../.oh-my-zsh ../.zshrc.pre-oh-my-zsh ../.zshrc ../.bash_profile .bin .homebrew .sdkman


debug-zsh: SHELL:=/bin/zsh
debug-zsh:
	source $$HOME/.dotfiles/configs/.zshrc
	printenv


debug-bash: SHELL:=/bin/bash
debug-bash:
	source $$HOME/.dotfiles/configs/.bash_profile
	printenv



