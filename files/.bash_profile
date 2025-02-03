#TODO: separate .bashrc and .bash_profile for more flexible use
# prompt - blue, prints previous exit status and current dir
export PS1="\[\e[36m\][\$(printf %3d \$?)][\w]$ \[\e[m\]"

# Use Neovim if installed
if command -v nvim >/dev/null 2>&1; then
  alias vim='nvim'
fi

# cds
alias work='cd ~/projects/magic-lpo'
alias proj='cd ~/projects'
alias notes='cd ~/notes'

# git
alias gs='git status'
alias gac='git add . && git commit'
alias ga='git add .'
alias gc='git commit'
alias gp='git push -u'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias fix='vim +/HEAD `git diff --name-only | uniq`'

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# tmux
alias tl='tmux ls'
alias ta='tmux attach -t'
alias tn='tmux new -s'

# replace ls with exa
alias ls='exa'

# other useful aliases
alias rubytags='ctags -R --languages=ruby --exclude=.git --exclude=vendor .'
alias be='bundle exec'
alias pg='ps aux | rg'
alias migrateboth='bundle exec rails db:migrate && bundle exec rails db:migrate RAILS_ENV=test'

# thefuck
eval $(thefuck --alias)

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
alias rrepl="rustup run nightly-2016-08-01 ~/.cargo/bin/rusti"

# Git completion
source ~/.git-completion.bash

# fzf (use rg)
[ -f /usr/local/opt/fzf/.fzf.bash ] && source /usr/local/opt/fzf/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,vendor}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# v - open file in vim
alias v='_fzf_vim'
_fzf_vim () {
  local file
  file=$(fzf +m -q "$1") && history -s "vim $file" && vim "$file"
}

# vv - open files in ~/.viminfo
alias vv='_fzf_vim_history'
_fzf_vim_history () {
  local files
  local cmd
  files=$(grep '^>' ~/.viminfo | cut -c3- |
    while read line; do
      [ -f "${line/\~/$HOME}" ] && echo "$line"
    done | fzf-tmux -d -m -q "$*" -1) && cmd="vim ${files//\~/$HOME}" && history -s "$cmd" && $cmd
}

# cdd - fuzzy cd
alias cdd='_fzf_cd'
_fzf_cd () {
   local dir
   dir=`fd --type d | fzf` && history -s "cd $dir" && cd "$dir"
}

# rg and open selected line with vim
alias rgg='_fzf_rg_vim'
_fzf_rg_vim () {
  if [ -z "$1" ]; then
    echo "Usage: rgg PATTERN"
    return 1
  fi
  result=`rg --line-number "$@" | fzf`
  file=`echo "$result" | awk -F ':' '{print $1}'`
  line=`echo "$result" | awk -F ':' '{print $2}'`
  if [ -n "$file" ]; then
    history -s "vim $file +$line"
    vim $file +$line
  fi
}

# fuzzy checkout branch with diff
alias gco='_fzf_git_co'
_fzf_git_co () {
  local branch
  branch=`git branch -a | tr -d " " | fzf --preview 'git log --color=always {}'`
  history -s git "checkout $branch" && git checkout "$branch"
}

# checkout recent branches
alias b='_fzf_git_recent_branch'
_fzf_git_recent_branch () {
  local branch
  branch=`git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/heads/ | fzf`
  history -s git "checkout $branch" && git checkout "$branch"
}

# cdm - make directory and cd into it
cdm () {
  mkdir -p "$1"
  cd "$1"
}

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# use mysql5.6
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# export path for nodebrew
export PATH=~/.nodebrew/current/bin:$PATH

# export path for stack (Haskell)
export PATH=~/.local/bin:$PATH

# export TERM to enable 256 colors (should I do it here?)
export TERM='xterm-256color'


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/andyharvath/google-cloud-sdk/path.bash.inc' ]; then . '/Users/andyharvath/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/andyharvath/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/andyharvath/google-cloud-sdk/completion.bash.inc'; fi
