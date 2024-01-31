###### Export Variables ######
# Fix the Java Problem
PATH=/root/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
export _JAVA_AWT_WM_NONREPARENTING=1
export EDITOR=nvim
# export BROWSER=qutebrowser
export LANG="en_GB.UTF-8"
export PATH=$PATH:$XDG_CONFIG_HOME
export PATH="$HOME/.local/bin":$PATH
export PATH=/home/lummyn/.local/bin:$PATH
export PATH=/opt/android-sdk/platform-tools:$PATH
export PATH=/opt/idea-IC-223.8214.52/bin/:$PATH
# export PATH=/opt/apache-maven-3.8.7/bin:$PATH
export PATH_TO_FX=path/to/javafx-sdk-20/lib
# export PATH=/home/lummyn/Modules/javafx-sdk-20/lib/:$PATH
# Add .NET Core SDK tools
export PATH="$PATH:/home/lummyn/.dotnet/tools"
# export PATH="$PATH:/opt/lampp/bin"
export PATH="$PATH:/opt/mssql-tools/bin"
export PATH=~/bin:$PATH
export PATH=~/.luarocks/bin:$PATH
export PATH=~/go/bin:$PATH
export PATH="$PATH:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl" #Biber requires this PATH to execute
export BAT_THEME="Catppuccin-mocha"
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"' 
export FZF_CTRL_T_COMMAND='rg --files --hidden -g "!.git"'

#rust Set UP
# . "$HOME/.cargo/env"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

 ######  Aliases  ######
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
# alias cat='bat --theme Catppuccin-mocha'
alias cat='bat'
alias bat='bat'
alias tu='tmux'
alias update='yay -Syu'
alias pj='cd /home/lummyn/Documents/projects'
# alias copy='pwd && pwd | xclip -sel clipboard'
alias copy='pwd && pwd | wl-copy'
alias grep="grep --color=always"
# alias code='sgpt --code'
alias maid='tgpt'
# alias maid='bard-cli'
alias jukit_kitty="kitty --listen-on=unix:@"$(date +%s%N)" -o allow_remote_control=yes"
# alias nsxiv="nsxiv-rifle"
alias sxiv="nsxiv"
alias md="gh-md-toc" #https://github.com/jonathanpoelen/gh-md-toc
# alias vim="nvim"
alias vi="nvim"
alias nn="nvim"
alias n="nvim"
alias v="vimv"
alias vv="vimv"
alias py="python"
alias youtube="qutebrowser http://127.0.0.1:9010/"
alias yt="youtube-tui"
# alias youtube="firefox http://127.0.0.1:9010/ &> /dev/null &"
alias dots="cd ~/.config/hypr/dots/"
alias mn="minase"
# alias gtt='~/Downloads/Git/GTT/gtt'
alias manual="tldr"
alias news="newsboat"
alias nws="newsboat"
alias wallpaper="~/.scripts/random_wallpaper.sh"
alias z-rust="zellij -l ~/.config/zellij/kellig_layouts/rust-zellij.kdl"
alias z-layout="zellij -l ~/.config/zellij/kellig_layouts/yazi-zellij.kdl"
alias zz="zellij"
alias za="zellij a"
alias zl="fzj"
alias gi="gitui"
alias p="ping -c3 google.com"

###### Plugins  ######
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 
source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

##### Configurations  #######
# Use VIM keybindings even if our EDITOR is set to EMACS
bindkey -v
# Yank to the system clipboard
function vi-yank-xclip {
    zle vi-yank
   echo "$CUTBUFFER" | wl-copy
}
zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip
## ZSH-AUTOCOMPLETE options
# Make Tab and ShiftTab cycle completions on the command line
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
# # Don't show completions if the current word matches a pattern
# zstyle ':autocomplete:*' ignored-input '..##'
# Wait with autocompletion until typing stops for a certain amount of seconds
# zstyle ':autocomplete:*' delay 0.2  # seconds (float)
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
# zsh-autosuggestions 
bindkey 'Ñ' autosuggest-accept
setopt histignorealldups sharehistory
#Use modern completion system
autoload -Uz compinit
compinit
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# FZF colourscheme
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
--color=fg:#C4C4C4,hl:#ff9e64 \
--color=fg+:#C4C4C4,hl+:#ff9e64 \
--color=info:#90A959,prompt:#BAD7FF,pointer:#BAD7FF \
--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"


##### Functions  ########
function mkt(){
	mkdir {nmap,content,exploits,scripts}
}

# function zl(){
#  fzf_session=$(zellij list-sessions | grep -v "HOME" | fzf --prompt="Select Zellij session: ")
#   zellij attach $fzf_session
# }

## cd with ls and lsix to display images in terminal
function cd {
 builtin cd "$@" && ls -F
}
#function cd {
#  builtin cd "$@" && ls -F
#  if [[ ! "$PWD" == "$HOME" ]]; then
#    if [[ -n $(find . -type f -name "*.png" -o -name "*.jpg" -o -name "*.jpeg") ]]; then
#      lsix
#    fi
#  fi
#}

# Extract nmap information
function extractPorts(){
	ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
	ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
	echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
	echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
	echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
	echo $ports | tr -d '\n' | xclip -sel clip
	echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
	cat extractPorts.tmp; rm extractPorts.tmp
}
# Set 'man' colors
function man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}
# fzf improvement
function fzf-lovely(){
	if [ "$1" = "h" ]; then
		rg --files --hidden -g "!.git" | fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&
 	                echo {} is a binary file ||
	                 (bat --style=numbers --color=always {} ||
	                  highlight -O ansi -l {} ||
	                  coderay {} ||
	                  rougify {} ||
	                  cat {}) 2> /dev/null | head -500' | while read -r file; do
                          nvim "$file"
                    done

	else
	        rg --files --hidden -g "!.git" | fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&
                 echo {} is a binary file ||
                 (bat --style=numbers --color=always {} ||
                  highlight -O ansi -l {} ||
                  coderay {} ||
                  rougify {} ||
                  cat {}) 2> /dev/null | head -500' | while read -r file; do
                    nvim "$file"
               done
	fi
}
#Delete permanently
function rmk(){
	scrub -p dod $1
	shred -zun 10 -v $1
}
function rr() {
    tmp="$(mktemp -t "yazi-cwd.XXXXX")"
    yazi --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

#Multiple NVIM Configurations
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-new="NVIM_APPNAME=new nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"
alias nvim-2="NVIM_APPNAME=nvim2 nvim"
alias nnvim="NVIM_APPNAME=NormalNvim nvim"
alias lvimIDE="NVIM_APPNAME=lvim nvim"
alias lazy="NVIM_APPNAME=lazy nvim"

function nvims() {
  items=("default" "NvChad" "AstroNvim" "nvim2" "new" "NormalNvim" "lvim" "lazy")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt="Neovim config >> " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}
bindkey -s ^a "nvims\n"

eval "$(starship init zsh)"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
