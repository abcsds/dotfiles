if [[ $DISTRO == "Arch" ]]
then
# echo "Antibody for Arch"
  if ! type antibody > /dev/null; then
    if ! type yay > /dev/null; then
      echo "ERROR: yay not installed"
      exit 1
    else
      yay -S antibody
      source <(antibody init)
      antibody bundle < $DZSH/zsh/plugins.txt > $DZSH/zsh/ant_plugins.sh
    fi
  fi

elif [[ $DISTRO == "Manjaro" ]]
then
# echo "Antibody for Manjaro"
  if ! type antibody > /dev/null; then
    if ! type yay > /dev/null; then
      echo "ERROR: yay not installed"
      exit 1
    else
      yay -S antibody
      source <(antibody init)
      antibody bundle < $DZSH/zsh/plugins.txt > $DZSH/zsh/ant_plugins.sh
    fi
  fi
fi

# Start antibody
source $DZSH/zsh/ant_plugins.sh

# Substring search key bindings
# bind UP and DOWN arrow keys
# zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# Powerlevel9k
if [[ $CONSOLE == "terminal" ]]
then
  source $DZSH/zsh/theme.zsh
fi
