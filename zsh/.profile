#!/bin/bash
# Adds `~/.local/bin` to $PATH
# export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"
export PATH="$HOME/.local/bin${PATH:+:${PATH}}"
export PATH="$HOME/go/bin${PATH:+:${PATH}}"
export PATH="$HOME/.local/bin/Insomnia${PATH:+:${PATH}}"
export PATH="$HOME/.local/bin/Discord${PATH:+:${PATH}}"
export PATH="${JAVA_HOME}/bin${PATH:+:${PATH}}"
# export PATH="/home/athul/Downloads/Compressed/idea-IU-221.5080.210/bin${PATH:+:${PATH}}"
PATH="$HOME/.cargo/bin${PATH:+:${PATH}}"
export PATH=$PATH:/opt/gradle/gradle-7.4.2/bin
export $(dbus-launch)
export _JAVA_AWT_WM_NONREPARENTING=1
export PATH=~/.npm-global/bin:$PATH

export LANG=en_US.UTF-8

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave-browser-stable"
. "$HOME/.cargo/env"
