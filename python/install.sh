if [ "$(uname -s)" == "Darwin" ]
then
  # Python2
  pip2 install --upgrade pip
  pip2 install --upgrade setuptools
  # pip2 install ctypes --allow-external ctypes --allow-unverified ctypes
  pip2 install pyobjc
  pip2 install ipython
  pip2 install virtualenv
  pip2 install virtualenvwrapper
  pip2 install autoenv
  pip2 install numpy
  pip2 install Pygments
  # pip2 install pygame
  pip2 install simplecv
  pip2 install matplotlib

  # Python3
  pip3 install --upgrade pip
  pip3 install --upgrade setuptools
  pip3 install pyobjc
  pip3 install ipython
  pip3 install numpy
  pip3 install Pygments
  pip3 install simplecv
  pip3 install matplotlib
  pip3 install hg+http://bitbucket.org/pygame/pygame
  # pip install pygame --allow-external pygame --allow-unverified pygame

  # TODO:
  # pip install turtle
  # pip install --allow-external SC --allow-unverified SC SC
else
  pip install --upgrade pip
  pip install --upgrade setuptools
  pip install Pygments
  pip install ipython
  pip install matplotlib
  pip install numpy
  pip install simplecv
  pip install virtualenv
  pip install virtualenvwrapper
fi
