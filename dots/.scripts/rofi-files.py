#!/usr/bin/python

import subprocess
import os

DIR=os.path.expanduser("~/.config/rofi/themes/")
STYLE="easy"
RASI=os.path.join(DIR, f"{STYLE}/rofi/launcher.rasi" )

if __name__ == '__main__':

    files = subprocess.run('fd', encoding='utf-8',
                           capture_output=True).stdout.split('\n')

    title = 'rofi-files'
    rofi_command = f'rofi -dmenu -theme {RASI} -i -p'.format(title)
    rofi_input = '\n'.join(file for file in files)
    cp = subprocess.run(rofi_command.split(), input=rofi_input,
                        encoding='utf-8', capture_output=True)

    if cp.returncode == 0:
        file = cp.stdout.strip()
        xdg_command = ['xdg-open', file]
        subprocess.run(xdg_command,
                       encoding='utf-8', capture_output=True)
