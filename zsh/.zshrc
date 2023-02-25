# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.


[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"

PATH="$HOME/.local/bin${PATH:+:${PATH}}"
PATH="$HOME/go/bin${PATH:+:${PATH}}"
PATH="$HOME/.cargo/bin${PATH:+:${PATH}}"

SPACESHIP_DIR_TRUNC='6'
SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  git
  venv          # virtualenv section
  exec_time     # Execution time
  line_sep      # Line break
  exit_code     # Exit code section
  char          # Prompt character
)
fpath=( "${ZDOTDIR:-$HOME}/.zfunctions" $fpath )
autoload -U promptinit; promptinit
prompt spaceship

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=25000
SAVEHIST=20000
setopt autocd


function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

eval "$(zoxide init zsh)"

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' menu select
autoload -Uz compinit
compinit
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

source ~/.zsh-plugins/syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#9f9f9f"
source ~/.zsh-plugins/zsh-substring/history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=false
HISTORY_SUBSTRING_SEARCH_FUZZY=false


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
fm6000 -f ~/.pika.txt -c random -n

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
