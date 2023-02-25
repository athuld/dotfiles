killall -q dwmblocks
pgrep redshift | xargs -n1 kill -9

pgrep pipewire | xargs -n1 kill -9
pgrep pipewire-pulse | xargs -n1 kill -9
pgrep udiskie | xargs -n1 kill -9

dwmblocks &
pipewire &
pipewire-pulse &
udiskie -a &

nitrogen --set-auto --random
