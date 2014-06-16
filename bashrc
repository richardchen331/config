export EDITOR='pico -w'
export GREP_COLOR="1;31"
source ${HOME}/workspace/science/ads/scripts/bash_aliases.sh

alias ls="ls -F"
alias l="ls -l"
# alias gvim="/Applications/MacVim.app/Contents/MacOS/Vim -g"
# alias v="/Applications/MacVim.app/Contents/MacOS/Vim -gM"
alias v="vim -M"
alias s="scala"
alias sc="scalac"

alias s="cd /Users/rchen/workspace/science"
alias s2="cd /Users/rchen/workspace/science_clone"
alias src="cd /Users/rchen/workspace/science/src/scala/com/twitter/ads/review"
alias ars="cd /Users/rchen/workspace/science/ads/review"
alias exp="cd /Users/rchen/workspace/science/src/scala/com/twitter/ads/batch/experimental/rchen"
alias test="cd /Users/rchen/workspace/science/tests/scala/com/twitter/ads/review"
alias st="cd /Users/rchen/scala_test"

alias adsnest1="ssh adsnest1.smf1.twitter.com"
alias adsnest2="ssh adsnest2.smf1.twitter.com"
alias adsnest3="ssh adsnest3.smf1.twitter.com"
alias adsnest4="ssh adsnest4.smf1.twitter.com"
alias nest1="ssh nest1.twitter.biz"

# MacOS ctags setup after homebrew
alias ctags="`brew --prefix`/bin/ctags"

# make_review config
export JIRA_GROUP=revsmb
export REVIEWBOARD_GROUP=revenue-smb

# make scalding local mode work
export JAVA_LIBRARY_PATH=$JAVA_LIBRARY_PATH:/opt/local/lib/

export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

