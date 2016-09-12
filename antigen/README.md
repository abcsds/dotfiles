# Antigen as zsh plugin manager
[Antigen](http://antigen.sharats.me/) is a plugin manager for zsh, inspired by oh-my-zsh and vundle.

Plugins are called by the `bundle` command as such:

```zsh
antigen bundle djui/alias-tips
```

This activates the "alias-tips" plugin on djui's github account, And all plugins are activated in the zshrc file.

Themes can be activated by calling the theme command as such:

```zsh
antigen theme bhilburn/powerlevel9k powerlevel9k
```

The theme being used is currently [bhilburn's powerlevel9k](https://github.com/bhilburn/powerlevel9k).