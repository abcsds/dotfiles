pacman -Syu
# pacman -S atom emacs julia vim zsh zsh-completions exa thefuck
pacman -S $(< $DZSH/arch/min.txt)

CDIR=$(pwd)
AUR=~/aur
mkdir -p $AUR
git clone https://aur.archlinux.org/yay.git $AUR/yay
cd $AUR/yay
makepkg -i
cd $CDIR
