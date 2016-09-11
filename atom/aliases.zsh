# Atom.io editor abbreviations
a() {
  if [ "$1" = "" ] ; then
    exec atom .
  else
    exec atom "$1"
  fi
}
alias apmup='apm update --no-confirm'
