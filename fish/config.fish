# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
#  git系
alias gg='git grep -I'
alias gsts='git status'
alias gco='git checkout'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gfm=gfm
#  rails系
alias be='bundle exec'
alias bers='bin/rails s -b 0.0.0.0'
alias berc='bin/rails c'
alias bep='bin/rails server -b 0.0.0.0 -e production'
# そのた
alias ipc='ip address | grep inet'
alias vs='code'
alias vsi='code-insiders'

function gfm
  git fetch -p
  git merge origin/(git_merge_prefix)
end

function git_merge_prefix
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
end

function parse_git_branch
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
end

set -x fish_greeting
