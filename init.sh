#Setup the Ulti snippets
vim_config_path=~/.config/nvim
vim_snippets_path=$vim_config_path/mySnippets
git_path=~/Code/dotfiles
git_snippets_path=$git_path/mySnippets
if [ ! -d $vim_snippets_path ]; then
  mkdir -p $vim_snippets_path
fi
for entry in $git_snippets_path/*
do
  file_name=$(basename $entry) 
  if [ ! -f $vim_snippets_path/$file_name ]; then
    ln -s $entry $vim_snippets_path/$file_name 
    echo '>>>>>>>>'
    echo 'Link file to the source.'
  else
    echo '>>>>>>>>'
    echo 'file exists, skip.....'
  fi
done
