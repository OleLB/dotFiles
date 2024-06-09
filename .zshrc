# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/fray/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PATH=/home/fray/.local/bin:$PATH

eval "$(starship init zsh)"

alias electron="--enable-features=UseOzonePlatform --ozone-platform=wayland"
alias c="clear"
alias l="ls -la"

# Define a function to exit insert mode
function exit_insert_mode {
    zle reset-prompt
    zle vi-cmd-mode
}

# Bind the function to the "jk" or "kj" key sequence
zle -N exit_insert_mode
bindkey -M viins 'jk' exit_insert_mode
bindkey -M viins 'kj' exit_insert_mode


# Plugins
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh # History search using keys

# Avoid conflict with Ctrl+j
bindkey -r '^J'
bindkey '^K' history-substring-search-up
bindkey '^J' history-substring-search-down

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh # Greyed  out auto complete
source  /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  # This is the highlighting and needs to be last
