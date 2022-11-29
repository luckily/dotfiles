#!/usr/bin/env bash

# Initial settings
source $HOME/.dotfiles/configs/.bash_profile


# For some manually install tools need to install in `.bin` folder.
mkdir $HOME/.dotfiles/.bin

info "Start to Symlink .bash_profile"
ln -sf $HOME/.dotfiles/configs/.bash_profile $HOME/.bash_profile


# Install homebrew without sudo.
# @see https://docs.brew.sh/Installation
if [[ -z $(command -v brew) ]];then
    info "Start to install Homebrew"

    mkdir -p $DOTFILES_PATH/.homebrew && \
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $DOTFILES_PATH/.homebrew && \
    chmod +x $DOTFILES_PATH/.homebrew/bin/brew && \
    success "Install Homebrew successful."
fi


if [[ -z $(command -v brew) ]];then
    fail "Homebrew install failed."
fi


# Install zsh
[[ -z $(command -v zsh) ]] && \
    info "Start to install zsh" && \
    brew install zsh && \
    success "Install zsh successful."


# Start to use zsh
command -v zsh > /dev/null 2>&1 # Check if brew not working
if [ $? != 0 ];then
    fail "zsh failed."
fi

success "Bootstrap install successful."
exit 0
