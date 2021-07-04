#!/bin/zsh
# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"

unsetop tPROMPT_SP

export LANG=en_US.UTF-8

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"

