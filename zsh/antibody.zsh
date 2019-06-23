# Setup plugins

# Powerlevel9k
source $DZSH/zsh/theme.zsh


if [[ $DISTRO == "Arch" ]]; then
  # echo "Antibody for Arch"
  if ! type antibody > /dev/null; then
    if ! type yay > /dev/null; then
      echo "ERROR: yay not installed"
      exit 1
    else
      yay -S antibody
    fi
  fi

elif [[ $DISTRO == "Manjaro" ]]; then
  # echo "Antibody for Manjaro"
  if ! type antibody > /dev/null; then
    if ! type yay > /dev/null; then
      echo "ERROR: yay not installed"
      exit 1
    else
      yay -S antibody
    fi
  fi
fi

# =========== Static loading (faster)
# if [[ ! -f $DZSH/zsh/ant_plugins.sh ]]; then
#   source <(antibody init)
#   antibody bundle < $DZSH/zsh/plugins.txt > $DZSH/zsh/ant_plugins.sh
# fi

# If all else fails, call this function and restart
# function load_antibody() {
#   source <(antibody init)
#   antibody bundle < $DZSH/zsh/plugins.txt > $DZSH/zsh/ant_plugins.sh
# }

# Start antibody
# source $DZSH/zsh/ant_plugins.sh


# =========== Dynamic loading
source <(antibody init)
if [[ $CONSOLE == "terminal" ]]; then
  antibody bundle bhilburn/powerlevel9k
fi
antibody bundle < $DZSH/zsh/plugins.txt

# Substring search key bindings
# bind UP and DOWN arrow keys
# zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
