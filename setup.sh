#!/bin/sh

for file in `find . -name ".?*" -and ! -name ".git" -and ! -name "*.swp"`
do
  filename=${file##*/}
  ln -s $PWD/$filename $HOME/$filename
done

