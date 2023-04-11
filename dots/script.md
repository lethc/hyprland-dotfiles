# mv dotfiles, wait

# install

```bash
- luarocks, Ruby, RubyGem, Composer, PHP, npm, node, pip3, javac, java, julia,
- linux-lts-headers, nodejs, npm, python-pip --> for node
- additional: prettier, black, stylua, google_java_format
- npm install neovim
- pip install pynvim
- RPC
- ripgrep
- fd
- npm i -g ls_emmet
- gzip
- tar

```

# Nvim dependencies

```bash
sudo npm install neovim
sudo npm install -g npm@9.6.2
sudo npm i -g ls_emmet
pip install pynvim
yay -S python-black
yay -S prettier stylua
yay -S jdk-lts
yay -S jdk-lts-doc
yay -S google-java-format
yay -S ripgrep
yay -S fd
yay -S python-rpcq
yay -S rar gzip
yay -S rust
yay -S xampp
yay -S ruby
```

- MasonInstall jdtls@v1.18.0

# Ranger dependencies

- python-pillow
- ranger_devicons-git

# Hyprland dependencies

```bash
hyprland wofi dunst jq eww-wayland swayidle swaylock-effects-git swaylockd sway-audio-idle-inhibit-git bc pamixer light-git papirus-icon-theme playerctl cava kitty xdg-desktop-portal-wlr grim slurp wl-clipboard socat swappy cliphist hyprpicker-git nm-connection-editor dictd wl-clip-persist-git blueberry swww-git
#Replace xdg-desktop-portal-wlr for xdg-desktop-portal-hyprland-git

```

# Kitty && Zsh dependencies

```bash
yay -S zsh-syntax-highlighting zsh-autosuggestions zsh-autocomplete-git
yay -S lsd bat
cd /usr/share/zsh/plugins/
sudo mkdir zsh-sudo
yay -S wget
sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

```

# Firefox style

```bash
#Go to settings>help>More troubleshooting information>Profile Directory
cd  /home/lummyn/.mozilla/firefox/nm8tgizz.default-release
cp -r ~/Git/dotfiles/chrome .

```

# Other tools

```bash
yay -S nautilus
yay -S telegram-desktop
yay -S xdg-desktop-portal-gnome
yay -S nwg-look
yay -S qt5ct

```

# Edit /etc/profile

```bash
export QT_QPA_PLATFORMTHEME=qt5ct
#export GTK_THEME=:dark

```

# SDDM theme

```bash
#dependencies
pacman -Syu sddm qt5-graphicaleffects qt5-svg qt5-quickcontrols2
yay -S sddm-theme-corners-git
#/usr/share/sddm/themes/corners/
yay -S sxiv

```

# ranger use nsxiv instead of sxiv(deprecated)

```bash
yay -S nsxiv-git
cd /usr/bin/
wget https://codeberg.org/nsxiv/nsxiv-extra/raw/branch/master/scripts/nsxiv-rifle/nsxiv-rifle
#if you didn't update rifle.conf

```

# install zathura and LaTeX

```bash

sudo pacman -S texlive-most
yay -S zathura zathura-pdf-mupdf
yay -S biber

```

# iamcco/markdown-preview.nvim

```bash
#Replace packer by lazy
cd ~/.local/share/nvim/site/pack/packer/start/
git clone https://github.com/iamcco/markdown-preview.nvim.git
cd markdown-preview.nvim
yarn install
yarn build

```
