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

