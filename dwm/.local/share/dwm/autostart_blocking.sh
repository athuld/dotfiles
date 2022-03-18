killall -q dwmblocks
pgrep redshift | xargs -n1 kill -9

pgrep pipewire | xargs -n1 kill -9
pgrep pipewire-pulse | xargs -n1 kill -9
preg udiskie | xargs -n1 kill -9

dwmblocks &
pipewire &
pipewire-pulse &
udiskie -a &

feh --bg-fill --randomize ~/Pictures/Walls/*
