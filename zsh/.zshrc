# Path to your oh-my-zsh installation.
export ZSH=/Users/damassi/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="kolo"

# Plugins
plugins=(git brew colorize gem node npm zsh_reload zsh-autosuggestions)
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Postgres.app/Contents/Versions/latest/bin"
source $ZSH/oh-my-zsh.sh

# Setup zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle

# Python
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Ruby / rbenv
eval "$(rbenv init -)"

# Elixir / kiex
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

# Aliases
# ---------------------------------------------------------------------------------

# Easy corrections via https://github.com/nvbn/thefuck
alias fuck='$(thefuck $(fc -ln -1))'
alias f='fuck'
alias be='bundle exec'

# General
alias dt='cd ~/Desktop'
alias Sites='cd ~/Sites'
alias gh='cd ~/Sites/Github'
alias cn='cd ~/Sites/CN'
alias make='make -j'
alias wfmu='tuner wfmu'
alias kpfa='tuner kpfa'
alias wnyc='tuner wnyc'
alias find-ports='lsof -i tcp:5000'
alias es='cd && cn && cd elixir-school'

# Git
alias gs="git status"
alias gc="git commit"
alias gr="git checkout"
alias ga="git add"
alias gl="git lola"
alias revise='git commit -am "c" && git rebase -i HEAD~2'

# Artsy
alias artsy='cd && cd Sites && cd artsy'
alias causality='artsy && cd causality'
alias force='artsy && cd Force'
alias gravity='artsy && cd gravity'
alias gravity-ssh='gravity && bundle exec rake ow:console\[staging\]'
alias gravity-ssh-production='gravity && bundle exec rake ow:console\[production\]'
alias kinetic='artsy && cd kinetic'
alias metaphysics='artsy && cd metaphysics'
alias ohm='artsy && cd ohm'
alias prediction='artsy && cd prediction'
alias positron='artsy && cd positron'
alias pulse='artsy && cd pulse'
alias reaction='artsy && cd reaction'
alias pulse-ssh='heroku run rails c --app artsy-pulse-staging'

export AWS_USER=
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_PUBLICKEY=
export AWS_REGION=us-east-1
export AWS_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET=$AWS_SECRET_ACCESS_KEY

# Misc
export BUNDLER_EDITOR="code"
