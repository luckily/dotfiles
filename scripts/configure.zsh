#!/usr/bin/env zsh

# Initial settings
source $HOME/.dotfiles/configs/.exports
source $HOME/.dotfiles/configs/.functions

info "Start to link .zshrc"
backup $HOME/.zshrc
symlink $HOME/.dotfiles/configs/.zshrc $HOME/.zshrc

info "Start to link vscode settings & keybindings"
CODE_PATH=~/Library/Application\ Support/Code/User
for name in settings.json keybindings.json; do
  target="$CODE_PATH/$name"
  backup "$target"
  symlink "$HOME/.dotfiles/configs/.vscode/$name" "$target"
done

success "Configure successful."
success "🚀 Carry on with git setup. 🚀"

exec zsh
exit 0
