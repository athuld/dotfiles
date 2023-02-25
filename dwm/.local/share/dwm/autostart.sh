# Increase key speed via a rate change
xset r rate 300 50

# Map the caps lock key to super...
setxkbmap -option caps:super

# But when it is pressed only once, treat it as escape.
killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape'

# Map the menu button to right super as well.
xmodmap -e 'keycode 135 = Super_R'

redshift -P -l 20.59:78.96 -t 5000:3200 &

# Compositor
picom --no-fading-openclose &

# Numlock
numlockx &

# Play with mpv
play-with-mpv &
