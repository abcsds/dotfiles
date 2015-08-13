VIM=$(command -v vim)
GVIM=$(command -v gvim)
MVIM=$(command -v mvim)

[[ -n $VIM ]] && alias v=$VIM


if [ "$(uname -s)"=="Darwin" ]
then
  [[ -n $MVIM ]] && alias mvim="mvim --remote-tab"
else
  [[ -n $GVIM ]] && alias gvim="gvim -b --remote-tab"
fi
