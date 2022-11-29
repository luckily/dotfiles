SHELL=/bin/bash

BREW_PATH=$(shell which brew)
ZSH_PATH=$(shell which zsh)
OH_MY_ZSH_PATH=$(HOME)/.oh-my-zsh

.PHONY: install debug bootstrap install-homebrew-packages install-zsh-plugins configure reconfigure

install: bootstrap \
	install-homebrew-packages \
	install-zsh-plugins \
	configure

debug:
	@echo HOME_PATH: $(HOME)
	@echo BREW_PATH: $(BREW_PATH)
	@echo ZSH_PATH: $(ZSH_PATH)
	@echo OH_MY_ZSH_PATH: $(OH_MY_ZSH_PATH)

	@printf "\n"

	@if [[ -z "$(BREW_PATH)" ]]; then\
		echo No brew in this machine.;\
	else\
		echo The brew is in this path $(BREW_PATH);\
	fi;
	@if [[ -d $(OH_MY_ZSH_PATH) ]]; then\
		echo oh-my-zsh exists;\
	else\
		echo oh-my-zsh does not exists;\
	fi;

bootstrap:
	./scripts/bootstrap

install-homebrew-packages: bootstrap
	./scripts/install-homebrew-packages

install-zsh-plugins: install-homebrew-packages
	./scripts/install-zsh-plugins

configure: install-zsh-plugins
	./scripts/configure

reconfigure:
	./scripts/configure
