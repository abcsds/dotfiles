# Aliases that work only on MacOSX
#======================================== Homebrew
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

#======================================== Homebrew Cask

# # Some aliases for Homebrew Cask
# alias bcup='brew-cask update'
# alias bcin='brew-cask install'
# alias bcrm='brew-cask uninstall'
# alias bczp='brew-cask zap'
# alias bccl='brew-cask cleanup'
# alias bcsr='brew-cask search'
# alias bcls='brew-cask list'
# alias bcinf='brew-cask info'
# alias bcdr='brew-cask doctor'
# alias bced='brew-cask edit'

#======================================== Networking

alias flushDNS='dscacheutil -flushcache' # flushDNS: Flush out the DNS Cache
alias ipInfo0='ipconfig getpacket en0' # ipInfo0: Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1' # ipInfo1: Get info on connections for en1
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport' # Airport Utility
alias spoofEMac='sudo ifconfig en0 ether 00:11:22:33:44:55' # Change MacAddress on ethernet interface
alias spoofWMac='sudo ifconfig en1 ether 00:11:22:33:44:55' # Change MacAddress on wireless interface

#======================================== Desktop Programs
alias preview="open -a '$PREVIEW'"
alias xcode="open -a '/Applications/XCode.app'"
alias filemerge="open -a '/Developer/Applications/Utilities/FileMerge.app'"
alias safari="open -a safari"
alias chrome="open -a google\ chrome"
alias f='open -a Finder ./'
trash () { command mv "$@" ~/.Trash ; } # trash: Moves a file to the MacOS trash
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

# cleanupLS: Clean up LaunchServices to remove duplicates in the "Open With" menu
alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# screensaverDesktop: Run a screensaver on the Desktop
alias screensaverDesktop='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'

# Show/hide hidden files (for Mac OS X Mavericks)
alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE"

# Use Finder's Quick Look on a file (^C or space to close)
alias ql='qlmanage -p 2>/dev/null'
# ql () { qlmanage -p "$*" >& /dev/null; }

# Mute/Unmute the system volume. Plays nice with all other volume settings.
alias mute="osascript -e 'set volume output muted true'"
alias unmute="osascript -e 'set volume output muted false'"

#======================================== Xcode
alias ios="open /Applications/Xcode.app/Contents/Applications/iOS\ Simulator.app"


# ttop: Recommended 'top' invocation to minimize resources
# ------------------------------------------------------------
# Taken from this macosxhints article
# http://www.macosxhints.com/article.php?story=20060816123853639
# ------------------------------------------------------------
alias ttop="top -R -F -s 10 -o rsize"
