#### My Aliases
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias xx="exit"
alias refresh="source ~/.bashrc"
alias profile="vim ~/myConfigs/bashrc"
alias grep="grep -i"
alias rmf="rm -f"
alias open="xdg-open $1"
alias projects="cd ~/projects && ls -l"
alias n="/opt/nvim-linux-x86_64/bin/nvim $1"
alias v="vim"
alias ll="ls -rthl"
alias run-cleaned-data="docker run --name cleaned-data -d --rm areftd/postgres-aol-data-cleaned"
alias working-db="docker run --name working-db  -e POSTGRES_USER=myuser -e POSTGRES_PASSWORD=test123 -v ~/Studium/Datenbank/myDataVolumen:/var/lib/postgresql/data -d --rm postgres"
# alias android="~/android-studio/bin/studio.sh & "
#git commands
alias ga="git add $1"
alias gs="git status"
alias gc="git commit"
alias glp="git log --pretty"
alias run-marks-db="docker run --name marks-db -v /home/takiden/IdeaProjects/marks/myVolume:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:latest"
alias poff="poweroff"
alias dps="docker ps -a"
alias restartPlasma="systemctl --user restart plasma-plasmashell.service"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/takiden/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
#  pnpm end

# neovim path
export PATH="$PATH:$HOME/.local/bin/env:/opt/nvim-linux-x86_64/bin"
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

. "$HOME/.local/bin/env"


# Load Angular CLI autocompletion.
source <(ng completion script)

eval "$(starship init bash)"
