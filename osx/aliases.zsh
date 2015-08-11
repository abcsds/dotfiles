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
