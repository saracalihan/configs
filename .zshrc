#!/bin/zsh
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/saracalihan/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git archlinux web-search terminitor)

source $ZSH/oh-my-zsh.sh

# For Tilix split from this directory error
if [[ $TILIX_ID ]]; then
        source /etc/profile.d/vte.sh
fi

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

function projects(){ # USAGE: project <project-name> [ --list ]
  for lastArg; do
  done
  
  if [ "$lastArg" = "--list" ] || [ "$lastArg" = "-l" ]; then
    pName=""
    if [ $# -ne 1 ]; then # projetcs crud-example --list
      pName="$1"
    fi
    ls ~/Desktop/projects/$pName
  else 
    cd ~/Desktop/projects/$1
  fi
}

function desktop(){
  cd ~/Desktop/$1
}

#girilen portu kill eder
function oldur(){
  pid=`lsof -i:$1 | tail -1 | awk '{ print $2}'`

  if [ $pid != "" 2>/dev/null ]
  then
    kill $pid && echo "Success"
  else
    echo "Port not listening"
  fi
}

# toggle mongo client admin
function madmin(){
  if [ $1 -ne "" 2>/dev/null ]
  then
    PORT=$1
  else
    PORT=6060
  fi

  MADMIN_ID=`docker ps | grep mongoclient/mongoclient | awk '{print $1}'`
  
  if [ $MADMIN_ID != "" 2>/dev/null ]
  then
    docker kill $MADMIN_ID
    echo "Killed mongo client admin"
  else
    docker run -p ${PORT}:3000 -d mongoclient/mongoclient
    echo "Started mongo client admin on http://localhost:${PORT}"
  fi
}

# toggle postgres admin
function pgadmin(){
  if [ $1 -ne "" 2>/dev/null ]
  then
    PORT=$1
  else
    PORT=5050
  fi

  MADMIN_ID=`docker ps | grep dpage/pgadmin4 | awk '{print $1}'`
  
  if [ $MADMIN_ID != "" 2>/dev/null ]
  then
    docker kill $MADMIN_ID
    echo "Killed postgres admin"
  else #sudo chown -R 5050:5050 /pgadmin_data    for access volume
   sudo docker run -e PGADMIN_DEFAULT_EMAIL=pgadmin4@pgadmin.org -e PGADMIN_DEFAULT_PASSWORD=admin -e PGADMIN_LISTEN_PORT=${PORT} -v "/pgadmin_data/servers.json":/pgadmin4/servers.json -v "/pgadmin_data/pgadmin":/var/lib/pgadmin --network host -d dpage/pgadmin4
    echo "Started postgres admin on http://localhost:${PORT}"
  fi
}

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

alias keyboard-green='g213-led -a 00ff00'
alias keyboard-blue='g213-led -a 00ffef'
alias keyboard-orange-dark='g213-led -a FF4500'
alias keyboard-tomato='g213-led -a FF7F50'
alias keyboard-wave='g213-led -fx hwave keys 20'

alias ohmyzsh='$EDITOR ~/.oh-my-zsh'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='$EDITOR -w PKGBUILD'
alias more=less
alias la='ls -all'
alias temp='watch -n 1 sensors' # show sensors values like cpu cores TEMPerature, battery voltage, etc.
alias docker='sudo docker'
alias edit_vimrc='$EDITOR ~/.vimrc && source ~/.vimrc' 
alias edit_zshrc='$EDITOR ~/.zshrc && source ~/.zshrc'
alias cdr='cd `git rev-parse --show-toplevel`'
alias clip='xclip -sel clip'


postgres_user=`cat ~/.config/docker-alias | grep postgres_user | awk '{printf $2}'`
postgres_pass=`cat ~/.config/docker-alias | grep postgres_pass | awk '{printf $2}'`

mysql_user=`cat ~/.config/docker-alias | grep mysql_user | awk '{printf $2}'`
mysql_pass=`cat ~/.config/docker-alias | grep mysql_pass | awk '{printf $2}'`

mongo_user=`cat ~/.config/docker-alias | grep mongo_user | awk '{printf $2}'`
mongo_pass=`cat ~/.config/docker-alias | grep mongo_pass | awk '{printf $2}'`

alias pg_server='sudo docker run --name pg_server -e POSTGRES_PASSWORD=$postgres_pass -v /var/lib/postgresql:/var/lib/postgresql/data -p 5432:5432 -d postgres'
alias pg_shell='sudo docker exec -it pg_server psql -U $postgres_user'

alias mysql_server='sudo docker run --name mysql_server -e MYSQL_ROOT_PASSWORD=$mysql_pass -v /var/lib/mysql:/var/lib/mysql -p 3306:3306 -d mysql'
alias mysql_shell='sudo docker exec -it mysql_server mysql -u$mysql_user -p'

alias mongo_server='sudo docker run --name mongo_server -e MONGO_INITDB_ROOT_USERNAME=$mongo_user -e MONGO_INITDB_ROOT_PASSWORD=$mongo_pass -v /etc/mongo:/etc/mongo -p 27017:27017 -d  mongo'
alias mongo_shell='sudo docker exec -it mongo_server mongo -u $mongo_user -p $mongo_pass'

alias redis_server='docker run --name redis_server -v /docker/host/dir:/data -p 6379:6379 -d redis  redis-server --save 60 1'
alias redis_shell='docker exec -it redis_server redis-cli'

export LOCALHOST=/srv/http
export VIMRC=~/.vimrc
export ZSHRC=~/.zshrc
export WINDOWS=/run/media/$USER/Windows/Users/AlihanSarac


# For android develpoment
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# For Jekyll 
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
