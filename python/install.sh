if [[ $OS == "Darwin" ]]; then
  # Python3
  pip3 install --upgrade pip
  pip3 install --upgrade setuptools
  pip3 install --user -r $DZSH/python/packages.txt
else
  pip install --user --upgrade pip
  pip install --user --upgrade setuptools
  pip install --user -r $DZSH/python/packages.txt
fi
