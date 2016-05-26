if [ "$(uname -s)"=="Darwin" ]
then
  if [ -z "$(which tlmgr)" ]
  then
    brew cask install mactex
  fi
  tlmgr update --self
  tlmgr install IEEEtran elsarticle
fi
