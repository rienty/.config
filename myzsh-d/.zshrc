
#Export global variable
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export PATH=/usr/local/texlive/2022/bin/x86_64-linux:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
export MANPATH="/usr/local/man:$MANPATH"
export EDITOR='nvim'
export ZSH="$HOME/.config/myzsh"

# Load all stock functions (from $fpath files) called below.
autoload -U compaudit compinit
# Save the location of the current completion dump file.
if [[ -z "$ZSH_COMPDUMP" ]]; then
  ZSH_COMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump-${ZSH_VERSION}"
fi
compinit -u -d "$ZSH_COMPDUMP"

unset zcompdump_revision zcompdump_fpath zcompdump_refresh

for config_file ("$ZSH"/lib/*.zsh); do
  source "$config_file"
done

plugins=(git sudo colorize fzf zsh-completions zsh-autosuggestions zsh-syntax-highlighting zsh-autopair fzf-tab-completion)

# Load all of the plugins 
for plugin ($plugins); do
  if [[ -f "$ZSH/plugins/$plugin/$plugin.plugin.zsh" ]]; then
    source "$ZSH/plugins/$plugin/$plugin.plugin.zsh"
  fi
done
unset plugin

source $ZSH/themes/gruvbox.zsh
# Alias
alias px='proxychains4'
alias ne='clear && echo "\n" && neofetch --ascii_distro Linux'
alias xm="xmodmap ~/.config/Xmodmap"
alias xn="xmodmap ~/.config/xmodmap"
alias bl="bluetoothctl"
alias is="sudo iw dev wlan0 scan | grep SSID"
alias io="sudo iw dev wlan0 connect CNU"
alias ik="sudo iw dev wlan0 disconnect"
alias ih="iw dev wlan0 info"
alias se="startx ~/.xinitrc bspwm"
alias sd="./scripts/sd.sh"
alias em="emacs -nw"
alias ra="ranger"
alias vv="v2ray -c ~/scripts/config.json"
alias psy="sudo pacman -Syyu"
alias pas="sudo pacman -S"
alias pr="sudo pacman -Rns"
alias pq="sudo pacman -Q"
alias pp="bash ~/scripts/passmenu2.sh"
alias cs="curl --socks5 127.0.0.1:1080"
alias vim="nvim"
alias mu="proxychains4 neomutt"
alias ke="sudo loadkeys i386/qwerty/emacs2.map.gz"
alias nx='bash ~/scripts/nextcloud.sh'
alias lg='lazygit'
alias vs='vim ~/.config/sxhkd/sxhkdrc'
alias vb='vim ~/.config/bspwm/bspwmrc'
alias cl='rm -rf ~/.cache ~/.local/share/qutebrowser/webengine/Local\ Storage ~/.local/share/qutebrowser/webengine/Service\ Worker ~/.local/share/qutebrowser/webengine/GPUCache ~/.dbus'

# Colorized man
man() {
	LESS_TERMCAP_md=$'\e[01;31m' \
		LESS_TERMCAP_me=$'\e[0m' \
		LESS_TERMCAP_se=$'\e[0m' \
		LESS_TERMCAP_so=$'\e[01;44;33m' \
		LESS_TERMCAP_ue=$'\e[0m' \
		LESS_TERMCAP_us=$'\e[01;32m' \
		command man "$@"
	}

# Keybinding
bindkey '^F' vi-forward-char
bindkey '' vi-backward-char
bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history

