if [ "$(uname -s)"=="Darwin" ]
then
  # Python2
  # pip2 install --user --upgrade pip
  # pip2 install --user --upgrade setuptools
  # pip2 install --user ctypes --allow-external ctypes --allow-unverified ctypes
  # pip2 install --user pyobjc
  # pip2 install --user ipython
  # pip2 install --user virtualenv
  # pip2 install --user virtualenvwrapper
  # pip2 install --user autoenv
  # pip2 install --user numpy
  # pip2 install --user Pygments
  # pip2 install --user pygame
  # pip2 install --user simplecv
  # pip2 install --user matplotlib

  # Python3
  pip3 install --user --upgrade pip
  pip3 install --user --upgrade setuptools
  pip3 install --user beautifulsoup4
  pip3 install --user coursera-dl
  pip3 install --user flake8
  pip3 install --user googletrans
  pip3 install --user idx2numpy
  pip3 install --user ipython
  pip3 install --user ipywidgets
  pip3 install --user jupyter
  pip3 install --user jupyter-console
  pip3 install --user jupyter-contrib-nbextensions
  pip3 install --user jupyter-highlight-selected-word
  pip3 install --user jupyter-tensorboard
  pip3 install --user Markdown
  pip3 install --user matplotlib
  pip3 install --user mne
  pip3 install --user mpi4py
  pip3 install --user nbconvert
  pip3 install --user neovim
  pip3 install --user networkx
  pip3 install --user nilearn
  pip3 install --user nltk
  pip3 install --user notebook
  pip3 install --user numpy
  pip3 install --user pandas
  pip3 install --user Pillow
  pip3 install --user PsychoPy
  pip3 install --user Pweave
  pip3 install --user Pygments
  pip3 install --user pyserial
  pip3 install --user python-telegram-bot
  pip3 install --user regex
  pip3 install --user scikit-learn
  pip3 install --user scikit-surprise
  pip3 install --user scipy
  pip3 install --user seaborn
  pip3 install --user SimpleCV
  pip3 install --user sklearn
  pip3 install --user spyder
  pip3 install --user sympy
  pip3 install --user tensorboard
  pip3 install --user tensorflow
  pip3 install --user tensorflow-tensorboard
  pip3 install --user tweepy
  pip3 install --user urllib3
  pip3 install --user virtualenv
  pip3 install --user virtualenv-clone
  pip3 install --user virtualenvwrapper
  pip3 install --user youtube-dl

  # ln -s /usr/local/bin/python3 /usr/local/bin/python
  # ln -s /usr/local/bin/pip3    /usr/local/bin/pip

else
  pip install --user --upgrade pip
  pip install --user --upgrade setuptools
  pip install --user beautifulsoup4
  pip install --user coursera-dl
  pip install --user flake8
  pip install --user googletrans
  pip install --user idx2numpy
  pip install --user ipython
  pip install --user ipywidgets
  pip install --user jupyter
  pip install --user jupyter-console
  pip install --user jupyter-contrib-nbextensions
  pip install --user jupyter-highlight-selected-word
  pip install --user jupyter-tensorboard
  pip install --user Markdown
  pip install --user matplotlib
  pip install --user mne
  pip install --user mpi4py
  pip install --user nbconvert
  pip install --user networkx
  pip install --user nilearn
  pip install --user nltk
  pip install --user notebook
  pip install --user numpy
  pip install --user pandas
  pip install --user Pillow
  pip install --user PsychoPy
  pip install --user Pweave
  pip install --user Pygments
  pip install --user pyserial
  pip install --user python-telegram-bot
  pip install --user regex
  pip install --user scikit-learn
  pip install --user scikit-surprise
  pip install --user scipy
  pip install --user seaborn
  pip install --user SimpleCV
  pip install --user sklearn
  pip install --user spyder
  pip install --user sympy
  pip install --user tensorboard
  pip install --user tensorflow
  pip install --user tensorflow-tensorboard
  pip install --user tweepy
  pip install --user urllib3
  pip install --user virtualenv
  pip install --user virtualenv-clone
  pip install --user virtualenvwrapper
  pip install --user youtube-dl
fi
