# Dotfiles

> If I have seen further it is by standing on the shoulders of Giants.

My dotfiles

## Dotfiles
I chose [Zach Holman's dotfiles](https://github.com/holman/dotfiles) as the base of this repo for its great bootstrap script and it's topical configuration. Where if you want to add a specific topic for configuration you can simply add a topic directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## Requirements

 - git
 - curl

## Install

```sh
git clone https://github.com/abcsds/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets sane OS X
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## Components

There's a few special files in the hierarchy. For preformance reasons, all files with `.zsh` ending must be in the `zsh` folder. This reduces the speed of every load to a .13%

<!-- - **bin/**: Anything in `bin/` will get added to your `$PATH` and be made -->
<!--   available everywhere. -->
<!-- - **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your -->
<!--   environment. -->
<!-- - **topic/completion.zsh**: Any file named `completion.zsh` is loaded -->
<!--   last and is expected to setup autocomplete. -->
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.
