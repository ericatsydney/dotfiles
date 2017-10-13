#Add alias.
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.functions ]; then
  . ~/.functions
fi

export PATH=$PATH:~/.composer/vendor/bin

ssh-add -K

let 'index=$RANDOM % 4'
case $index in 
    0)
        cow = 'daemon'
        ;;
    1)
        cow = 'default'
        ;;
    2)  cow = 'moose'
        ;;
    3)  cow = 'koala'
        ;;
esac

fortune | cowsay -f $cow
