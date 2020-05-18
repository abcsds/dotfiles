export CLICOLOR=true

fpath=($DZSH/functions $fpath)

autoload -U $DZSH/functions/*(:t)
autoload -Uz vcs_info

autoload -Uz run-help-git
autoload -Uz run-help-ip
autoload -Uz run-help-openssl
autoload -Uz run-help-p4
autoload -Uz run-help-sudo
autoload -Uz run-help-svk
autoload -Uz run-help-svn

HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
WORDCHARS=${WORDCHARS//\/[&.;]}         # Don't consider certain characters part of the word

setopt NO_BG_NICE                       # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS                    # allow functions to have local options
setopt LOCAL_TRAPS                      # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY                    # share history between sessions
setopt EXTENDED_HISTORY                 # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt COMPLETE_ALIASES
setopt IGNORE_EOF
setopt APPEND_HISTORY                   # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS             # don't record dupes in history
setopt HIST_IGNORE_DUPS                 # don't record an entry that was just recorded again
setopt HIST_REDUCE_BLANKS
setopt BANG_HIST                        # Treat the `!` specially during expansion
setopt HIST_EXPIRE_DUPS_FIRST           # Expire duplicates first when trimming history
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

setopt correct                          # Auto correct mistakes
setopt extendedglob                     # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                       # Case insensitive globbing
setopt rcexpandparam                    # Array expansion with parameters
setopt nocheckjobs                      # Don't warn about running processes when exiting
setopt numericglobsort                  # Sort filenames numerically when it makes sense
setopt nobeep                           # No beep
setopt appendhistory                    # Immediately append history instead of overwriting
setopt histignorealldups                # If a new command is a duplicate, remove the older one
setopt autocd                           # if only directory path is entered, cd there.
setopt prompt_subst                     # enable substitution for prompt


# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

setopt AUTO_CD # No cd needed to change directories

zle -N newtab

## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                 # Home key
bindkey '^[[H' beginning-of-line                  # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line  # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                       # End key
bindkey '^[[F' end-of-line                        # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line         # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                    # Insert key
bindkey '^[[3~' delete-char                       # Delete key
bindkey '^[[C'  forward-char                      # Right key
bindkey '^[[D'  backward-char                     # Left key
bindkey '^[[5~' history-beginning-search-backward # Page up key
bindkey '^[[6~' history-beginning-search-forward  # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                       #
bindkey '^[Od' backward-word                      #
bindkey '^[[1;5D' backward-word                   #
bindkey '^[[1;5C' forward-word                    #
bindkey '^H' backward-kill-word                   # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                               # Shift+tab undo last action


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Theming section
# autoload -U compinit colors zcalc
# compinit -d
autoload -U colors && colors

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r
