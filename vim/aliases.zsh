VIM=$(command -v vim)

[[ -n $VIM ]] && alias v=$VIM


if [ "$(uname -s)"=="Darwin" ]
then
  MVIM=$(command -v mvim)
  [[ -n $MVIM ]] && alias mvim="mvim --remote-tab"
else
  GVIM=$(command -v gvim)
  [[ -n $GVIM ]] && alias gvim="gvim -b --remote-tab"
fi
