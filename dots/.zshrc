# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Called before prompt(?)
function precmd {
    # Set window title
    vcs_info
    print -Pn "\e]0;zsh%L %(1j,%j job%(2j|s|); ,)%~\e\\"
}

# Called when executing a command
function preexec {
    print -Pn "\e]0;${(q)1}\e\\"
}
# Branch Variable
autoload -Uz vcs_info
# precmd() {  }
zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST

git_prompt() {
    local branch="$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3-)"
    local branch_truncated="${branch:0:30}"
    if (( ${#branch} > ${#branch_truncated} )); then
        branch="${branch_truncated}..."
    fi

    [ -n "${branch}" ] && echo "  ${branch}"
}

# PROMPT='%F{1}%n%f@%f%m%f %F{1}%8~%f '
# PROMPT='%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ %0(?.. %F{red} exit code: <%?> %f)'
PROMPT='%B%F{#17D291}󱗆%f%b %B%F{#17D291}%n%f%b %B%F{blue}%~%f%b%B%F{green}$(git_prompt)%f%b %(?.%B%F{green}✓.%F{red}✕)%f%b %B%F{green}%f%b '

###### Export Variables ######
# Fix the Java Problem
PATH=/root/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
export _JAVA_AWT_WM_NONREPARENTING=1
export EDITOR=nvim
export BROWSER=zen-browser
export BROWSER2=qutebrowser
export TERMINAL=foot
export LANG="en_GB.UTF-8"
export PATH=$PATH:$XDG_CONFIG_HOME
export PATH="$HOME/.local/bin":$PATH
export PATH=/opt/android-sdk/platform-tools:$PATH
export PATH=/opt/idea-IC-223.8214.52/bin/:$PATH
export PATH="$HOME/.config/composer/vendor/bin":$PATH
export JAVA_HOME=$(ls -d /lib/jvm/java-* | sort -V | tail -n 1)
# export PATH="$JAVA_HOME/bin:$PATH" # Useful if a directory has spaces in its name
export PATH="$JAVA_HOME/bin":$PATH
# export PATH=/opt/apache-maven-3.8.7/bin:$PATH
export PATH_TO_FX=path/to/javafx-sdk-20/lib
# export PATH=/home/lummyn/Modules/javafx-sdk-20/lib/:$PATH
# Add .NET Core SDK tools
export PATH="$PATH:$HOME/.dotnet/tools"
# export PATH="$PATH:/opt/lampp/bin"
export PATH="$PATH:/opt/mssql-tools/bin"
export PATH=~/bin:$PATH
export PATH=~/.luarocks/bin:$PATH
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl" #Biber requires this PATH to execute
export BAT_THEME="TwoDark"
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"'
export FZF_CTRL_T_COMMAND='rg --files --hidden -g "!.git"'
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..|clear|cl)"

# Light theme STARSHIP
# export STARSHIP_CONFIG=~/.config/starship/light/starship.toml

# Dark theme STARSHIP
export STARSHIP_CONFIG=~/.config/starship/dark/starship.toml

#rust Set UP
# . "$HOME/.cargo/env"
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# source <(fzf --zsh)

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
alias ffm="tv audio"
alias ff="tv notes"
alias ff2="tv light-notes --layout portrait"
alias fr="tv rg --exact"
alias fr2="tv light-rg --layout portrait --exact"
alias cl="clear"
alias fast='is-fast'
alias cm='camb'

###### Plugins  ######
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh
# source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh
# source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

##### Configurations  #######
# disable Ctrl+D
setopt ignore_eof 
# Use VIM keybindings even if our EDITOR is set to EMACS
bindkey -v
#bindkey -rM viins '^[h'  # ^[h = Alt+h
#bindkey -rM viins '^[l'  # ^[l = Alt+l
# Yank to the system clipboard
function vi-yank-xclip {
	zle vi-yank
	echo "$CUTBUFFER" | wl-copy
}
zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip
## ZSH-AUTOCOMPLETE options
# source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# Make Tab and ShiftTab cycle completions on the command line
# bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
# bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
# # Don't show completions if the current word matches a pattern
# zstyle ':autocomplete:*' ignored-input '..##'
# Wait with autocompletion until typing stops for a certain amount of seconds
# zstyle ':autocomplete:*' delay 0.2  # seconds (float)

# HISTORY COMMANDS
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
HISTDUP=erase # Delete any duplicates inside the history file

# ZSH-AUTOSUGGESTIONS
bindkey 'Ñ' autosuggest-accept
setopt histignorealldups sharehistory
#Use modern completion system
autoload -Uz compinit
compinit

# ZSHELL OPTIONS
bindkey '^k' history-search-backward # Ctrl + k
bindkey '^j' history-search-forward

# Shell History
function tv-history-widget() {
  local cmd
  cmd=$(tv zsh-history)
  if [[ -n "$cmd" ]]; then
    # Place selection into Zsh line editor buffer
    LBUFFER="$cmd"
  fi
  zle redisplay
}
zle -N tv-history-widget
bindkey '^r' tv-history-widget   # Ctrl-r to trigger

# cle () clear
#
# zle -N cle
#
# bindkey '^r' cle

setopt appendhistory     # Append any commands to the history file rather than overwriting it
setopt sharehistory      # Share our command history across all Zshell sessions at the same time
setopt hist_ignore_space # Prevent a command to being written to the history file by adding a space before it
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups

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
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
# zstyle ':completion:*' menu select=long
zstyle ':completion:*' menu no
# zstyle ':fzf-tab:complete:cd*' fzf-preview 'ls --color $realpath'

# Light theme FZF
# export FZF_DEFAULT_OPTS='
# --color=bg+:#E6EBF5,spinner:#3E5E7E,hl:#9EA7B8,fg:#272933,header:#9EA7B8,info:#3E5E7E,pointer:#3E5E7E,marker:#3E5E7E,fg+:#272933,prompt:#3E5E7E,hl+:#3E5E7E
# --bind alt-j:down,alt-k:up,ctrl-u:preview-up,ctrl-d:preview-down
# '

# Dark theme FZF
export FZF_DEFAULT_OPTS=" \
--color=bg+:#3B4252,spinner:#81A1C1,hl:#616E88 \
--color=fg:#D8DEE9,header:#616E88,info:#81A1C1,pointer:#81A1C1 \
--color=marker:#81A1C1,fg+:#D8DEE9,prompt:#81A1C1,hl+:#81A1C1 \
--color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--bind alt-j:down,alt-k:up,ctrl-u:preview-up,ctrl-d:preview-down
"

##### Functions  ########
function mkt() {
	mkdir {nmap,content,exploits,scripts}
}

## cd with ls and lsix to display images in terminal
# function cd {
#  builtin cd "$@" && ls -F
# }
#function cd {
#  builtin cd "$@" && ls -F
#  if [[ ! "$PWD" == "$HOME" ]]; then
#    if [[ -n $(find . -type f -name "*.png" -o -name "*.jpg" -o -name "*.jpeg") ]]; then
#      lsix
#    fi
#  fi
#}

# Extract nmap information
function extractPorts() {
	ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
	ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
	echo -e "\n[*] Extracting information...\n" >extractPorts.tmp
	echo -e "\t[*] IP Address: $ip_address" >>extractPorts.tmp
	echo -e "\t[*] Open ports: $ports\n" >>extractPorts.tmp
	echo $ports | tr -d '\n' | xclip -sel clip
	echo -e "[*] Ports copied to clipboard\n" >>extractPorts.tmp
	cat extractPorts.tmp
	rm extractPorts.tmp
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
# function fzf-lovely() {
# 	if [ "$1" = "h" ]; then
# 		rg --files --hidden -g "!.git" | fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&
#  	                echo {} is a binary file ||
# 	                 (bat --style=numbers --color=always {} ||
# 	                  highlight -O ansi -l {} ||
# 	                  coderay {} ||
# 	                  rougify {} ||
# 	                  cat {}) 2> /dev/null | head -500' | while read -r file; do
# 			nvim "$file"
# 		done
#
# 	else
# 		rg --files --hidden -g "!.git" | fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&
#                  echo {} is a binary file ||
#                  (bat --style=numbers --color=always {} ||
#                   highlight -O ansi -l {} ||
#                   coderay {} ||
#                   rougify {} ||
#                   cat {}) 2> /dev/null | head -500' | while read -r file; do
# 			nvim "$file"
# 		done
# 	fi
# }

# FZF Note
# function fzf-note() {
#     local SEARCH_DIR="$PWD"
#     local FZF_OPTS=()
#
#     if [[ "$1" == "h" ]]; then
#         FZF_OPTS+=(--reverse --preview-window=down:20)
#     else
#         FZF_OPTS+=(--preview-window=right:60%:wrap)
#     fi
#
#     # Generate relative file list
#     local file_list
#     file_list=$(rg --files --hidden -g "!.git" "$SEARCH_DIR" | sort -u)
#
#     local selection
#     selection=$(echo "$file_list" | \
#         fzf --multi --border \
#             "${FZF_OPTS[@]}" \
#             --prompt="Select file (Ctrl-N to create new): " \
#             --preview '[[ $(file --mime {}) =~ binary ]] &&
#                 echo {} is a binary file ||
#                 (bat --style=numbers --color=always {} ||
#                  highlight -O ansi -l {} ||
#                  coderay {} ||
#                  rougify {} ||
#                  cat {}) 2> /dev/null | head -500' \
#             --bind "ctrl-n:abort" \
#             --expect=ctrl-n)
#
#     local key=$(head -1 <<< "$selection")
#     local selected_name=$(tail -n +2 <<< "$selection")
#
#     if [[ "$key" == "ctrl-n" ]]; then
#         print -n "New file name: "
#         read -r newname
#         [[ -z "$newname" ]] && return 1
#         [[ "$newname" != *.md ]] && newname="$newname.md"
#
#         local fullpath="$SEARCH_DIR/$newname"
#         mkdir -p "$(dirname "$fullpath")"
#         touch "$fullpath"
#         nvim "$fullpath"
#         return
#     fi
#
#     if [[ -z "$selected_name" ]]; then
#         return 1
#     fi
#
#     # Construct absolute path only if needed
#     local selected_file
#     if [[ "$selected_name" = /* ]]; then
#         selected_file="$selected_name"
#     else
#         selected_file="$SEARCH_DIR/$selected_name"
#     fi
#
#     if [[ ! -f "$selected_file" ]]; then
#         echo "File not found: $selected_file"
#         return 1
#     fi
#
#     if [[ $(file --mime "$selected_file") =~ binary ]]; then
#         echo "$selected_file is a binary file" >&2
#         return 1
#     fi
#
#     nvim "$selected_file"
# }


# function fzf-audio() {
#     # Define audio file extensions
#     local audio_exts=("*.mp3" "*.wav" "*.flac" "*.ogg" "*.m4a" "*.aac" "*.wma" "*.opus" "*.mp4" "*.mkv" "*.webm")
#
#     if [ "$1" = "h" ]; then
#         # Hidden mode (using nvim)
#         rg --files --hidden -g "!.git" "${audio_exts[@]/#/-g}" | \
#             fzf -m --reverse --preview-window down:20 --preview '
#                 echo "Audio File: {}"
#                 mediainfo {} 2>/dev/null || echo "No media info available"
#             ' | while read -r file; do
#             nvim "$file"
#         done
#     else
#         # Normal mode (using mpv)
#         rg --files --hidden -g "!.git" "${audio_exts[@]/#/-g}" | \
#             fzf -m --preview '
#                 echo "Audio File: {}"
#                 mediainfo {} 2>/dev/null || echo "No media info available"
#             ' | while read -r file; do
#             mpv "$file"
#         done
#     fi
# }
# function fzf-rg() {
# 	rm -f /tmp/rg-fzf-{r,f}
# 	RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
# 	INITIAL_QUERY="${*:-}"
# 	: | fzf -m --ansi --disabled --query "$INITIAL_QUERY" \
# 		--bind "start:reload:$RG_PREFIX {q}" \
# 		--bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
# 		--bind 'ctrl-t:transform:[[ ! $FZF_PROMPT =~ ripgrep ]] &&
#               echo "rebind(change)+change-prompt(1. ripgrep> )+disable-search+transform-query:echo \{q} > /tmp/rg-fzf-f; cat /tmp/rg-fzf-r" ||
#               echo "unbind(change)+change-prompt(2. fzf> )+enable-search+transform-query:echo \{q} > /tmp/rg-fzf-r; cat /tmp/rg-fzf-f"' \
# 		--color "hl:-1:underline,hl+:-1:underline:reverse" \
# 		--prompt '1. ripgrep> ' \
# 		--delimiter : \
# 		--header 'CTRL-T: Switch between ripgrep/fzf' \
# 		--preview 'bat --color=always {1} --highlight-line {2}' \
# 		--preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
# 		--bind 'enter:become(nvim {1} +{2})'
# }
# function fcd() {
# 	local selected_dir
# 	selected_dir=$(find . -type d -print 2>/dev/null | fzf +m) && cd "$selected_dir"
# }
#Delete permanently
function rmk() {
	scrub -p dod $1
	shred -zun 10 -v $1
}
# builtin cd to avoid a collision between zoxide cd and yazi autocd
function rr() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
YAZI_TERM=""
if [ -n "$YAZI_LEVEL" ]; then
	YAZI_TERM="|  Yazi terminal: "
fi
PS1="$PS1$YAZI_TERM"

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
	config=$(printf "%s\n" "${items[@]}" | tv --inline --input-prompt "󰥨 Neovim config: " --input-header "NVIMS" --no-status-bar)
	if [[ -z $config ]]; then
		echo "Nothing selected"
		return 0
	elif [[ $config == "default" ]]; then
		config=""
	fi
	NVIM_APPNAME=$config nvim $@
}
bindkey -s ^a "nvims\n"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Zoxide
# eval "$(zoxide init zsh)"
# eval "$(zoxide init --cmd cd zsh)"
eval "$(zoxide init --no-cmd zsh)" #Uncomment this and comment (zoxide init zsh) to use cd. BTW uncomment the cd function bellow too

function cd {
	__zoxide_z "$@" && ls -F
}
function cdi {
	__zoxide_zi "$@" && ls -F
}

# source /home/Lummyn/.config/broot/launcher/bash/br
# eval "$(zellij setup --generate-auto-start zsh)"
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
