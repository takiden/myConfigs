# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias xx="exit"
alias poff="shutdown -h now"
alias sus="systemctl suspend"
alias refresh="source ~/.bashrc"
alias profile="vim ~/.bashrc"
alias grep="grep -i --color"
alias rmf="rm -f"
alias open="xdg-open $1"
alias v="$(which vim)"
alias ll="ls -rthl --color"
alias n="$HOME/nvim-linux-x86_64/bin/nvim"
alias y="yazi"
# git commands
alias ga="git add $1"
alias gs="git status"
alias gc="git commit"
alias gcm="git commit -m"
alias gb="git branch"
alias gbr="git branch -rvv"
alias gco="git checkout"
alias gcob="git checkout -b"
alias glp="git log --pretty"

# docker commands
alias dps="docker ps -a"
alias dcr="docker compose run --rm"

# nvim path
PATH="$PATH:/home/takiden/nvim-linux-x86_64/bin"

# Go binary
PATH="$PATH:/usr/local/go/bin"

# Go packages
PATH="$PATH:$(go env GOPATH)/bin"


# export PATH="$PATH:/home/takiden/nvim-linux-x86_64/bin:/usr/local/go/bin"
export PATH

# Added by Antigravity CLI installer
export PATH="/home/takiden/.local/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin

# Default editor for Antigravity prompt (Ctrl+G) and shell
export EDITOR="nvim"
export VISUAL="nvim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

