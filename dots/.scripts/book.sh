#!/bin/bash

# sioyek --new-window
# hyprctl workspaces
# hyprctl dispatch exec "[workspace 4 silent] kitty"

function my_books {
	books=(
		"zathura -P 1 /home/Lummyn/Home/Books/navigate/navigate_upper_intermediate_TN.pdf" #Book_answers
		"zathura -P 7 /home/Lummyn/Home/Books/navigate/navigate_upper_intermediate_CB.pdf" #Book

		"zathura -P 202 /home/Lummyn/Home/Books/navigate/navigate_upper_intermediate_TN.pdf" #Book_Grammar_answers
		"zathura -P 137 /home/Lummyn/Home/Books/navigate/navigate_upper_intermediate_CB.pdf" #Book_Grammar

		"zathura -P 97 /home/Lummyn/Home/Books/navigate/navigate_upper_intermediate_wb.pdf" #Work_book_answers
		"zathura -P 5 /home/Lummyn/Home/Books/navigate/navigate_upper_intermediate_wb.pdf" #Work_book

		"xournalpp /home/Lummyn/Home/Books/navigate/navigate_upper_intermediate_CB.pdf -n 7" #Book
		"xournalpp /home/Lummyn/Home/Books/navigate/navigate_upper_intermediate_CB.pdf -n 137" #Book_Grammar
		"xournalpp /home/Lummyn/Home/Books/navigate/navigate_upper_intermediate_wb.pdf -n 5" #Work_book
	)

	# commands=("ls -lha" "pwd" "echo 'Hello, World!'")

	# Iterate through the array and execute each command
	# for command in "${books[@]}"; do
	# 	$command
	# done

  #Call for a specific element 
  sleep 1
  hyprctl dispatch exec "[workspace 4 silent] ${books[0]}" 
  hyprctl dispatch exec "[workspace 4 silent] ${books[1]}" 
  hyprctl dispatch workspace 4 | sleep 2
  hyprctl dispatch togglegroup | sleep 1
  hyprctl dispatch movefocus r
  hyprctl dispatch moveintogroup l | sleep 1
  hyprctl dispatch lockgroups
  hyprctl dispatch exec "[workspace 4 silent] ${books[6]}" | sleep 1

  hyprctl dispatch exec "[workspace 5 silent] ${books[2]}" 
  hyprctl dispatch exec "[workspace 5 silent] ${books[3]}" 
  hyprctl dispatch workspace 5 | sleep 2
  hyprctl dispatch togglegroup | sleep 1
  hyprctl dispatch movefocus r
  hyprctl dispatch moveintogroup l | sleep 1
  hyprctl dispatch lockgroups
  hyprctl dispatch exec "[workspace 5 silent] ${books[7]}" | sleep 1

  hyprctl dispatch exec "[workspace 6 silent] ${books[4]}" 
  hyprctl dispatch exec "[workspace 6 silent] ${books[5]}" 
  hyprctl dispatch workspace 6 | sleep 2
  hyprctl dispatch togglegroup | sleep 1
  hyprctl dispatch movefocus r
  hyprctl dispatch moveintogroup l | sleep 1
  hyprctl dispatch lockgroups
  hyprctl dispatch exec "[workspace 6 silent] ${books[8]}" | sleep 1
}

my_books
