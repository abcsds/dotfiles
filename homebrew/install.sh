#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    OSTYPE="Darwin"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
    if ! type "apt-get" > /dev/null; then
      sudo apt-get install build-essential
    elif ! type "yum" > /dev/null; then
      sudo yum groupinstall 'Development Tools'
    fi
  fi
else
  brew update
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all


# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install grc coreutils spark
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install zsh
brew install zsh-completions
brew tap homebrew/versions

# Install `wget` with IRI support and curl
brew install wget --with-iri
brew install curl


# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install macvim
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

# Tap science and computing
brew tap homebrew/science
brew install boost
brew install cmake
brew install doxygen
brew install gnuplot
brew install node
brew install octave
brew install plotutils
brew install pyqt
brew install pyside
brew install r
brew install sdcc

# Install DBMSs
# brew install mongodb
# brew install mysql
# brew install postgresql
# brew install sqlite

# Install Python:
brew install python
brew install python3

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2
brew install fontconfig

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install binutils
brew install dns2tcp
brew install fcrackzip
brew install hydra
brew install john
brew install nmap
brew install pngcheck
brew install ucspi-tcp # `tcpserver` etc.

# Install other useful binaries.
brew install ack
brew install dark-mode
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install speedtest_cli
brew install tree

brew install elinks
brew install geoip
brew install gibo
brew install git-flow
brew install graphicsmagick
brew install htop-osx
brew install httpd24
brew install iftop
brew install netcat
brew install nethack
brew install ntopng
brew install pixman
brew install proxychains-ng
brew install qt
brew install sdl
brew install snort
brew install tor
brew install wireshark

# Remove outdated versions from the cellar.
brew cleanup

# exit 0
