#!/usr/bin/env bash

# install cargo
# install homebrew
# install tmux, fd, 

brew install fzf && \
cargo install ripgrep

# set symlinks
for filename in ~/dotfiles/files/*; do
  ln -s "~/dotfiles/files/$filename" "~/$filename";
done

