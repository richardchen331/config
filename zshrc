# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="richardchen"
#ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git zsh-syntax-highlighting)
# gitfast allow zsh to display git status in zsh prompt with "oh-my-zsh.hide-status 1" set in repo's
# gitconfig (in large repo, without "oh-my-zsh.hide-status 1", zsh is very slow because the zsh
# prompt is running some git commands that are slow (e.g. git status))
plugins=(gitfast zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/Users/rchen/.rbenv/shims:/opt/twitter/nvm/v0.8.8/bin:/opt/twitter/rvm/gems/ree-1.8.7-2012.02@twitter/bin:/opt/twitter/rvm/gems/ree-1.8.7-2012.02@global/bin:/opt/twitter/rvm/rubies/ree-1.8.7-2012.02/bin:/opt/twitter/rvm/bin:/opt/twitter/bin:/opt/twitter/sbin:/usr/local/git/bin:/usr/local/mysql/bin:/Users/rchen/bin:/Users/rchen/.twitools/src/twitter-utilities/sbt:/Users/rchen/.twitools/src/twitter-utilities/sbt11:/Users/rchen/.twitools/src/twitter-utilities/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/Users/rchen/.tools-cache/home/aurora/tools/client/bin:/Users/rchen/.tools-cache/home/aurora/tools/dottools/bin

# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history
 
# use pattern search
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

# key binding: delete the current word
bindkey "^D" delete-word
# key binding: kill from the beiginning of the line to the cursor position
bindkey "^J" backward-kill-line

# solve slow git completion problem
__git_files () { 
    _wanted files expl 'local files' _files     
}

# extended expansion/globbing
setopt extended_glob

# sync config files to Dropbox 
cp ~/.gitconfig ~/Dropbox/Dev/gitconfig
cp ~/.local.bash ~/Dropbox/Dev/bashrc
cp ~/.tmux.conf ~/Dropbox/Dev/tmux.conf
cp ~/.vimrc ~/Dropbox/Dev/vimrc
cp ~/.zshrc ~/Dropbox/Dev/zshrc
cp ~/.ctags ~/Dropbox/Dev/ctags



# Huge command history: the interaction between these two size limits is a little funny, but these should get you pretty far
SAVEHIST=50000
HISTSIZE=50000
 
# A basic prompt which shows the current git repo. To see user@host, add %n@%m, or just %n or %m as you like
# source $HOME/.git-completion.zsh
# prompts '[%{$fg_bold[green]%}%c %{$fg_no_bold[cyan]%}$(__git_ps1 "(%s)")%{$reset_color%}]%{$fg[yellow]%}$(prompt_char)%{$reset_color%} '
 
# Especially if you use the OS-X built-in terminal, this makes the title bar more useful
# chpwd() {
#     update_terminal_cwd
# }
 
# Pick your favorite editor
export EDITOR='vim'
 
# Tweak: disable ctrl-d to prevent accidental logouts
setopt IGNORE_EOF
 
# Tweak: make sure to treat dots and slashes as word delimiters
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'
bindkey -e
 
# Tweak: properly handle ctrl-left and ctrl-right (depends on your terminal settings)
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
 
# Proper character encoding (change en_US as needed to your locale)
export LC_CTYPE=en_US.UTF-8
 
# Unclear if this is used in zsh
export CLICOLOR=1
 
# Have you made local modifications to your bash config? They may be zsh compatible. If not, don't import them here.
source ~/.local.bash
 
# From twitter's bash aliases:
export CC=/usr/bin/gcc-4.2
export RAILS_ENV='development'
export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=50000000
export RUBY_HEAP_FREE_MIN=4096
 
# From science/ads/scripts/bash_aliases.sh, modified slightly for zsh:
 
science_root() {
  # print the science root if we are under it, or ~/workspace/science.
  (pwd | grep --color=never -o '.*science[^/]*\b') || echo ~/workspace/science
}
 
in_science() {
  cd $(science_root)
  $*
  rc=$?
  cd - 1>/dev/null # for some reason, cd - writes to stdout
  return $rc
}
 
# The commonly used aliases in workspace/science/ads/scripts/bash_aliases.sh (modify as you like, add growlit, etc.)
alias goscience='cd $(science_root)'
alias science='cd ~/workspace/science'
alias pants='in_science ./pants'
alias wash_pants='in_science ads/scripts/wash_pants.sh'
 
[[ -s /opt/twitter/rvm/scripts/rvm ]] && . "/opt/twitter/rvm/scripts/rvm"
 
# Note: This is obsolete.
# Be careful with your path: make sure that you don't use the OS-X default git or ruby (git should be in /usr/local/git/bin/git)
# export PATH=/usr/local/git/bin:/usr/local/mysql/bin:/usr/local/bin:/opt/twitter/bin:${HOME}/bin:${HOME}/.twitools/src/twitter-utilities/sbt:$HOME/.rvm/bin:$PATH
 
# This is the new PATH (adding /usr/local/Cellar/git/1.8.4/bin)
export PATH=/usr/local/Cellar/git/1.8.4/bin:/usr/local/git/bin:/usr/local/mysql/bin:/usr/local/bin:/opt/twitter/bin:${HOME}/bin:${HOME}/.twitools/src/twitter-utilities/sbt:$HOME/.rvm/bin:$PATH

# As-you-type syntax highlighting (optional, can be configure to your liking)
# source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Release tool setup (https://confluence.twitter.biz/display/RELEASE/Release+Tools+Setup)
export PATH=~/bin:$PATH

# Used for learning cascading (Gradle, hadoop dependencies)
export PATH=$PATH:~/Downloads/gradle-1.9/bin/:~/Downloads/hadoop-2.2.0/bin/

# Display history with timestamp. See:
# 1) http://stackoverflow.com/questions/804120/unable-to-read-the-timestamp-of-zsh-history
# 	 for the solution
# 2) http://stackoverflow.com/questions/1250079/escaping-single-quotes-within-single-quoted-strings
# 	 for how to quote command containing single quotes
alias lh='perl -lne '"'"'m#: (\d+):\d+;(.+)# && printf "%s :: %s\n",scalar localtime $1,$2'"'"' $HISTFILE | less'

alias gg='git g'
