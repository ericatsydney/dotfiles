#Add alias.
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

export PATH=$PATH:~/.composer/vendor/bin

ssh-add -K

fortune | cowsay
