
# ====================== Antigen ======================

# Source Antigen
source $(brew --prefix)/share/antigen/antigen.zsh
# When in trouble: rm -rf $(brew --prefix)/share/antigen/.cache

# ======= Antigen Plugins for zsh =======

# Alias-tips
antigen bundle djui/alias-tips

# Do gitiginore files right from zsh
antigen bundle voronkovich/gitignore.plugin.zsh

# Git rebase
# antigen bundle smallhadroncollider/antigen-git-rebase

# Autosugestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Navegation tools
# source /usr/local/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh

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
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# bind P and N for EMACS mode
# bindkey -M emacs "^P" history-substring-search-up
# bindkey -M emacs "^N" history-substring-search-down
# bind k and j for VI mode
# bindkey -M vicmd "k" history-substring-search-up
# bindkey -M vicmd "j" history-substring-search-down

# Tell antigen that you're done.
antigen apply
