#!/bin/sh
# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"
export PATH="$HOME/go/bin${PATH:+:${PATH}}"
export JAVA_HOME="/usr/lib/jvm/java-1.8-openjdk"
export PATH="${JAVA_HOME}/bin${PATH:+:${PATH}}"

export LANG=en_US.UTF-8

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave-browser-stable"
