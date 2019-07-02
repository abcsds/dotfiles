#======================================== General
# List directory contents
command -v exa >/dev/null 2>&1 || { echo >&2 "exa not found, fallback to ls"; }

if hash exa >/dev/null ; then
    alias sl=exa
    alias ls='exa'        # Compact view, show colors
    alias la='exa -a'      # Compact view, show hidden
    alias ll='exa -al'     # Preferred 'ls' implementation
    alias l='exa -l'
    alias l1='exa -1'
else
    alias sl=ls
    alias ls='ls -G'        # Compact view, show colors
    alias la='ls -AF'       # Compact view, show hidden
    alias ll='ls -FGlAhp' # Preferred 'ls' implementation
    alias l='ls -a'
    alias l1='ls -1'
fi
if [[ $OS == "Linux" ]]; then
  alias ls="ls --color=auto"
fi

# Move arround
alias cd..='cd ../' # Go back 1 directory level (for fast typers)
alias ..='cd ../' # Go back 1 directory level
alias ...='cd ../../' # Go back 2 directory levels
alias ....='cd ../../..' # Go up three directories
alias .4='cd ../../../../' # Go back 4 directory levels
alias .5='cd ../../../../../' # Go back 5 directory levels
alias .6='cd ../../../../../../' # Go back 6 directory levels
alias -- -='cd -'        # Go back
alias ~="cd ~" # ~: Go Home

# Directory
alias	md='mkdir -p'
alias	rd='rmdir'
alias cp='cp -iv' # Confirm before overwriting
alias mv='mv -iv' # Confirm before overwriting
alias mkdir='mkdir -pv' # Preferred 'mkdir' implementation
mcd () { mkdir -p "$1" && cd "$1"; } # mcd: Makes new Dir and jumps inside
# Shell
alias h='history'
alias _="sudo"
alias c='clear'
alias k='clear'
alias cls='clear'
alias edit="$EDITOR"
alias e="$EDITOR"
# alias q='exit'
# Disks
alias df='df -h'      # Human-readable sizes
alias free='free -m'  # Show sizes in MB
alias py='python'
alias pipdate="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
alias jl='julia'
alias jlup='julia -e "Pkg.update()"'

which gshuf &> /dev/null
if [ $? -eq 0 ]; then
  alias shuf=gshuf
fi

# Ascii image viewer
ascii () { convert "$1" pnm:- | aview }

# Tree
if [ ! -x "$(which tree 2>/dev/null)" ]; then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

# alias which='type -all' # which: Find executables
alias path='echo -e ${PATH//:/\\n}' # path: Echo all executable Paths
alias show_options='setopt' # Show_options: display zsh options settings

# Find
alias qfind="find . -name " # qfind: Quickly search for file
ff () { /usr/bin/find . -name "$@" ; } # ff: Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; } # ffs: Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; } # ffe: Find file whose name ends with a given string


# findPid: find out the pid of a specified process
# -----------------------------------------------------
# Note that the command name can be specified via a regex
# E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
# Without the 'sudo' it will only find processes of the current user
# -----------------------------------------------------
findPid () { lsof -t -c "$@" ; }


# my_ps: List processes owned by my user:
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

#======================================== Networking
alias serve='python3 -m http.server'
alias netCons='lsof -i' # netCons: Show all open TCP/IP sockets
alias lsock='sudo /usr/sbin/lsof -i -P' # lsock: Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP' # lsockU: Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP' # lsockT: Display only open TCP sockets
alias openPorts='sudo lsof -i | grep LISTEN' # openPorts: All listening connections
alias showBlocked='sudo ipfw list' # showBlocked: All ipfw rules inc/ blocked IPs

#======================================== Development
# Atom editor
function a () {
  if [[ -n $1 ]]; then
    atom "$1"
  else
    atom .
  fi
}

alias apmup='apm update --no-confirm'
alias editHosts='sudo edit /etc/hosts' # editHosts: Edit /etc/hosts file

#======================================== Git
# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] )) ; then
  alias git=$hub_path
fi

alias g='git'
alias get='git'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gll='git log --graph --pretty=oneline --abbrev-commit'
alias gg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gus='git reset HEAD'
alias gp='git push origin HEAD'
alias gm="git merge"
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gdv='git diff -w "$@" | vim -R -'
alias gcount='git shortlog -sn'
alias gexport='git archive --format zip --output'

# lolcommits
function commitlapse() {
  CWD=$(pwd)
  cd ~/.lolcommits
  convert `find . -type f -name "*.jpg" -print0 | xargs -0 ls -tlr | awk '{print $9}'` ~/Desktop/timelapse.mpeg
  cd $CWD
}
function lallcommits() {
    echo "Enabling lolcomits for all repos in the project folder"
    for D in `ls -d $PROJECTS_FOLDER/*/`
    do
	      echo "Enabling lolcomits in: $D";
	      cd $D;
	      lolcommits -e;
    done
}

#======================================== Tmux
alias txl='tmux ls'
alias txn='tmux new -s'
alias txa='tmux a -t'

#======================================== ZSH
alias reload!='. ~/.zshrc'
test_colors() {
  for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"
}

#======================================== MacOS
if [[ $OS == "Darwin" ]]; then
  source $DZSH/zsh/mac.zsh
fi
