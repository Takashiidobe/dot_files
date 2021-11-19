#!/usr/bin/env bash

sudo -v
# Ask for Administrator Privileges

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###################################################
###################################################
#################### FUNCTIONS ####################

# $1 -> Installation Command (Can be a function)
# $2 -> Program Name
install() {
  if test ! $(which $1); then
    echo "🚀 Installing [$1]!"
    $2
    if [[ $? -ne 0 ]]; then
      echo "❌ [$1] installation failed."
    else
      echo "✅ [$1] successfully installed!"
    fi
  else
    echo "✅ [$1] already installed."
  fi
}

# $1 -> Run a command.
run() {
  echo "🚀 Running [$1]!"
  $1
  if [[ $? -ne 0 ]]; then
    echo "❌ Error running command: [$1]."
  else
    echo "✅ [$1] successfully ran."
  fi
}

# $1 -> Information about command
# $2 -> Command to run
info() {
  echo "🚀 $1."
  $2
  if [[ $? -ne 0 ]]; then
    echo "❌ [$1] failed."
  else
    echo "✅ [$1] was successful."
  fi
}

####################################################
############ Xcode Command Line Tools ##############
####################################################

install_xcode_select() {
  yes "" | xcode-select --install
}

# Install command line tools
install "xcode-select" install_xcode_select

####################################################
##################### HOMEBREW #####################
####################################################

install_brew() {
  yes "" | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}

# Install Homebrew
install "brew" install_brew

# Granting Admin access to Homebrew directory
run "sudo chown -R $(whoami) /usr/local/*"

# Run brew doctor to make sure everything works fine.
run "brew doctor"

# Upgrade any already installed formula.
run "brew upgrade --all"

# Update homebrew
run "brew update"

# Update $PATH to use Homebrew
info "Updating ~/.bash_profile to link to homebrew" "$(echo 'PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile)"

# Setup dirs
mkdir -p ~/.local/share/nvim/plugged
mkdir -p ~/.config/{nvim,less,config,fish}
mkdir -p ~/.config/coc/extensions
mkdir -p ~/.cargo
mkdir -p ~/Library/Preferences/clangd 
mkdir -p ~/Library/Application\ Support/Code/User

# Install Homebrew Dependencies
install_brew_deps() {
  brew bundle --global
}

run install_brew_deps

## Setup fish
sudo echo /usr/local/bin/fish >> /etc/shells
chsh -s /usr/local/bin/fish

# Link Files
stow -v -R -t ~ .home 
stow -v -R -t ~/.config .config
stow -v -R -t /usr/local/bin bin
stow -v -R -t ~/Library Library
stow -v -R -t ~/.ssh .ssh 

# Install Python
run "pip3 install --upgrade setuptools"
run "pip3 install --upgrade pip"

install_pip_deps() {
  pip3 install -r ~/.Pipfile
}

run install_pip_deps

# Install Ruby
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

\curl -sSL https://get.rvm.io | bash

rvm install stable

# Install Nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
nvm install --lts

# Install Rust
install "rustup-init" "yes '1' | rustup-init"

# Initialize opam
run "yes | opam init"

install_opam_deps() {
  opam switch import ~/.opam-deps
}

info "installing opam dependencies" install_opam_deps

setup_gitignore() {
  git config --global core.excludesfile ~/.gitignore_global
}

info "setting up global gitignore file" setup_gitignore

# Install cargo deps
install_cargo_deps() {
  cargo install $(cat .cargo-deps)
}

info "installing cargo deps" install_cargo_deps

############### Install Vim Plug ##################
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Cleanup homebrew at end
run "brew cleanup"

source ~/.gitignore_global
source ~/.inputrc
source ~/.config/nvim/init.vim
source ~/.config/fish/config.fish

# Setup postgres start command
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
# Setup redis
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents

# start postgres
run "pg_start"

# create postgres accounts.
info "creating root account for Postgres" "createdb $(whoami)"
info "creating postgres user for Postgres" "createuser -s postgres"

# stop postgres
run "pg_stop"
