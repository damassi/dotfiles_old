# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Setup Zsh theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git bower brew bundler capistrano coffee colorize gem git-flow heroku node nvm npm rails rake ruby rvm tmux tmuxinator vundle zsh_reload)

# Load oh my zsh
source $ZSH/oh-my-zsh.sh


# PATH Exports
# ----------------------------------------------------------------------------------------------------------------

export PATH="/Users/damassi/.rvm/gems/ruby-2.1.0/bin:/Users/damassi/.rvm/gems/ruby-2.1.0@global/bin:/Users/damassi/.rvm/rubies/ruby-2.1.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/local/MacGPG2/bin:/Users/damassi/.rvm/bin"

# SSH
export SSH_KEY_PATH="~/.ssh/id_rsa"

# MySQL
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

# GO
export PATH="/usr/local/go/bin:$PATH"

# Homebrew
export PATH="/usr/local/sbin:$PATH"

# Docker / Boot2Docker
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/damassi/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1


# Autocompletion
# ----------------------------------------------------------------------------------------------------------------

# Setup zsh-autosuggestions
source ~/.zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
  zle autosuggest-start
}
zle -N zle-line-init

# Use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle


# Aliases
# ----------------------------------------------------------------------

alias zshconfig="mvim ~/.zshrc"
alias ohmyzsh="mvim ~/.oh-my-zsh"
alias ctags="`brew --prefix`/bin/ctags"
alias dt='cd ~/Desktop'
alias Sites='cd ~/Sites'
alias gh='cd ~/Sites/Github'
alias cn='cd ~/Sites/CN'
alias sim='cd ~/Desktop/simulator; and rake'
alias make='make -j'
alias wfmu='tuner wfmu'
alias kpfa='tuner kpfa'
alias wnyc='tuner wnyc'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# Easy corrections via https://github.com/nvbn/thefuck
alias fuck='$(thefuck $(fc -ln -1))'
alias f='fuck'

# MySQL
alias mysqlstart="mysql.server start"
alias mysqlstop="mysql.server stop"

# Environment
alias zshrc='cd; atom .zshrc'

# Kindling
# ----------------------------------------------------------------------

# Paths
alias kindling='cd ~/Sites/Kindling/kindlingdev'
alias kindling-dev='kindling; cd development'
alias kmanager='kindling-dev; cd manager5'
alias kgizmo='kindling-dev; cd gizmo'
alias kapp='kindling-dev; cd kindlingapp'
alias kmarketing='kindling-dev; cd marketing2'
alias kf='kindling-dev; cd kindlingapp/frontend'
alias kmentions='kindling-dev; cd react-tinymce-mention'

# Server
alias kvagrant='kindling; .scripts/local/start'
alias kreset='kindling; .scripts/vm/kindlingapp.reset'
alias ktreset='kindling; .scripts/vm/kindlingapp.tracer'
alias kmemcache='kindling; .scripts/vm/kindlingapp.clearmemcache'
alias kfpm='kindling; .scripts/vm/kindlingapp.fpm'
alias kssh='kindling; vagrant ssh'
alias ktail='kindling; vagrant ssh -c "tail -f /var/log/kindling/* /var/log/manager/* /var/log/apache2/kindling.error.log /var/log/supervisor/*"'

# Gizmo Commands
alias gatom='kgizmo; atom .;'
alias gstart='kindling; vagrant ssh -c "cd /srv/www/gizmo; npm start"'
alias glaunch='open http://192.168.33.10:3000/'

# Manager Commands
alias matom='kmanager; atom .;'

# Development Tasks
alias kgulp='kapp; cd frontend; gulp'
alias katom='kapp; atom .; cd frontend'

# Project Management
alias kdocs='open http://dev.kindlingdev.com/api/docs'
alias ktrac='open https://kng-apps.kindlingapp.com/trac/report/7'
alias kasana='open https://app.asana.com/'


# Time Inc
# ----------------------------------------------------------------------

alias t='cd && cd time';
alias trights-old='t && cd ape-edit-photorights-www';
alias trights='t && cd edit-rights-www';


# Oh My Zsh
# ----------------------------------------------------------------------

# Setup zsh-autosuggestions
source /Users/damassi/.zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
  zle autosuggest-start
}

zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle
