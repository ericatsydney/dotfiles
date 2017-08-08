#custom alias
alias vim='nvim'

# List files
alias ll='ls -lart'
alias lf='ll | grep -v "^d"'  # Only files, including dotfiles.
alias ld='ll | grep "^d"'     # Only directories, including dotdirectories.

# Easier navigation to move up directories.
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'

# Git 
alias gst='git status'
alias gd='git diff'
alias gclean='git clean -df'
alias greset='git reset --hard HEAD'
alias gpull='git pull origin master'
alias gpush='git push origin master'
alias syncmaster='git pull origin master && git push origin master'
