# List directory contents
alias sl=ls
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -FGlAhp' # Preferred 'ls' implementation
alias l='ls -a'
alias l1='ls -1'

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
alias show_options='shopt' # Show_options: display bash options settings
alias fix_stty='stty sane' # fix_stty: Restore terminal settings when screwed up
alias cic='set completion-ignore-case On' # cic: Make tab-completion case-insensitive

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
fi
alias netCons='lsof -i' # netCons: Show all open TCP/IP sockets
alias lsock='sudo /usr/sbin/lsof -i -P' # lsock: Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP' # lsockU: Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP' # lsockT: Display only open TCP sockets
alias openPorts='sudo lsof -i | grep LISTEN' # openPorts: All listening connections
alias showBlocked='sudo ipfw list' # showBlocked: All ipfw rules inc/ blocked IPs
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport' # Airport Utility
alias spoofEMac='sudo ifconfig en0 ether 00:11:22:33:44:55' # Change MacAddress on ethernet interface
alias spoofWMac='sudo ifconfig en1 ether 00:11:22:33:44:55' # Change MacAddress on wireless interface
## airport en1 sniff 6
## aircrack-ng -c -s -a 2 -b 90:c7:92:76:93:20 -l ~/Desktop/key.txt /tmp/airportSnifflSDKx8.cap

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
