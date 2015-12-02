# TODO list
just some notes for myself.

## Plugins
 - bower
 - django

## UPDATES

### Update App Store apps
sudo softwareupdate -i -a
### Update Homebrew (Cask) & packages
brew update
brew upgrade
### Update npm & packages
npm install npm -g
npm update -g
### Update Ruby & gems
sudo gem update —system
sudo gem update

## vim plugins
https://github.com/alebcay/awesome-shell
https://github.com/gabrielelana/awesome-terminal-fonts
https://github.com/ryanoasis/vim-devicons
https://github.com/ryanoasis/nerd-fonts

## for server:
 sudo apt-get install zsh vim tmux python-pip ruby ruby-dev make gcc nodejs curl elinks build-essential docker.io fbv
 sudo pip install virtualenv virtualenvwrapper
 sudo gem install jekyll


gem install lolcommits
gem install jekyll

## SSH
github ssh:

Host github.com
  Hostname ssh.github.com
  Port 443

VPN

git-extras

# tidal
brew install liblo libsndfile libsamplerate

cabal update
cabal install cabal-install
cabal install tidal


# lolcommits timelapse

```
convert `find . -type f -name "*.jpg" -print0 | xargs -0 ls -tlr | awk '{print $9}'` timelapse.mpeg
```
