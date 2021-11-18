#!/bin/bash

read -p "Quick Update (Y/N) should be only used by my lazy ass: " quick
if [[ $quick == [yY] || $quick == [yY][eE][sS] ]]
then
    cp -ruv ./.config ~/
    exit 0
fi

read -p "Use backup (Y/N): " backup
if [[ $backup == [yY] || $backup == [yY][eE][sS] ]]
then
    cp --backup=simple -i ./.zshrc ~/
    cp --backup=simple -ir ./.config ~/
    cp --backup=simple -ir ./.themes ~/
else
    cp -i ./.zshrc ~/
    cp -ir ./.config ~/
    cp -ir ./.themes ~/
fi