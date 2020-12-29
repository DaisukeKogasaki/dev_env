source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

# Ctrl + Sで入力を受け付けなくする機能を無効化
stty stop undef

function bem(){
  bundle exec rake db:migrate
  bundle exec rake db:migrate RAILS_ENV=test
}

function bert(){
  git diff HEAD~$1 --name-only spec/ | xargs bundle exec rspec
}

function bezt(){
  git diff HEAD~$1 --name-only spec/ | xargs bundle exec zeus test
}

function gifm() {
  git fetch -p
}

function gbd() {
  git branch | grep $1 | xargs git branch -d
}

function allgrep() {
  grep -rnw $2 -e $1
}

function berubo() {
  git diff --name-only origin/HEAD | xargs bundle exec rubocop -P
}

function berubo_a() {
  git diff --name-only origin/HEAD | xargs bundle exec rubocop -a
}

function precom(){
  bundle exec rake assets:clobber RAILS_ENV=production
  bundle exec rake assets:precompile RAILS_ENV=production
}

function git_comment_prefix {
  echo `git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' | sed -e 's/ticket\//#/g'`
}

function git_merge_prefix {
  echo `git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
}

function gcp {
  git commit -m "$1(`git_comment_prefix`)"
}

function gfm {
  git fetch -p
  git merge origin/`git_merge_prefix`
}
#  git系
alias gg='git grep'
alias gsts='git status'
alias gco='git checkout'
alias gifm=gifm
alias glog='git log --pretty=oneline | head -20 | tac | sed -e "s|\([a-z0-9]*\) \(.*\)|* [\1/${PWD##*/}]\n * \`\2\`\n|"'
alias gbd=gbd
alias gc='git commit -m'
alias gca='git commit --amend'
alias gcp=gcp
alias gfm=gfm
#  rails系
alias bez='bundle exec zeus'
alias be='bundle exec'
alias beu='bundle exec unicorn_rails -c config/unicorn.rb'
alias bers='bundle exec rails s -b 0.0.0.0'
alias berc='bundle exec rails c'
alias bezs='bundle exec zeus s'
alias bezc='bundle exec zeus c'
alias bezr='bundle exec zeus test'
alias bef='bundle exec fluentd -c fluent/local_fluent.conf'
alias precom=precom
alias preset='bundle exec rake assets:clobber RAILS_ENV=production'
alias bep='RAILS_ENV=production vendor/rset/bin/bundle exec rails server'
alias berr='bundle exec rake routes > routes.txt && vim routes.txt'
alias bem=bem
alias bert=bert
alias bezt=bezt
alias berubo='git diff --name-only origin/HEAD | xargs bundle exec rubocop -P'
alias berubo_a='git diff --name-only origin/HEAD | xargs bundle exec rubocop -a'
# そのた
alias ipc='ip address | grep inet'
alias vs='code'
alias vsi='code-insiders'

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}
function promps {
    local  BLUE="\[\e[0;34m\]"
    local  RED="\[\e[0;31m\]"
    local  GREEN="\[\e[0;32m\]"
    local  WHITE="\[\e[00m\]"
    local  GRAY="\[\e[0;37m\]"
    local  Mag="\[\e[0;35m\]"
    local  LIGHT_B="\[\e[0;34m\]"
    local  LIGHT_GREEN="\[\e[0;36m\]"
    case $TERM in
        xterm*) TITLEBAR='\[\e]0;\W\007\]';;
        *)      TITLEBAR="";;
    esac
    local BASE="\u@\h"

     # PS1="[\$(date +%H:%M:%S)] ${LIGHT_GREEN}\u${WHITE}@${GREEN}\W:${LIGHT_GREEN}\$(parse_git_branch)${Mag}\$${WHITE}"
     PS1="[\$(date +%H:%M:%S)] ${TITLEBAR}${GREEN}\u:${BLUE}\W${GREEN}\$(parse_git_branch)${BLUE}\$${WHITE} "
}
promps


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
