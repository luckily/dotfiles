#!/usr/bin/env zsh
# [[ -e $HOME/.dotfiles/configs/.exports ]] && emulate sh -c "$HOME/.dotfiles/configs/.exports"
# [[ -e $HOME/.dotfiles/configs/.functions ]] && emulate sh -c "$HOME/.dotfiles/configs/.functions"
# source $HOME/.dotfiles/configs/.exports
# source $HOME/.dotfiles/configs/.functions
source $HOME/.dotfiles/configs/.zshrc

# Install oh-my-zsh.
# @see https://ohmyz.sh/#install
[[ ! -d $HOME/.oh-my-zsh ]] && \
    info "Start to install zsh" && \
    curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash && \
    success "Install oh-my-zsh successful."


info "Start to install zsh-plugins."
# zsh-completions
# @see https://github.com/zsh-users/zsh-completions#oh-my-zsh
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

# zsh-autosuggestions
# @see https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
# @see https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# spaceship theme
# @see https://spaceship-prompt.sh/getting-started/#installing
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
success "Install zsh-plugins successful."


# Install the version management that manage multiple runtime versions with a single CLI tool
# @see https://asdf-vm.com/guide/getting-started.html#_2-download-asdf
[[ -z $(command -v asdf) ]] && \
    info "Start to install asdf." && \
    brew install asdf && \
    echo "source $HOME/.dotfiles/.homebrew/opt/asdf/libexec/asdf/sh" >> "$HOME/.dotfiles/configs/.zshrc" && \
    success "Install asdf successful."


# Install sdkman(java version management).
# @see https://sdkman.io/install
[[ -z $(command -v sdk) ]] && \
    info "Start to install sdkman." && \
    curl -s "https://get.sdkman.io" | zsh && \
    echo "source $HOME/.sdkman/bin/sdkman-init.sh" >> "$HOME/.dotfiles/configs/.zshrc" && \
    success "Install sdkman successful."

source $HOME/.dotfiles/configs/.zshrc

success "Bootstrap plugins successful."
exit 0
