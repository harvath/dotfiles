#TODO: separate .bashrc and .bash_profile for more flexible use
# prompt - blue, prints previous exit status and current dir
# cds
alias work='cd ~/projects/stamps'
alias proj='cd ~/projects'

# git
alias gs='git status'
alias gac='git add . && git commit'
alias ga='git add .'
alias gc='git commit'
alias gp='git push -u'
alias fix='vim +/HEAD `git diff --name-only | uniq`'

# tmux
alias tl='tmux ls'
alias ta='tmux attach -t'
alias tn='tmux new -s'

# replace ls with exa
alias ls='exa'

# other useful aliases
alias rubytags='ctags -R --languages=ruby --exclude=.git --exclude=vendor .'
alias be='bundle exec'
alias de='docker-compose exec app bundle exec'

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# v - open file in vim
alias v='_fzf_vim'
_fzf_vim () {
  vim $(fzf +m -q "$1")
}

# vv - open files in ~/.viminfo
alias vv='_fzf_vim_history'
_fzf_vim_history () {
  local files
  files=$(grep '^>' ~/.viminfo | cut -c3- |
    while read line; do
      [ -f "${line/\~/$HOME}" ] && echo "$line"
    done | fzf-tmux -d -m -q "$*" -1) && vim ${files//\~/$HOME}
}

# cdd - fuzzy cd
alias cdd='_fzf_cd'
_fzf_cd () {
   cd `fd --type d | fzf`
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
    vim $file +$line
  fi
}

# fuzzy checkout branch with diff
alias gco='_fzf_git_co'
_fzf_git_co () {
  local branch
  branch=`git branch -a | tr -d " " | fzf --preview 'git log --color=always {}'`
  git checkout "$branch"
}

# checkout recent branches
alias b='_fzf_git_recent_branch'
_fzf_git_recent_branch () {
  local branch
  branch=`git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/heads/ | fzf`
  git checkout "$branch"
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

