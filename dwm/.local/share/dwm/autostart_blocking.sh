killall -q dwmblocks
pgrep redshift | xargs -n1 kill -9

dwmblocks &
nitrogen --restore &
