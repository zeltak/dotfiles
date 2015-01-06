#--------------> Base ZSH config
#--------------> $NOTE$!! ALL PATH variables are in .zshen
#--------------> $NOTE$!! ALL PATH variables are in .zshen



#save a history file
function precmd() {
if [ "$(id -u)" -ne 0 ]; then
FULL_CMD_LOG=/home/zeltak/logs/zsh_history.log;
echo "`/bin/date +%Y%m%d.%H%M.%S` `pwd` `history -1`" >> ${FULL_CMD_LOG};
fi
}

[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return


## fix some terminal keys
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line

## fix term freezes and no input possible
setopt nohistfcntllock


#autocorrect
unsetopt correct_all

# glob support
setopt extendedglob


#--------------> Oh-my-ZSH
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each time that oh-my-zsh is loaded.
#ZSH_THEME="zblinks"
#ZSH_THEME="miloshadzic"
ZSH_THEME="kuyatzu"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git jump battery taskwarrior zsh-syntax-highlighting )

#Source zshrc:
source $ZSH/oh-my-zsh.sh





#-------------->  Aliases

##start system
alias sxx='xinit'
alias sx='startx'

# Sys Utils
alias ptop='sudo powertop --auto-tune'


# System
alias rm='rm -Iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias df='pydf'

#sound
alias als='alsamixer'

# function to make ls look nice is below
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lld='ls -ld'

#ROOT stuff
alias rstat='cat /proc/mdstat'
alias su='su -'

#vim stuff
alias v='vim'
alias gv='gvim'
alias sv='sudo vim'
alias sgv='sudo gvim'

#bash
alias ping='ping -c 5'
alias ..='cd ..'
alias sr='sudo reboot'
alias hal='sudo halt'

#zsh
alias cl="clear"
alias xx="exit"

#Tmux
alias tlist='tmux list-sessions'
alias tnew='tmux new-session -s'
alias tcm='teamocil --here wmain'

#chmod
alias cm='chmod +x' #change mode of exec


#--------------> package managers
#PACMAN 


#install
 alias p='pacaur -S' #quick install 
 #updates
 alias pu='pacaur -Syu' #update all Repo+AUR
 # Search repo+AUR
 #query (local packages)
 #Remove
 alias prem='pacaur -R'


#Apt-get
alias apt='sudo apt-get install'
alias aptv='sudo apt-get update & sudo apt-get upgrade'
alias aptu='sudo apt-get update'
alias aptg='sudo apt-get upgrade'
alias aptr='sudo apt-get remove'
alias apts='sudo apt-cache search'
alias sor='sudo nano /etc/apt/sources.list' 
alias aptp='sudo add-apt-repository'
alias apto='sudo apt-get update & sudo apt-get install'

#programs
#refresg sxhks
alias sxr='pkill -USR1 -x sxhkd'
#surfraw
alias yn='surfraw yubnub'
#beets
alias badd='sed "s:/home/zeltak/music/::" | sed "s/ /\ /g" | mpc add'
alias baddr='sed "s:/home/zeltak/music/::" | sed "s/ /\ /g" | mpc add'
alias bl='beet list'


#--------------> ARCHIVED ALIASES
# #taskwarrior
# alias t="task"
# alias tlx="task long  pro:nix"
# alias tld="task long  pro:dl"
# alias tlu="task long pro:uni"
# alias tlh="task long pro:home"
# alias ta="task add"
# alias tax="task add pro:nix"
# alias tau="task add pro:uni"
# alias tad="task add pro:dl"
# alias tah="task add pro:home"
#todo.sh
#alias t="todo.sh"
#source  /home/zeltak/bin/todo_completion
#vim single instance mode
#alias gvim="gvim --remote-tab-silent" || gvim 
#alias openf='obxprop | grep "^_OB_APP"' #openbox win name/class finder
##make you not type sudo each time you use yaourt
# yaourt() {
#    case $1 in
#        -S | -S[^sih]* | -R* | -U*)
#            /usr/bin/sudo /usr/bin/yaourt "$@" ;;
#        *)
#            /usr/bin/yaourt "$@" ;;
#    esac
# }

# #yaourt
# #incase I need to type yaourt..
# alias yoaurt='yaourt'
# alias yuaort='yaourt'
# alias youart='yaourt'
# alias yauort='yaourt'
# alias yuoart='yaourt'
# #yarout
# #install
#  alias p='yaourt --noconfirm' #quick install 
#  alias psin='yaourt' #safe install 
#  alias pog='yaourt ' #safe install 
#  #updates
#  alias pu='yaourt -Syu --devel --aur  --noconfirm' #update all Repo+AUR
#  alias purepo='yaourt -Syu --noconfirm' #update only Repo
#  # Search repo+AUR
#  alias pss='yaourt -Ss ' #seach all
#  alias pclean='yaourt -Scc ' #clean all pacman cahce
#  #query (local packages)
#  alias pinfo='yaourt -Qi' #view info
#  alias plist='yaourt -Ql' #view list of files installed with packages
#  alias pls='yaourt -Qs' #search localy for packages packages
#  alias plistall='yaourt -Qe' #list installed apps
#  #Remove
#  alias prem='yaourt -R'
#  alias pclean='yaourt -Rns'
# #subtle
# alias sk='subtle -k'
# alias sl='subtler -cl'

#--------------> PER APPLICATION

#--------------> keychain
#to ask for both keys at startup
eval $(keychain --eval --agents ssh -Q --quiet id_rsa id_rsa_github)


#teamocil completions
compctl -g '~/.teamocil/*(:t:r)' teamocil

#mpd start
if [ "$(pgrep mpd)" ]; then echo ""; else rm -f ~/.mpd/mpd && mpd; fi

#fix for grep error grep: warning: GREP_OPTIONS is deprecated
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

#Archived apps

# #task
# # show urgent (due) taskwarrior tasks
# if whence task > /dev/null ; then
#   task next due.before:2days
# fi
