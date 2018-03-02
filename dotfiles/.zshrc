
export TERM="xterm-256color"

POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='245'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='black'
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time time)

POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"

# load zgen
ZGEN_PREZTO_LOAD_DEFAULT=0
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen prezto prompt theme 'sorin'
    #zgen prezto tmux:auto-start local 'yes'
    zgen prezto editor key-bindings 'vi'
    zgen prezto utility:ls color 'yes'
    zgen prezto '*:*' case-sensitive 'yes'
    zgen prezto '*:*' color 'yes'

    zgen prezto
    zgen prezto git
    zgen prezto environment
    zgen prezto terminal
    zgen prezto editor
    zgen prezto directory
    zgen prezto spectrum
    zgen prezto utility
    zgen prezto prompt
    zgen prezto archive
    zgen prezto ruby
    zgen prezto rails

    zgen prezto command-not-found
    #zgen prezto tmux
    zgen prezto fasd
    zgen prezto history-substring-search
    zgen prezto syntax-highlighting

    zgen load m42e/prezto_extras
    zgen load bhilburn/powerlevel9k powerlevel9k
    
    zgen load caarlos0/zsh-git-sync
    zgen load TBSliver/zsh-plugin-colored-man
    zgen load mafredri/zsh-async
    zgen load junegunn/fzf shell
    
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load tarruda/zsh-autosuggestions

    zgen save
fi

autoload -Uz add-zsh-hook
add-zsh-hook precmd newline-after-command

function newline-after-command() { 
  print ''
}

export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion

##################

# Node
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Ruby
export PATH="$PATH:$HOME/.rvm/bin"

# Git / Github
export GITHUB_USERNAME=kevinelliott
alias git-prune="git branch --merged master | grep -v \"\* master\" | grep -v \" master\" | xargs -n 1 git branch -d"

# Ngrok
alias ngrok-workfit="ngrok http -subdomain=kevin-workfit-dev -host-header=workfit.test 80"
