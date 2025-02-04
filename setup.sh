#!/usr/bin/env bash

# configuratble work directory
echo "Enter your work directory (default: $HOME/projects/):"
read -r WORK_DIR
WORK_DIR=${WORK_DIR:-"$HOME/projects/"}

# Ensure the directory exists
if [[ ! -d "$WORK_DIR" ]]; then
  echo "Warning: Directory does not exist. Creating it now..."
  mkdir -p "$WORK_DIR"
fi

# Create both .bash_profile.local and .zprofile.local using the function
create_profile_file() {
  local profile_file="$1"

  if [[ ! -f "$profile_file" ]]; then
    echo "# CAUTION: This file is not checked into the repo" > "$profile_file"
  fi

  echo "alias work='cd \"$WORK_DIR\"'" >> "$profile_file"
}

create_profile_file "bash/dot-bash_profile.local"
create_profile_file "zsh/dot-zprofile.local"

echo "Your work directory has been set to: $WORK_DIR"
echo "You can edit it later in $ZPROFILE_LOCAL"

# Stow all dotfiles
stow --dotfiles bash git nvim vim tmux zsh

if [[ $? -eq 0 ]]; then
  echo "Dotfiles installed successfully"
fi
