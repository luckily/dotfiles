.PHONY: install debug bootstrap-install bootstrap-plugins install-homebrew-formulas configure reconfigure patch-install

install: bootstrap-install \
	bootstrap-plugins \
	install-homebrew-formulas \
	configure

debug:
	./scripts/debug.bash
	@echo "-----"
	./scripts/debug.zsh

bootstrap-install:
	./scripts/bootstrap-install.bash

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
