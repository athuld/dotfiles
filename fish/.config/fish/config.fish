if status is-interactive
set -U fish_greeting ''
fm6000 -f ~/.pika.txt -c random -n
zoxide init fish | source
set SPACEFISH_PROMPT_ORDER dir git venv exec_time line_sep exit_code char
set SPACEFISH_DIR_TRUNC	7
end

# pnpm
set -gx PNPM_HOME "/home/athul/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
