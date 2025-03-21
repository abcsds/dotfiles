# Setup plugins
# if [[ $DISTRO == "Arch" ]]; then
#   # echo "Antibody for Arch"
#   if ! type antibody > /dev/null; then
#     if ! type pamac > /dev/null; then
#       echo "ERROR: pamac not installed"
#       exit 1
#     else
#       pamac build antibody
#     fi
#   fi
# 
# elif [[ $DISTRO == "Manjaro" ]]; then
#   # echo "Antibody for Manjaro"
#   if ! type antibody > /dev/null; then
#     if ! type pamac > /dev/null; then
#       echo "ERROR: pamac not installed"
#       exit 1
#     else
#       pamac build antibody
#     fi
#   fi
# fi
# 
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

# Powerlevel9k
# if [[ $CONSOLE == "terminal" ]]; then
#   source $DZSH/zsh/theme.zsh
#   antibody bundle bhilburn/powerlevel9k
# fi
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

# substring search settings
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=8'
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=1'
# HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS='c'
# HISTORY_SUBSTRING_SEARCH_FUZZY='true'

# autosuggestions settings
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
