stack-update () {
  brew update \
    && brew upgrade \
    && brew cleanup \
    && brew doctor \
    && brew bundle check \
    && brew bundle cleanup

  asdf update
  asdf plugin-update --all

  mas upgrade  
}