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

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# GO
export PATH="/usr/local/go/bin:$PATH"

# Homebrew
export PATH="/usr/local/sbin:$PATH"


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
# ----------------------------------------------------------------------------------------------------------------

alias zshconfig="mvim ~/.zshrc"
alias ohmyzsh="mvim ~/.oh-my-zsh"

alias dt='cd ~/Desktop'
alias Sites='cd ~/Sites'
alias gh='cd ~/Sites/Github'
alias cn='cd ~/Sites/CN'
alias sim='cd ~/Desktop/simulator; and rake'
alias make='make -j'
alias wfmu='tuner wfmu'
alias kpfa='tuner kpfa'
alias wnyc='tuner wnyc'

# Mongo DB
alias startmongo="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
alias stopmongo="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"

# Sonify Project
alias son='cd /Users/damassi/Sites/sonify'
alias son-start='cd /Users/damassi/Sites/sonify; rails s'
alias son-spec='open https://docs.google.com/spreadsheets/d/1lQR7wpLQgxZZNdg5OMqF_mBfhMFJOpyOPtg-QGw_TPo/edit#gid=572943863'
alias son-tickets='open http://sonify.lighthouseapp.com/projects/123629-sonify/tickets'
alias son-gh='open https://github.com/matthewleejohnston/sonify'


# Kindling
# ----------------------------------------------------------------------

# Paths
alias kindling='cd ~/Sites/Kindling/kindlingdev'
alias kindling-dev='kindling; cd development'
alias kapp='kindling-dev; cd kindlingapp'
alias kf='kindling-dev; cd kindlingapp/frontend'

# Server
alias kvagrant='kindling; .scripts/local/start'
alias kreset='kindling; .scripts/vm/kindlingapp.reset'
alias kssh='kindling; vagrant ssh'

# Development Tasks
alias kgulp='kapp; cd frontend; gulp'
alias kvim='kapp; mvim; cd frontend'

