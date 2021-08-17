#!/bin/bash

read -p "Quick Update (Y/N) should be only used by my lazy ass: " quick
if [[ $quick == [yY] || $quick == [yY][eE][sS] ]]
then
    cp -ruv ./bspwm ~/.config/
    cp -ruv ./polybar ~/.config/
    cp -ruv ./redshift ~/.config/
    cp -ruv ./rofi ~/.config/
    cp -ruv ./scripts ~/.config/
    exit 0
fi

read -p "Use backup (Y/N): " backup
if [[ $backup == [yY] || $backup == [yY][eE][sS] ]]
then
    cp --backup=simple -ir ./bspwm ~/.config/
    cp --backup=simple -ir ./polybar ~/.config/
    cp --backup=simple -ir ./redshift ~/.config/
    cp --backup=simple -ir ./rofi ~/.config/
    cp --backup=simple -ir ./scripts ~/.config/
else
    cp -ir ./bspwm ~/.config/
    cp -ir ./polybar ~/.config/
    cp -ir ./redshift ~/.config/
    cp -ir ./rofi ~/.config/
    cp -ir ./scripts ~/.config/
fi