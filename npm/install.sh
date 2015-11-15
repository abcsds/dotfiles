if [ "$(uname -s)"=="Darwin" ]
then
  if [ -z "$(which npm)" ]
  then
    # brew install node
  fi
  npm install npm -g
  npm update -g
  npm install -g yo bower grunt-cli gulp
  npm install -g generator-webapp
fi
export PATH="$HOME/.node/bin:$PATH"
