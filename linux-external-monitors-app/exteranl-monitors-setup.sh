#!/bin/bash

# default monitor is eDP-1
MONITOR=eDP1


# functions to switch from eDP-1 to EXTERNAL and vice versa
function ActivateEXTERNAL {
    xrandr --output DVI-I-3-2 --output DVI-I-2-1 --output eDP-1 --same-as DVI-I-2-1
    MONITOR=EXTERNAL
}
function DeactivateEXTERNAL {
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

# actual script, do not run it in a infinite loop

if ! EXTERNALActive && EXTERNALConnected; then
    ActivateEXTERNAL
fi

if EXTERNALActive && ! EXTERNALConnected; then
    DeactivateEXTERNAL
fi

ext=$?
if [[ $ext -ne 0 ]]; then
    echo "ext $ext"
    exit $ext
fi
