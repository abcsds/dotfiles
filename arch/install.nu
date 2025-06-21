sudo pacman -Syu
# Install pacman packages from the list at min.txt
open $env.DOTFILES_ROOT/arch/min.txt | each { |line| pacman -S $line }
# Install AUR packages from the list at aur.txt
if $env.DISTRO == 'Manjaro' {
  open $env.DOTFILES_ROOT/arch/aur.txt | each { |line| pamac build $line }
}