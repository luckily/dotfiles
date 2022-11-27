# dotfiles
The script of dotfiles will install homebrew, ohmyzsh and then link the dotfiles via symbolic link. **Only support MacOS.**


### Step 1: Xcode Command Line Tools
Verify that you've successfully installed Xcode Command Line Tools.
```sh
xcode-select -p
```

Install Xcode Command Line Tools, if you are not installed yet.
```sh
xcode-select --install
```

### Step 2: Download dotfiles from git repository
```sh
git clone https://github.com/luckily/dotfiles.git ~/.dotfiles
```

### Step 3: Install my dotfiles for the first time.
```sh
make debug

make install
```







