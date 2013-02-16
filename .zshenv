# initial setup file for both intaractive and nonintaractive zsh

limit coredumpsize 0

# Setup command search path
typeset -U path

# path
path=(/usr/local/bin(N-/) $path)

# locale 
export LANG=ja_JP.UTF-8

# rvm
# Leopard がRVM動かないので(というかzshのバージョンが古い)
if [ $OSTYPE != "darwin9.0" ]; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi



