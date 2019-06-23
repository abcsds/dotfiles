if [[ $OS == 'Darwin' ]]
then
   export ZPLUG_HOME=/usr/local/opt/zplug
   source $ZPLUG_HOME/init.zsh
elif [[ $OS == 'Linux' ]]
    if [[ ! -d ~/.zplug ]] ;then
        git clone https://github.com/b4b4r07/zplug ~/.zplug
    fi
    export ZPLUG_HOME=~/.zplug
    source $ZPLUG_HOME/init.zsh
fi

# Manage zplug with zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Alias-tips
zplug "djui/alias-tips", from:github, defer:2

# Use cd with tab
zplug "changyuheng/zsh-interactive-cd", from:github, defer:2

# Tmux session manager
zplug "RobertAudi/tsm", from:github, defer:3

# gitignore creation
# use example: `gi emacs` 'gii emacs'
zplug "voronkovich/gitignore.plugin.zsh", from:github, defer:3

# Autosugestions
zplug "zsh-users/zsh-autosuggestions", from:github, defer:1

# Navigation tools
zplug "psprint/zsh-navigation-tools", from:github, defer:3

# Syntax highlighting
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:1

# Search substring
zplug "zsh-users/zsh-history-substring-search"

# Load if "if" tag returns true
# zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

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

# Powerlevel9k
if [[ $CONSOLE == "terminal" ]]; then
  source $DZSH/zsh/theme.zsh
  zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
fi

if [[ $(zplug check) ]]; then
    zplug install
fi

zplug load
