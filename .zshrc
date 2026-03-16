eval "$(starship init zsh)"
source "$HOME/.config/zsh/syntax-highlighting/syntax-highlighting.zsh"
source "$HOME/.config/zsh/autosuggestions.zsh"
source "$HOME/.config/zsh/history-search.zsh"

# Function to download a list of videos in HD (22)
ydownl(){ yt-dlp -f 22 -o "%(playlist_index)s-%(title)s.%(ext)s" --download-archive videosList.txt "$@"; }

setopt autocd correct extendedglob nocaseglob appendhistory sharehistory histignorealldups auto_pushd pushd_ignore_dups nobeep

HISTFILE="$HOME/.zhistory"
HISTSIZE=50000
SAVEHIST=10000

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.cache/zsh"

bindkey -e
autoload -U up-line-or-beginning-search down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

alias ls='eza -a'
alias grubup='sudo update-grub'
alias tarnow='tar -acf'
alias untar='tar -zxvf'
alias wget='wget -c'
alias gcc89='gcc -Wall -pedantic -Werror -Wextra -std=gnu89'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias ifconfig='ip -c a'