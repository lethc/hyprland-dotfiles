#!/bin/bash
# This script moves all the markdown files from the Home directory to a folder named chat.

# Get the current user's home directory.
home_dir=$(getent passwd $USER | cut -d: -f6)

# Create the chat folder if it doesn't already exist.
mkdir -p $home_dir/chat

# Move all the markdown files to the chat folder.
for file in $home_dir/*.md; do
  mv "$file" $home_dir/chat
done
