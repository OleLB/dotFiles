# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# if [[ -f "/opt/homebrew/bin/brew" ]] then
#   # If you're using macOS, you'll want this enabled
#   eval "$(/opt/homebrew/bin/brew shellenv)"
# fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias c='clear'
alias la='ls -la'
alias ll='ls -l' 
alias pi="ssh -i /home/rational/.ssh/id_rsa ole@192.168.86.138"
alias bcat='batcat' 
alias kraken='ssh -D 9050 -X rational@192.168.86.90'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Cutom changes
unsetopt beep
bindkey "^?" backward-delete-char

# Enable zsh-autosuggestions
bindkey '^[[Z' autosuggest-accept  # Shift+Tab to accept suggestions

# Move cursor left/right in insert mode
# bindkey '^H' backward-char  # Ctrl+h to move left
# bindkey '^L' forward-char   # Ctrl+l to move right

# Cycle through command history
# bindkey '^J' down-line-or-history  # Ctrl+j to go down in history
# bindkey '^K' up-line-or-history    # Ctrl+h to go up in history (conflict warning)

# Delete character in front (default behavior of Delete key)
bindkey '^[[3~' delete-char  

# Map 'jk' to exit insert mode (vi-mode)
bindkey -M viins 'kj' vi-cmd-mode

# Move cursor to the end of the line in insert mode
# bindkey -M viins '^A' end-of-line  

# Move cursor to the start of the line in insert mode
# bindkey -M viins '^I' beginning-of-line

export WORD="/usr/share/wordlists"
export pi="192.168.86.138"

# Created by `pipx` on 2025-06-23 17:43:01
export PATH="$PATH:/home/ole/.local/bin"
