#======================================== General

# List directory contents

command -v exa >/dev/null 2>&1 || { echo >&2 "exa not found, fallback to ls"; }

if hash exa 2>/dev/null ; then
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
alias cp='cp -iv' # Preferred 'cp' implementation
alias mv='mv -iv' # Preferred 'mv' implementation
alias mkdir='mkdir -pv' # Preferred 'mkdir' implementation
mcd () { mkdir -p "$1" && cd "$1"; } # mcd: Makes new Dir and jumps inside


alias _="sudo"

if [ $(uname) = "Linux" ]
then
  alias ls="ls --color=auto"
fi

which gshuf &> /dev/null
if [ $? -eq 0 ]
then
  alias shuf=gshuf
fi

alias c='clear'
alias k='clear'
alias cls='clear'

alias edit="$EDITOR"
alias e="$EDITOR"

# alias q='exit'

alias rb='ruby'
alias py='python'
alias jl='julia'

# Shell History
alias h='history'

# Ascii image viewer
ascii () { convert "$1" pnm:- | aview }

# Tree
if [ ! -x "$(which tree 2>/dev/null)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi


# MacOS
if [ $(uname) = "Darwin" ]
then
  alias f='open -a Finder ./' # f: Opens current directory in MacOS Finder
  trash () { command mv "$@" ~/.Trash ; } # trash: Moves a file to the MacOS trash
  ql () { qlmanage -p "$*" >& /dev/null; } # ql: Opens any file in MacOS Quicklook Preview
  spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }
  alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"
  # finderShowHidden: Show hidden files in Finder
  # finderHideHidden: Hide hidden files in Finder
  # -------------------------------------------------------------------
  alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
  alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

  # cleanupLS: Clean up LaunchServices to remove duplicates in the "Open With" menu
  # -----------------------------------------------------------------------------------
  alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

  # screensaverDesktop: Run a screensaver on the Desktop
  # -----------------------------------------------------------------------------------
  alias screensaverDesktop='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'

fi

# Some more goodies
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

# ttop: Recommended 'top' invocation to minimize resources
# ------------------------------------------------------------
# Taken from this macosxhints article
# http://www.macosxhints.com/article.php?story=20060816123853639
# ------------------------------------------------------------
alias ttop="top -R -F -s 10 -o rsize"

# my_ps: List processes owned by my user:
# ------------------------------------------------------------
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }


# ---------------------------
# NETWORKING
# ---------------------------
if [ $(uname) = "Darwin" ]
then
  alias flushDNS='dscacheutil -flushcache' # flushDNS: Flush out the DNS Cache
  alias ipInfo0='ipconfig getpacket en0' # ipInfo0: Get info on connections for en0
  alias ipInfo1='ipconfig getpacket en1' # ipInfo1: Get info on connections for en1
  alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport' # Airport Utility
  alias spoofEMac='sudo ifconfig en0 ether 00:11:22:33:44:55' # Change MacAddress on ethernet interface
  alias spoofWMac='sudo ifconfig en1 ether 00:11:22:33:44:55' # Change MacAddress on wireless interface
  ## airport en1 sniff 6
  ## aircrack-ng -c -s -a 2 -b 90:c7:92:76:93:20 -l ~/Desktop/key.txt /tmp/airportSnifflSDKx8.cap
fi
alias netCons='lsof -i' # netCons: Show all open TCP/IP sockets
alias lsock='sudo /usr/sbin/lsof -i -P' # lsock: Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP' # lsockU: Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP' # lsockT: Display only open TCP sockets
alias openPorts='sudo lsof -i | grep LISTEN' # openPorts: All listening connections
alias showBlocked='sudo ipfw list' # showBlocked: All ipfw rules inc/ blocked IPs


# ii: display useful host related informaton
# -------------------------------------------------------------------
# ii() {
# echo -e "\nYou are logged on ${RED}$HOST"
# echo -e "\nAdditionnal information:$NC " ; uname -a
# echo -e "\n${RED}Users logged on:$NC " ; w -h
# echo -e "\n${RED}Current date :$NC " ; date
# echo -e "\n${RED}Machine stats :$NC " ; uptime
# echo -e "\n${RED}Current network location :$NC " ; scselect
# echo -e "\n${RED}Public facing IP Address :$NC " ;myip
# #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
# echo
# }

# ---------------------------------------
# WEB DEVELOPMENT
# ---------------------------------------

# alias apacheEdit='sudo edit /etc/httpd/httpd.conf' # apacheEdit: Edit httpd.conf
# alias apacheRestart='sudo apachectl graceful' # apacheRestart: Restart Apache
alias editHosts='sudo edit /etc/hosts' # editHosts: Edit /etc/hosts file
alias herr='tail /var/log/httpd/error_log' # herr: Tails HTTP error logs
# alias apacheLogs="less +F /var/log/apache2/error_log" # Apachelogs: Shows apache error logs
# httpHeaders () { /usr/bin/curl -I -L $@ ; } # httpHeaders: Grabs headers from web page

# httpDebug: Download a web page and show info on what took time
# -------------------------------------------------------------------
# httpDebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }


# ---------------------------------------
# REMINDERS & NOTES
# ---------------------------------------

# remove_disk: spin down unneeded disk
# ---------------------------------------
# diskutil eject /dev/disk1s3

# to change the password on an encrypted disk image:
# ---------------------------------------
# hdiutil chpass /path/to/the/diskimage

# to mount a read-only disk image as read-write:
# ---------------------------------------
# hdiutil attach example.dmg -shadow /tmp/example.shadow -noverify

# mounting a removable drive (of type msdos or hfs)
# ---------------------------------------
# mkdir /Volumes/Foo
# ls /dev/disk* to find out the device to use in the mount command)
# mount -t msdos /dev/disk1s1 /Volumes/Foo
# mount -t hfs /dev/disk1s1 /Volumes/Foo

# to create a file of a given size: /usr/sbin/mkfile or /usr/bin/hdiutil
# ---------------------------------------
# e.g.: mkfile 10m 10MB.dat
# e.g.: hdiutil create -size 10m 10MB.dmg
# the above create files that are almost all zeros - if random bytes are desired
# then use: ~/Dev/Perl/randBytes 1048576 > 10MB.dat

#======================================== Git
# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
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

#======================================== Homebrew
if test "$(uname)" = "Darwin"
then
    alias bup='brew update && brew upgrade --all'
    alias bupc='brew update && brew upgrade --all && brew cleanup'
    alias bout='brew outdated'
    alias bin='brew install'
    alias brm='brew uninstall'
    alias bcl='brew cleanup'
    alias bls='brew list'
    alias bsr='brew search'
    alias binf='brew info'
    alias bdr='brew doctor'
    alias bed='brew edit'
fi

#======================================== Homebrew Cask
if test "$(uname)" = "Darwin"
then
    # Some aliases for Homebrew Cask
    alias bcup='brew-cask update'
    alias bcin='brew-cask install'
    alias bcrm='brew-cask uninstall'
    alias bczp='brew-cask zap'
    alias bccl='brew-cask cleanup'
    alias bcsr='brew-cask search'
    alias bcls='brew-cask list'
    alias bcinf='brew-cask info'
    alias bcdr='brew-cask doctor'
    alias bced='brew-cask edit'
fi

#======================================== OSX
if test "$(uname)" = "Darwin"
then
    # Desktop Programs
    alias preview="open -a '$PREVIEW'"
    alias xcode="open -a '/Applications/XCode.app'"
    alias filemerge="open -a '/Developer/Applications/Utilities/FileMerge.app'"
    alias safari="open -a safari"
    alias chrome="open -a google\ chrome"
    alias f='open -a Finder '
    alias fh='open -a Finder .'

    # Get rid of those pesky .DS_Store files recursively
    alias dsclean='find . -type f -name .DS_Store -delete'

    # Show/hide hidden files (for Mac OS X Mavericks)
    alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE"
    alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE"

    # Use Finder's Quick Look on a file (^C or space to close)
    alias ql='qlmanage -p 2>/dev/null'

    # Mute/Unmute the system volume. Plays nice with all other volume settings.
    alias mute="osascript -e 'set volume output muted true'"
    alias unmute="osascript -e 'set volume output muted false'"

fi

#======================================== Tmux
alias txl='tmux ls'
alias txn='tmux new -s'
alias txa='tmux a -t'

#======================================== Xcode
alias ios="open /Applications/Xcode.app/Contents/Applications/iOS\ Simulator.app"

#======================================== ZSH
alias reload!='. ~/.zshrc'
test_colors() {
  for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"
}
