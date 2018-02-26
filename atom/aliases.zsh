# Atom.io editor abbreviations
function a () {
  if [[ -n $1 ]]; then
    atom "$1"
  else
    atom .
  fi
}
alias apmup='apm update --no-confirm'
