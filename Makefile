.PHONY: install debug bootstrap-basic bootstrap-plugins install-homebrew-formulas configure reconfigure patch-install cleanup

install: bootstrap-basic \
	bootstrap-plugins \
	install-homebrew-formulas \
	configure

debug:
	./scripts/debug.bash
	@echo "-----"
	./scripts/debug.zsh

bootstrap-basic:
	./scripts/bootstrap-basic.bash

bootstrap-plugins:
	./scripts/bootstrap-plugins.zsh

install-homebrew-formulas: bootstrap-plugins
	./scripts/install-homebrew-formulas.zsh

configure: install-homebrew-formulas
	./scripts/configure.zsh

reconfigure:
	./scripts/configure.zsh

patch-install:
	./scripts/patch/install-aws-tools.zsh

cleanup:
	rm -rf ../.sdkman ../.oh-my-zsh ../.zshrc.pre-oh-my-zsh ../.zshrc ../.bash_profile .bin .homebrew
