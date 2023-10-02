#!/bin/bash

wall="$HOME/.config/hypr/themes/one/wallpapers/"
cd $wall

echo "Enter start page number:"
read page

echo "Enter final page number:"
read range

while [ $page -lt $range ]; do
	url="https://wallhaven.cc/api/v1/search?q=anime&categories=110&purity=110&ratios=landscape&sorting=toplist&order=desc&ai_art_filter=0&page=$page"
	json=$(curl -s "$url")
	image_paths=($(echo "$json" | jq -r '.data[].path'))

	for path in "${image_paths[@]}"; do
		wget "$path"
	done

	page=$((page + 1))
done
