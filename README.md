# Franken Dotfiles

> If I have seen further it is by standing on the shoulders of Giants.

My dotfiles made by taking my favorite settings from the dotfiles of some of the best developers and communities out there:

- The installation script from [Zach Holman](https://github.com/holman).
- Most vim config from [Yan Pritzker's dotfiles](https://github.com/skwp/dotfiles).
- Most Mac OSX configurations from [Mathias Bynens](https://github.com/mathiasbynens/dotfiles).
- Some other goodies from [thoughtbot](https://github.com/thoughtbot/dotfiles).
- The amazing theme is [Ben Hilburn's powerlevel9k](https://github.com/bhilburn/powerlevel9k).
- The nethackrc example I got from [Tolchi's dotfiles](https://github.com/Tolchi/dotfile
), but it's currently not working.



## Dotfiles

Dotfiles are the configuration files that define how you personalize your system. Cloning these can get you up and running in a new system within minutes.

I chose [Zach Holman's dotfiles](https://github.com/holman/dotfiles) as the base of this repo for its great bootstrap script and it's topical configuration. Where if you want to add a specific topic for configuration you can simply add a topic directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

If you're interested in the philosophy behind why projects like these are
awesome, you might want to [read Zach Holman's post on the
subject](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/). I also encourage you to check out his [original work]((https://github.com/holman/dotfiles/issues)

## Install

Run this:

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

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## Bugs

If you like this dotfiles but run into any trouble, you can [open an issue](https://github.com/abcsds/dotfiles/issues).

## License

All work here is licesed under the MIT license, you can read more on the `LICENCE.md` file.
