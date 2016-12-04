###########################################################################
#
#   @autor Long Hoang <long@mindworker.de>
# 
#   @brief general useful aliases
#
###########################################################################

###########################################################################
# Workspaces
###

###########################################################################
# Frequently used config files
###

alias magic='emacs -nw ~/.aliases.sh'
alias zmagic='emacs -nw ~/.zshrc'
alias imagic='emacs -nw ~/.config/i3/config'
alias tmagic='emacs -nw ~/.tmux.conf'
alias emagic='emacs -nw ~/.emacs.d/init.el'
alias hmagic='emacs -nw /etc/hosts'

###########################################################################
# Very handy tweaks
###

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'

alias j='jobs -l'
alias em='emacs -nw'
alias sem='sudo emacs -nw'
alias chmox='chmod +x'
alias schmox='sudo chmod +x'
alias df='df -h'

# this one saved by butt so many times
alias wget='wget -c' # resumes downloads by default
alias cp='cp -i'     # interactive cp by default (prevents unconcious overriding)

# git shortcuts
alias gs='git status'
alias gc='git commit -m'
alias gp='git push' 
alias g.='git add .'

###########################################################################
# Utilities
###

alias sweep='find . -name "*~" | xargs rm -v; find . -name "*#" | xargs rm -v;'
alias sudosweep='find . -name "*~" | xargs sudo rm -v; find . -name "*#" | xargs sudo rm -v;'
alias dark='xset dpms force off' # black the screen

function bck() { cp "$1" "$1.bck" ;}

function extract {
    if [ -z "$1" ]; then
	# display usage if no parameters given
	echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    else
	if [ -f $1 ] ; then
	    # NAME=${1%.*}
	    # echo $NAME
            # mkdir $NAME && cd $NAME
            case $1 in
		*.tar.bz2)   tar xvjf ./$1    ;;
		*.tar.gz)    tar xvzf ./$1    ;;
		*.tar.xz)    tar xvJf ./$1    ;;
		*.lzma)      unlzma ./$1      ;;
		*.bz2)       bunzip2 ./$1     ;;
		*.rar)       unrar x -ad ./$1 ;;
		*.gz)        gunzip ./$1      ;;
		*.tar)       tar xvf ./$1     ;;
		*.tbz2)      tar xvjf ./$1    ;;
		*.tgz)       tar xvzf ./$1    ;;
		*.zip)       unzip ./$1       ;;
		*.Z)         uncompress ./$1  ;;
		*.7z)        7z x ./$1        ;;
		*.xz)        unxz ./$1        ;;
		*.exe)       cabextract ./$1  ;;
		*)           echo "extract: '$1' - unknown archive method" ;;
            esac
	else
            echo "$1 - file does not exist"
	fi
    fi
}

function histo() {
    history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n15
}

###########################################################################
# WebDev Utils
###

function curlj() {
    curl "$@" | python -m json.tool
}

###########################################################################
# Platform specific
###

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   alias nauti='nautilus --no-desktop > /dev/null 2>&1 &'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   echo 'Is MAC'
fi
