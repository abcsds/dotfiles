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

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt COMPLETE_ALIASES
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_IGNORE_DUPS  # don't record an entry that was just recorded again
setopt HIST_REDUCE_BLANKS
setopt BANG_HIST # Treat the `!` specially during expansion
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicates first when trimming history
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

setopt AUTO_CD # No cd needed to change directories

zle -N newtab

# Fallback PROMPT

# vcs
zstyle ':vcs_info:*' enable git
precmd() {
    vcs_info
}

setopt prompt_subst

ZSH_THEME_GIT_PROMPT_DIRTY="%F{yellow}*%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""

parse_git_dirty() {
  if command git diff-index --quiet HEAD 2> /dev/null; then
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  else
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  fi
}

zstyle ':vcs_info:git*'           formats "$(parse_git_dirty)[%b] %F{green}%c%f %F{yellow}%u%f"
zstyle ':vcs_info:*'              check-for-changes true
# zstyle ':vcs_info:*:prompt:*'     check-for-changes true
# zstyle ':vcs_info:*:prompt:*'     stagedstr         "%{$fg[green]%}*%{$reset_color%}"
# zstyle ':vcs_info:*:prompt:*'     unstagedstr       "%{$fg[red]%}*%{$reset_color%}"
# zstyle ':vcs_info:*:prompt:*'     branchformat      "%r"
# zstyle ':vcs_info:*:prompt:*'     formats           "%u%c%{$fg[green]%}[%b]%{$reset_color%}"
# zstyle ':vcs_info:*:prompt:*'     nvcsformats       ""

# exit code
function check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    local EXIT_CODE_PROMPT=%F{red}$LAST_EXIT_CODE%f
    echo "$EXIT_CODE_PROMPT"
  fi
}

setprompt() {
  setopt prompt_subst

  if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
    p_host='%F{yellow}%M%f'
  else
    p_host='%F{green}%M%f'
  fi

  PS1=${(j::Q)${(Z:Cn:):-$'
    %(!.%F{red}%n%f.%F{white}%n%f)
    @
    %F{cyan}%m%f
    ": "
    %2~
    " "
    %(!.%F{red}%#%f.%F{green}\$%f)
  '}}

  PS2=$'%_>'
  # RPROMPT=$'${vcs_info_msg_0_} %(?0..%F{red}%?%f)'
  RPROMPT=$'${vcs_info_msg_0_} ${check_last_exit_code}'
}
setprompt
