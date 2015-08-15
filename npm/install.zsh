if [ -z "$(which npm)" ]
then
  # Install the Solarized Dark theme for iTerm
  if [ "$(uname -s)" == "Darwin" ]
  then
    brew install node
  fi
fi

npm install npm -g
npm update -g
npm install -g yo bower grunt-cli gulp
npm install -g generator-webapp
