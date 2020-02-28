# Left prompt
# PROMPT="%B[%F{004}%n%f@%F{010}%m%f %F{015}%1~%f] %(?.%F{cyan}.%F{red})%(!.#.>>>)%f%b "
PROMPT="%B[%{$fg[004]%}%n%{$reset_color%}@%{$fg[010]%}%m%{$reset_color%} %{$fg[015]%}%1~%{$reset_color%}] %(?.%{$fg[cyan]%}.%{$fg[red]%})%(!.#.>>>)%{$reset_color%}%b "

# Right prompt
ZLE_RPROMPT_INDENT=0 # solution to cursor shifting https://superuser.com/questions/655607/removing-the-useless-space-at-the-end-of-the-right-prompt-of-zsh-rprompt

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"                              # plus/minus     - clean repo
GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"             # A"NUM"         - ahead by "NUM" commits
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"           # B"NUM"         - behind by "NUM" commits
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"     # lightning bolt - merge conflict
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"       # red circle     - untracked files
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}●%{$reset_color%}"     # yellow circle  - tracked files modified
GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"        # green circle   - staged changes present = ready for "git push"

parse_git_dirty() {
  if command git diff-index --quiet HEAD 2> /dev/null; then
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  else
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  fi
}

parse_git_branch() {
  # Show Git branch/tag, or name-rev if on detached head
  ( git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD ) 2> /dev/null
}

parse_git_state() {
  # Show different symbols as appropriate for various Git repository states
  # Compose this value via multiple conditional appends.
  local GIT_STATE=""
  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi
  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi
  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi
  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi
  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi
  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi
}

git_prompt_string() {
  local git_where="$(parse_git_branch)"

  # If inside a Git repository, print its branch and state
  # [ -n "$git_where" ] && echo "%(?..%F{red}X%f) $GIT_PROMPT_SYMBOL$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"
  [ -n "$git_where" ] && echo "$GIT_PROMPT_SYMBOL$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"
}

zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:git*'           formats "$(parse_git_dirty)[%b] %F{green}%c%f %F{yellow}%u%f"
zstyle ':vcs_info:git*'           formats "$(parse_git_dirty)"
zstyle ':vcs_info:*'              check-for-changes true
zstyle ':vcs_info:*:prompt:*'     check-for-changes true
zstyle ':vcs_info:*:prompt:*'     stagedstr         "%{$fg[green]%}*%{$reset_color%}"
zstyle ':vcs_info:*:prompt:*'     unstagedstr       "%{$fg[red]%}*%{$reset_color%}"
zstyle ':vcs_info:*:prompt:*'     branchformat      "%r"
zstyle ':vcs_info:*:prompt:*'     formats           "%u%c%{$fg[green]%}[%b]%{$reset_color%}"
zstyle ':vcs_info:*:prompt:*'     nvcsformats       ""
# vcs
precmd()          { vcs_info }
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

# Apply different settigns for different terminals
case $(basename "$(cat "/proc/$PPID/comm")") in
  login)
    RPROMPT="$(git_prompt_string)"
    ;;
#  'tmux: server')
#        RPROMPT='$(git_prompt_string)'
#     ;;
  *)
    RPROMPT='$(git_prompt_string)'
    ;;
esac
