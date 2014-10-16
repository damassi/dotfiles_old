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
export S3_KEY="AKIAJB3NYVLVQA4N4JYQ"
export S3_SECRET="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"
export S3_REGION="us-west-2"
export S3_ASSET_URL="https://s3-us-west-2"
export S3_BUCKET_NAME="unseenworldsrecords"

# SSH
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi


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
alias son='cd /Users/damassi/Sites/sonify'
alias make='make -j'
# alias node='node --harmony'

# Mongo DB
alias startmongo="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
alias stopmongo="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"


