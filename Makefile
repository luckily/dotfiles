SHELL=/bin/bash

USER=$(shell whoami | grep '^joel' -o)
BREW_PATH=$(shell which brew)
ZSH_PATH=$(shell which zsh)
OH_MY_ZSH_PATH=$(HOME)/.oh-my-zsh

.PHONY: install
install: bootstrap \
	install-homebrew-packages \
	install-zsh-plugins \
	configure

.PHONY: debug
debug:
	@echo User: $(USER)
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

.PHONY: bootstrap
init:
	./script/bootstrap

.PHONY: install-homebrew-packages
install-homebrew-packages:
	./script/install-homebrew-packages

.PHONY: install-zsh-plugins
install-zsh-plugins:
	./script/install-zsh-plugins

.PHONY: configure
configure:
	./script/configure


