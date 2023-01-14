#!/usr/bin/env zsh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Symlinks some files from the .dotfiles
rm -rf $HOME/.zshrc
for file in ".zshrc" \
  ".mackup.cfg" \
  ".mackup"; do
  ln -s $HOME/.dotfiles/$file $HOME/$file
done

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file $DOTFILES/Brewfile

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer laravel/valet

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Create a Sites directory
mkdir $HOME/Sites

# Create a Development directory
mkdir $HOME/Development

# Clone Github repositories
$DOTFILES/clone.sh


# Set macOS preferences - we will run this last because this will reload the shell
source $DOTFILES/.macos
