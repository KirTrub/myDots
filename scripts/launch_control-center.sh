#!/bin/bash

WIDGET="control_center"

if eww active-windows | grep -q "$WIDGET"; then
    eww close "$WIDGET"
else
    eww open "$WIDGET"
fi
