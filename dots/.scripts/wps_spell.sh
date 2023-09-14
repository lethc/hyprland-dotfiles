#!/bin/bash
# This script allows to change the spellcheck language in WPS
# A symlink of it is created in ~/.local/bin
FR_DIR="/home/$(whoami)/.local/share/Kingsoft/office6/dicts/fr_FR"
USE_HUNSPELL="0"
if [ -z "$1" ]; then
  # If no argument is provided, return current language
  DIC_FILE=$(realpath $FR_DIR/main.dic)
  if [ $USE_HUNSPELL == "1" ]; then
    CURRENT=$(basename $DIC_FILE)
  else
    CURRENT=$(basename $(dirname $DIC_FILE))
  fi
  echo "WPS currently using language $CURRENT"
else
  if [ $USE_HUNSPELL == "1" ]; then
    # Use Hunspell dictionary in /usr/share/hunspell
    SOURCE_DIR="/usr/share/hunspell"
    DIC_FILE="$SOURCE_DIR/$1.dic"
    AFF_FILE="$SOURCE_DIR/$1.aff"
  else
    # Use dictionary available in dicts/all. These should be first downloaded from
    # https://github.com/HoLuLuLu/wps-office-multilang/tree/master/wps-office-bin/opt/kingsoft/wps-office/office6/dicts/spellcheck 
    SOURCE_DIR="/home/$(whoami)/.local/share/Kingsoft/office6/dicts/all"
    DIC_FILE="$SOURCE_DIR/$1/main.dic"
    AFF_FILE="$SOURCE_DIR/$1/main.aff"
  fi

  # If an argument is provided, check if selected language is available"
  if test -f $DIC_FILE; then
    ln -sf $DIC_FILE $FR_DIR/main.dic
    ln -sf $AFF_FILE $FR_DIR/main.aff
    echo "WPS language successfully set to $1!"
  else
    echo "ERROR: Language $1 was not found in $SOURCE_DIR. Please try again."
  fi
fi
