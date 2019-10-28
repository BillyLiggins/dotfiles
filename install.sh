#!/bin/bash
DIR=${PWD}

for file in $DIR/*; do
    filename=${file##*/}
    if [ "$filename" == "init.vim" ] || [ "$filename" == "install.sh" ] || [ "$filename" == "README.md" ] ; then
        continue
    fi
    echo "Creating symlink to $file"
    ln -sfn $file ~/.$filename
done

mkdir -p ~/.config/nvim/init.vim
ln -sfn init.vim ~/.config/nvim/init.vim

source ~/.bashrc
source ~/.bash_profile
echo -e "\nDONE!"
