# prompt - green, prints previous exit status and current dir
export PS1="\[\e[0;32m\][\$(printf %3d \$?)][\w]$ \[\e[m\]"

# cds
alias work='cd ~/'


# git
alias gs='git status'
alias gac='git add . && git commit'
alias ga='git add .'
alias gc='git commit'
alias gp='git push -u'

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# tmux
alias tl='tmux ls'
alias ta='tmux attach -t'
alias tn='tmux new -s'

# other useful aliases
alias rubytags='ctags -R --languages=ruby --exclude=.git --exclude=vendor .'
alias be='bundle exec'

# thefuck
eval $(thefuck --alias)

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
alias rrepl="rustup run nightly-2016-08-01 ~/.cargo/bin/rusti"

# Git
source ~/.git-completion.bash

# fzf (use rg)
[ -f /usr/local/opt/fzf/.fzf.bash ] && source /usr/local/opt/fzf/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,vendor}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# fv - open file in vim
fv () {
  local file
  file=$(fzf +m -q "$1") && echo "vim $file" && vim "$file"
}

# cdf - cd into the directory of the selected file
cdf () {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# mkcd - make directory and cd into it
mkcd () {
  mkdir "$1"
  cd "$1"
}

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
