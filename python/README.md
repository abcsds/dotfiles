# Python installation

Python 2 and 3 are installed by homebrew (MacOSX). Pip is in charge of the rest. Pip installation is on this folder. A most general installation of tools is setup with the installation of the dotfiles. For any other specific installation, virtualenvs should be used:

```shell
mkvirtualenv -a . -i numpy -r requirements.txt -p python3 -q MySpecificEnv
```

```shell
mkvirtualenv [-a project_path] [-i package] [-r requirements_file] [-p PYTHON_EXE] [-q, --quiet] [--no-pip] [other virtualenv options] ENVNAME
```

```shell
mktmpenv [(-c|--cd)|(-n|--no-cd)] [VIRTUALENV_OPTIONS]
```

```shell
workon ENVNAME
```

```shell
deactivate
```

```shell
lsvirtualenv [-b] [-l] [-h]
```
|---|---------------------------------------------|
|---|---------------------------------------------|
|-b | Brief mode, disables verbose output.        |
|-l | Long mode, enables verbose output. Default. |
|-h | Print the help for lsvirtualenv.            |

```shell
rmvirtualenv ENVNAME
```

[ref](http://virtualenvwrapper.readthedocs.io/en/latest/command_ref.html)
