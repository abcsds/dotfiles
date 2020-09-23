pacman -Syu
# pacman -S atom emacs julia vim zsh zsh-completions exa thefuck
pacman -S $(< $DZSH/arch/min.txt)
[[ "$DISTRO" == 'Manjaro' ]] && pamac build $(< $DZSH/arch/aur.txt)
