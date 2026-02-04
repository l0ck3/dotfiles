#!/bin/bash
set -e

REPO="git@github.com:l0ck3/dotfiles.git"

echo "==> Installing Homebrew..."
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # Add Homebrew to PATH for this session (Apple Silicon)
  if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
else
  echo "    Homebrew already installed"
fi

echo "==> Installing chezmoi..."
brew install chezmoi

echo "==> Applying dotfiles..."
chezmoi init --apply "$REPO"

echo "==> Installing Homebrew packages..."
if [[ -f "$HOME/Brewfile" ]]; then
  brew bundle install --file="$HOME/Brewfile"
else
  echo "    No Brewfile found, skipping"
fi

echo "==> Done! Restart your terminal to apply changes."
