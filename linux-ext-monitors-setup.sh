#!/bin/bash

# sudo nano /etc/UPower/UPower.conf - edit => IgnoreLid=true

# default monitor is eDP-1
MONITOR=eDP1

# functions to switch from eDP-1 to EXTERNAL and vice versa
function ActivateEXTERNAL {
    echo "Switching to EXTERNAL"
    xrandr --output DVI-I-3-2 --output DVI-I-2-1 --output eDP-1 --same-as DVI-I-2-1
    MONITOR=EXTERNAL
}
function DeactivateEXTERNAL {
    echo "Switching to eDP-1"
    xrandr --output DVI-I-3-2 --off --output DVI-I-2-1 --off --output eDP-1 --auto 
    MONITOR=eDP1
}

# functions to check if EXTERNAL is connected and in use
function EXTERNALActive {
    [ $MONITOR = "EXTERNAL" ]
}
function EXTERNALConnected {
    [ $(xrandr | grep "DVI-I-2-1\|DVI-I-3-2" | grep disconnected | wc -l) = "0" ]
}

# actual script
while true
do
    if ! EXTERNALActive && EXTERNALConnected; then
        ActivateEXTERNAL
    fi

    if EXTERNALActive && ! EXTERNALConnected; then
        DeactivateEXTERNAL
    fi

    sleep 1s
done

ext=$?
if [[ $ext -ne 0 ]]; then
    echo "ext $ext"
    exit $ext
fi
