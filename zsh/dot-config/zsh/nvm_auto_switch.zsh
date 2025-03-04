autoload -U add-zsh-hook

load_node_version() {
  local node_version_file=".node-version"
  if [[ -f $node_version_file && -r $node_version_file ]]; then
    local node_version=$(<"$node_version_file")

    # Check if the Node.js version is installed
    if [[ -z "$(nvm ls "$node_version" | grep -o "$node_version")" ]]; then
      echo "⚠️  Node.js version $node_version (from .node-version) is not installed."
      echo "⚠️  Run: nvm install $node_version"
      return
    fi

    # Use the Node.js version if it's different from the current one
    if [[ "$(nvm current)" != "v$node_version" ]]; then
      nvm use "$node_version" > /dev/null
    fi
  fi
}

add-zsh-hook chpwd load_node_version
load_node_version

