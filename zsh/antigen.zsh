
# ====================== Antigen ======================

# Source Antigen
source $(brew --prefix)/share/antigen/antigen.zsh
# When in trouble: rm -rf $(brew --prefix)/share/antigen/.cache

# ======= Antigen Plugins for zsh =======

# antigen use oh-my-zsh
# antigen bundle --loc=lib

# Alias-tips
# antigen bundle djui/alias-tips

# Do gitiginore files right from zsh
# antigen bundle voronkovich/gitignore.plugin.zsh

# View vim plugin manuals from zsh
# antigen bundle yonchu/vimman

# Autosugestions
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Navegation tools
# source /usr/local/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh

# Autoenv
# antigen bundle kennethreitz/autoenv

# Virtualenv
# antigen bundle virtualenv

# ======= Set up the theme =======

# Load the powerlevel9k theme
antigen theme bhilburn/powerlevel9k powerlevel9k
POWERLEVEL9K_MODE='awesome-patched'

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

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv context dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs rbenv)

# Limit to the last two folders
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

# Show promt on next line
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
# POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="↳ "

# Disable right prompt
# POWERLEVEL9K_DISABLE_RPROMPT=true

# Segment separators
# POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0B1'
# POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0B3'

# Light colorscheme
# POWERLEVEL9K_COLOR_SCHEME='light'

# Segment customization
# Colors at: http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html

# Customizing `context` colors for root and non-root users
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="236"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="white"
# POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="red"
# POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="blue"

# Customizing `dir` colors
POWERLEVEL9K_DIR_BACKGROUND="cyan"
POWERLEVEL9K_DIR_FOREGROUND="000"
# POWERLEVEL9K_DIR_FOREGROUND="white"

# Customizing `time` colors
# POWERLEVEL9K_TIME_FOREGROUND='red'
# POWERLEVEL9K_TIME_BACKGROUND='blue'

# Customizing `virtualenv` colors
POWERLEVEL9K_VIRTUALENV_BACKGROUND="002"
POWERLEVEL9K_VIRTUALENV_FOREGROUND="white"

# These Segments; context, vcs, rspec_stats, symfony2_tests, have additional color options

# Advanced `vcs` color customization
POWERLEVEL9K_VCS_FOREGROUND='007'
POWERLEVEL9K_VCS_DARK_FOREGROUND='black'
POWERLEVEL9K_VCS_BACKGROUND='025'
# If VCS changes are detected:
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='007'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='028'

# rspec_stats for good test coverage
# POWERLEVEL9K_RSPEC_STATS_GOOD_FOREGROUND='blue'
# POWERLEVEL9K_RSPEC_STATS_GOOD_BACKGROUND='green'
# rspec_stats for average test coverage
# POWERLEVEL9K_RSPEC_STATS_AVG_FOREGROUND='black'
# POWERLEVEL9K_RSPEC_STATS_AVG_BACKGROUND='cyan'
# rspec_stats for poor test coverage
# POWERLEVEL9K_RSPEC_STATS_BAD_FOREGROUND='red'
# POWERLEVEL9K_RSPEC_STATS_BAD_BACKGROUND='white'

# symfony2_tests for good test coverage
# POWERLEVEL9K_SYMFONY2_TESTS_GOOD_FOREGROUND='blue'
# POWERLEVEL9K_SYMFONY2_TESTS_GOOD_BACKGROUND='green'
# symfony2_tests for average test coverage
# POWERLEVEL9K_SYMFONY2_TESTS_AVG_FOREGROUND='black'
# POWERLEVEL9K_SYMFONY2_TESTS_AVG_BACKGROUND='cyan'
# symfony2_tests for poor test coverage
# POWERLEVEL9K_SYMFONY2_TESTS_BAD_FOREGROUND='red'
# POWERLEVEL9K_SYMFONY2_TESTS_BAD_BACKGROUND='white'

# ======= End theme setup =======

# == Syntax highlighting ==
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
# antigen bundle zsh-users/zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ======= History look up  =======

# antigen bundle zsh-users/zsh-history-substring-search
source /usr/local/opt/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind UP and DOWN arrow keys
# zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# bind P and N for EMACS mode
# bindkey -M emacs '^P' history-substring-search-up
# bindkey -M emacs '^N' history-substring-search-down
# bind k and j for VI mode
# bindkey -M vicmd 'k' history-substring-search-up
# bindkey -M vicmd 'j' history-substring-search-down

# Tell antigen that you're done.
antigen apply
