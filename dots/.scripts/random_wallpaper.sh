#!/bin/bash

# Variable of Wallpapers Directory
walldir=$HOME/Pictures/wallpapers/

# Go to Wallpaper Directory
cd $walldir

# Create a variable to store the output.
randomImage=""

# Run the command.
randomImage=$(shuf -n 1 -e *.jpg *.png *.jpeg)

# Change wallpaper
swww img $randomImage
# swww img -t any --transition-bezier 0.0,0.0,1.0,1.0 --transition-duration .8 --transition-step 255 --transition-fps 60 $randomImage
