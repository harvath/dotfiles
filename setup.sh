#!/usr/bin/env bash

# Stow all dotfiles
stow --dotfiles bash git nvim vim tmux zsh

if [[ $? -eq 0 ]]; then
  echo "Dotfiles installed successfully"
fi
