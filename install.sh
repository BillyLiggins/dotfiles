#!/bin/bash
DIR=${PWD}

for file in $DIR/*; do
    filename=${file##*/}
    if [ "$filename" == "install.sh" ] || [ "$filename" == "README.md" ] ; then
        continue
    fi
    echo "Creating symlink to $file"
    ln -sfn $file .$filename
done

source ~/.bashrc
source ~/.bash_profile
echo -e "\nDONE!"
echo "YouCompleteMe link: https://github.com/Valloric/YouCompleteMe"
