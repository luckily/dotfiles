.PHONY: install debug bootstrap install-homebrew-formulas configure reconfigure patch-install

install: bootstrap \
	install-homebrew-formulas \
	configure

debug:
	SHELL=/bin/bash
	./scripts/debug.bash

	@echo "-----"

	SHELL=/bin/zsh
	./scripts/debug.zsh


bootstrap:
	SHELL=/bin/bash
	./scripts/bootstrap.bash

install-homebrew-formulas: bootstrap
	SHELL=/bin/zsh
	./scripts/install-homebrew-formulas.zsh

configure: install-homebrew-formulas
	SHELL=/bin/zsh
	./scripts/configure.zsh

reconfigure:
	./scripts/configure.zsh

patch-install:
	SHELL=/bin/zsh
	./scripts/patch/install-aws-tools.zsh
