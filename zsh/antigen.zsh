
# ====================== Antigen ======================

[[ -a ~/.zcompdump* ]] && rm -f ~/.zcompdump*
# Source Antigen
if [ "$(uname -s)"=="Darwin" ]
then
  source $(brew --prefix)/share/antigen/antigen.zsh
else
  source ~/.dotfiles/antigen/antigen.zsh
fi

# When in trouble: rm -rf $(brew --prefix)/share/antigen/.cache

# ======= Antigen Plugins for zsh =======

# Alias-tips
antigen bundle djui/alias-tips

# Do gitiginore files right from zsh
antigen bundle voronkovich/gitignore.plugin.zsh

# Git rebase
# antigen bundle smallhadroncollider/antigen-git-rebase

# Autosugestions
antigen bundle zsh-users/zsh-autosuggestions

# Navegation tools
antigen bundle psprint/zsh-navigation-tools

# == Syntax highlighting ==
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
antigen bundle zsh-users/zsh-syntax-highlighting

# ======= History look up  =======
antigen bundle zsh-users/zsh-history-substring-search

# bind UP and DOWN arrow keys
# zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# bind P and N for EMACS mode
# bindkey -M emacs "^P" history-substring-search-up
# bindkey -M emacs "^N" history-substring-search-down
# bind k and j for VI mode
# bindkey -M vicmd "k" history-substring-search-up
# bindkey -M vicmd "j" history-substring-search-down



# ======= Set up the theme =======
# TODO: fix this mess :P
# POWERLEVEL9K_INSTALLATION_PATH=~/.dotfiles/antigen/antigen.symlink/bundles/bhilburn/powerlevel9k
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

# Load the powerlevel9k theme
antigen theme bhilburn/powerlevel9k powerlevel9k
POWERLEVEL9K_MODE="awesome-patched"

# https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
# The segments that are currently available are:

# aws - The current AWS profile, if active (more info below)
# context - Your username and host (more info below)
# dir - Your current working directory.
# history - The command number for the current line.
# node_version - Show the version number of the installed Node.js.
# rbenv - Ruby environment information (if one is active).
# rspec_stats - Show a ratio of test classes vs code classes for RSpec.
# status - The return code of the previous command, and status of background jobs.
# symfony2_tests - Show a ratio of test classes vs code classes for Symfony2.
# symfony2_version - Show the current Symfony2 version, if you are in a Symfony2-Project dir.
# time - System time.
# virtualenv - Your Python VirtualEnv.
# vcs - Information about this git or hg repository (if you are in one).

# Show promt on next line
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
# POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="↳ "

# Disable right prompt
# POWERLEVEL9K_DISABLE_RPROMPT=true

# Segment separators
# POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$"\uE0B1"
# POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$"\uE0B3"

# Light colorscheme
# POWERLEVEL9K_COLOR_SCHEME="light"

# Segment customization
# Colors at: http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html

# Customizing `context` colors for root and non-root users
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="240"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="015"
# POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="red"
# POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="blue"

# Customizing `dir`
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_DIR_BACKGROUND="029"
POWERLEVEL9K_DIR_FOREGROUND="000"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

# Customizing `time`
# POWERLEVEL9K_TIME_FOREGROUND="red"
# POWERLEVEL9K_TIME_BACKGROUND="blue"
# POWERLEVEL9K_TIME_FORMAT="%D{%S:%M:%H}"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"

# Customizing `virtualenv` colors
POWERLEVEL9K_VIRTUALENV_BACKGROUND="214"
POWERLEVEL9K_VIRTUALENV_FOREGROUND="000"
# Customizing `rbenv` colors
POWERLEVEL9K_RBENV_BACKGROUND="214"
POWERLEVEL9K_RBENV_FOREGROUND="000"

# Customizing `status`
POWERLEVEL9K_STATUS_VERBOSE="false"

# These Segments; context, vcs, rspec_stats, symfony2_tests, have additional color options

# Advanced `vcs` customization
# POWERLEVEL9K_HIDE_BRANCH_ICON="false"
# POWERLEVEL9K_SHOW_CHANGESET="true"
# POWERLEVEL9K_CHANGESET_HASH_LENGTH="6"
POWERLEVEL9K_VCS_FOREGROUND="000"
POWERLEVEL9K_VCS_BACKGROUND="002"
# POWERLEVEL9K_VCS_DARK_FOREGROUND="000"
# If VCS changes are detected:
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="000"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="048"

# Putting it together
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs rbenv virtualenv)

# ======= End theme setup =======

antigen use oh-my-zsh

# Tell antigen that you're done.
antigen apply
