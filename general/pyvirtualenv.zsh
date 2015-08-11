[[ `which virtualenvwrapper.sh` ]] && . virtualenvwrapper.sh

function mkvenv {
  about 'create a new virtualenv for this directory'
  group 'virtualenv'

  cwd=`basename \`pwd\``
  mkvirtualenv --distribute $cwd
}
