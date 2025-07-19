killall -q dwmblocks
pgrep redshift | xargs -n1 kill -9

pgrep pipewire | xargs -n1 kill -9
pgrep pipewire-pulse | xargs -n1 kill -9
pgrep wireplumber | xargs -n1 kill -9
pgrep udiskie | xargs -n1 kill -9
pgrep clipmenud | xargs -n1 kill -9

dwmblocks &
pipewire &
wireplumber &
pipewire-pulse &
udiskie -a &
clipmenud &

nitrogen --set-auto --random &
