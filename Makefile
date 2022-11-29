.PHONY: install debug bootstrap install-homebrew-formulas configure reconfigure patch-install

install: bootstrap \
	install-homebrew-formulas \
	configure

debug:
	./scripts/debug.bash
	@echo "-----"
	./scripts/debug.zsh

bootstrap:
	./scripts/bootstrap.bash

install-homebrew-formulas: bootstrap
	./scripts/install-homebrew-formulas.zsh

configure: install-homebrew-formulas
	./scripts/configure.zsh

reconfigure:
	./scripts/configure.zsh

patch-install:
	./scripts/patch/install-aws-tools.zsh
