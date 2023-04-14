#!/bin/bash

x=$(shuf -i 0-7 -n 1)
project_dir="$HOME/.config/hypr/"

if [ $x = 0 ]; then
  exit
fi

for i in $(seq 1 $x);
do
  ts=$(date +%s)
  echo "$ts" > $project_dir/main.txt
  git -C $project_dir add .
  git -C $project_dir commit -m "auto commit - $ts"
  git -C $project_dir push origin master
done
