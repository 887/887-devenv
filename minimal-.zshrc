#!/bin/zsh

# https://dougblack.io/words/zsh-vi-mode.html
# Vi mode
bindkey -v
# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

# kill the lag
export KEYTIMEOUT=1

export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space

alias vim="nvim"
