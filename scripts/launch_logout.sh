#!/bin/bash

if hyprctl layers | grep -w "logout_dialog" > /dev/null; then
    pkill wlogout 
else
     wlogout
fi
