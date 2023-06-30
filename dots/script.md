# INSTALL

## ArchLinux
```bash
sudo pacman -S konsole dolphin firefox qutebrowser discover foot man-db mpv yt-dlp zellij newsboat btop gitui packagekit-qt5 flatpak fwupd ark
sudo pacman -S noto-fonts-cjk noto-fonts-emoji noto-fonts 
sudo pacman -S nodejs npm python-pip python-pipx
pacman -Syu pipewire-alsa pipewire-jack pipewire-pulse alsa-utils gvfs-mtp
yay -S ranger-git noto-fonts-emoji-apple lsix nodejs-readability-cli selectdefaultapplication-git apple-fonts
sudo pacman -S ttf-jetbrains-mono-nerd zsh
#Enable Wireplumber
sudo pacman -Syu wireplumber
systemctl --user enable --now wireplumber
# Yay installation
git clone https://aur.archlinux.org/yay.git
makepkg -si PKGBUILD
# Change shell
sudo usermod —s /usr/bin/zsh root
sudo pacman -S kvantum cronie
```
## mimeapp

## Nvim dependencies

```bash
sudo npm install neovim
sudo npm install -g npm@9.6.2
sudo npm i -g ls_emmet
pacman -S install pynvim python-black prettier stylua ripgrep fd gzip  wl-clipboard cliphist unzip deno composer yarn
yay -S jdk-lts
yay -S jdk-lts-doc
yay -S google-java-format-git
yay -S python-rpcq
yay -S rar 

yay -S xampp
yay -S ruby
php
ltex
```

## Kitty && Zsh dependencies

```bash
sudo pacman -S zsh-syntax-highlighting zsh-autosuggestions 
yay -S zsh-autocomplete-git zsh-sudo-git zsh-vi-mode
sudo pacman -S lsd bat

#NO longer required
cd /usr/share/zsh/plugins/
sudo mkdir zsh-sudo
yay -S wget
sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh


```
## Ranger dependencies

```bash
- python-pillow (kitty support)
# NO longer required
- ranger-sixel-git (Sixel support on terminals like foot) `set preview_images_method sixel`   

```

## Hyprland dependencies

```bash
yay -S  eww-wayland swaylock-effects-git sway-audio-idle-inhibit-git light-git cava cliphist hyprpicker-git wl-clip-persist-git swww 

sudo pacman -S kitty hyprland xdg-desktop-portal-hyprland wofi dunst jq swayidle bc pamixer papirus-icon-theme playerctl grim slurp wl-clipboard socat swappy nm-connection-editor dictd blueberry acpi **swaylock**
pacman -S xdg-desktop-portal-gtk

# rust local
sudo pacman -S rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#Replace xdg-desktop-portal-wlr for xdg-desktop-portal-hyprland-git

```


## Firefox style

```bash

#Go to settings>help>More troubleshooting information>Profile Directory
#Note: Starting with Firefox 69 you have to enable toolkit.legacyUserProfileCustomizations.stylesheets in about:config.
cd  /home/lummyn/.mozilla/firefox/nm8tgizz.default-release
cp -r ~/Git/dotfiles/chrome .

```

## Other tools

```bash
sudo pacman -S nautilusm telegram-desktop qt5ct
yay -S nwg-look
```

## Edit /etc/profile

```bash
export QT_QPA_PLATFORMTHEME=qt5ct
#export GTK_THEME=:dark

```

## SDDM theme

```bash
#dependencies
pacman -Syu sddm qt5-graphicaleffects qt5-svg qt5-quickcontrols2
yay -S sddm-theme-corners-git
#/usr/share/sddm/themes/corners/
sudo pacman -S nsxiv
configuration
#if you haven't already, make sure to change the current theme that SDDM is using. on Arch, create a config file in /etc/sddm.conf.d/ with the following contents:

[Theme]
Current=corners

```

## ranger use nsxiv instead of sxiv(deprecated)

```bash
yay -S nsxiv-git
cd /usr/bin/
wget https://codeberg.org/nsxiv/nsxiv-extra/raw/branch/master/scripts/nsxiv-rifle/nsxiv-rifle
#if you didn't update rifle.conf

```

## install zathura and LaTeX

```bash

sudo pacman -S texlive-most
pacman -S zathura zathura-pdf-mupdf
yay -S biber

```

## iamcco/markdown-preview.nvim

```bash
#Replace packer by lazy
cd ~/.local/share/nvim/site/pack/packer/start/
git clone https://github.com/iamcco/markdown-preview.nvim.git
cd markdown-preview.nvim
yarn install
yarn build

```

## bat theme
```bash

    Clone this repository. https://github.com/catppuccin/bat
    First create a theme folder in bat's configuration directory by running:

    mkdir -p "$(bat --config-dir)/themes"

    Copy all the .tmTheme files from the cloned folder to bat's theme folder:

    cp *.tmTheme "$(bat --config-dir)/themes"

    Rebuild bat's cache:

    bat cache --build

    Run bat --list-themes and check if all the 4 theme flavours are present in the list.

```

## Other utilities

yay -S rofi-lbonn-wayland-git rofi-emoji           
yay -S megacmd

## YouTube local server (Reduce RAM memory)
[link](https://git.sr.ht/~heckyel/yt-local) 
```bash
git clone https://git.sr.ht/~heckyel/yt-local
#optional
#git clone --deph 1 https://git.sr.ht/~heckyel/yt-local
cd yt-local
python -m venv env
source env/bin/activate
pip3 install -r requirements.txt
#run
python server.py
```

