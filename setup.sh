#!/bin/sh

for file in `find . -name ".?*"`
do
  filename=${file##*/}
  ln -s $PWD/$filename $HOME/$filename
done

