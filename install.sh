#!/bin/bash

read -p "Quick Update (Y/N) should be only used by my lazy ass: " quick
if [[ $quick == [yY] || $quick == [yY][eE][sS] ]]
then
    cp -uv ./.zshrc ~/.config/
    cp -ruv ./alacritty ~/.config/
    cp -ruv ./bspwm ~/.config/
    cp -ruv ./polybar ~/.config/
    cp -ruv ./redshift ~/.config/
    cp -ruv ./rofi ~/.config/
    cp -ruv ./scripts ~/.config/
    cp -ruv ./gtk-theme ~/.themes/Dracula-pink-accent/
    exit 0
fi

read -p "Use backup (Y/N): " backup
if [[ $backup == [yY] || $backup == [yY][eE][sS] ]]
then
    cp --backup=simple -i ./.zshrc ~/.config/
    cp --backup=simple -ir ./alacritty ~/.alacritty/
    cp --backup=simple -ir ./bspwm ~/.config/
    cp --backup=simple -ir ./polybar ~/.config/
    cp --backup=simple -ir ./redshift ~/.config/
    cp --backup=simple -ir ./rofi ~/.config/
    cp --backup=simple -ir ./scripts ~/.config/
    cp --backup=simple -ir ./gtk-theme ~/.themes/Dracula-pink-accent/
else
    cp -i ./.zshrc ~/.config/
    cp -ir ./alacritty ~/.config/
    cp -ir ./bspwm ~/.config/
    cp -ir ./polybar ~/.config/
    cp -ir ./redshift ~/.config/
    cp -ir ./rofi ~/.config/
    cp -ir ./scripts ~/.config/
    cp -ir ./gtk-theme ~/.themes/Dracula-pink-accent/
fi