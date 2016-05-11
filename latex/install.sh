if [ "$(uname -s)"=="Darwin" ]
then
  if [ -z "$(which tlmgr)" ]
  then
    brew cask install mactex
  fi
  tlmgr install IEEEtran elsarticle
fi
