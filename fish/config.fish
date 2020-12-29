
#  git系
alias gg='git grep'
alias gsts='git status'
alias gco='git checkout'
alias gbd=gbd
alias gc='git commit -m'
alias gca='git commit --amend'
alias gfm=gfm
#  rails系
alias be='bundle exec'
alias bers='bin/rails s -b 0.0.0.0'
alias berc='bin/rails c'
alias precom=precom
alias berr='bin/rails routes > routes.txt'
alias bem=bem
alias bert=bert
alias berubo='git diff --name-only origin/HEAD | xargs bundle exec rubocop -P'
alias berubo_a='git diff --name-only origin/HEAD | xargs bundle exec rubocop -a'
# そのた
alias vs='code'
alias vsi='code-insiders'
# ls color
alias ls='ls -G'

# functions
function bem
  bin/rails db:migrate
  env RAILS_ENV=test bin/rails db:migrate
end

function bert
  git diff HEAD~$argv --name-only spec/ | xargs bundle exec rspec
end

function gbd
  git branch | grep $argv | xargs git branch -d
end

function allgrep
  grep -rnw $argv[2] -e $argv[1]
end

function precom
  env RAILS_ENV=production bin/rails assets:clobber
  env RAILS_ENV=production bin/rails assets:precompile
end

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

set fish_greeting
rvm default
