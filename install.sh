#!/bin/bash

read -p "Quick Update (Y/N) should be only used by my lazy ass: " quick
if [[ $quick == [yY] || $quick == [yY][eE][sS] ]]
then
    cp -ruv ./bspwm ~/.config/bspwm
    cp -ruv ./polybar ~/.config/polybar
    cp -ruv ./redshift ~/.config/redshift
    cp -ruv ./rofi ~/.config/rofi
    cp -ruv ./scripts ~/.config/scripts
    exit 0
fi

read -p "Use backup (Y/N): " backup
if [[ $backup == [yY] || $backup == [yY][eE][sS] ]]
then
    cp --backup=simple -ir ./bspwm ~/.config/bspwm
    cp --backup=simple -ir ./polybar ~/.config/polybar
    cp --backup=simple -ir ./redshift ~/.config/redshift
    cp --backup=simple -ir ./rofi ~/.config/rofi
    cp --backup=simple -ir ./scripts ~/.config/scripts
else
    cp -ir ./bspwm ~/.config/bspwm
    cp -ir ./polybar ~/.config/polybar
    cp -ir ./redshift ~/.config/redshift
    cp -ir ./rofi ~/.config/rofi
    cp -ir ./scripts ~/.config/scripts
fi