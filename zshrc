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

# Huge command history: the interaction between these two size limits is a little funny, but these should get you pretty far
SAVEHIST=50000
HISTSIZE=50000
 
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
 
# Display history with timestamp. See:
# 1) http://stackoverflow.com/questions/804120/unable-to-read-the-timestamp-of-zsh-history
# 	 for the solution
# 2) http://stackoverflow.com/questions/1250079/escaping-single-quotes-within-single-quoted-strings
# 	 for how to quote command containing single quotes
alias lh='perl -lne '"'"'m#: (\d+):\d+;(.+)# && printf "%s :: %s\n",scalar localtime $1,$2'"'"' $HISTFILE | less'

alias gg='git g'

alias subl='reattach-to-user-namespace /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

alias pip='python3 -m pip'

# This fix the issue of conda so we can use the conda env specific python version (https://github.com/conda/conda/issues/9392#issuecomment-617345019)
unset CONDA_SHLVL
