#!/bin/sh
###########################################################
# retrieve top 10 latest mirrors and sort the mirror list by their download rate
sudo pacman -S --noconfirm --needed reflector rsync curl
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo reflector --latest 10 --protocol https,http --sort rate --save /etc/pacman.d/mirrorlist
###########################################################
# install packages using pacman
PACMAN=(
    git #must install it for yay
    base-devel #must install it for yay
    wget
    nodejs
    npm
    unzip
    os-prober
    grub-customizer
    packagekit-qt5
    #reflector
    #rsync
    #curl
    partitionmanager
    neofetch
    okular
    ark
    spectacle
    gwenview
    kcalc
    ktorrent

)
sudo pacman -S --noconfirm --needed ${PACMAN[@]}
###########################################################
cd $HOME
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd $HOME

# install packages from AUR using yay
YAY=(
    brave-bin
    visual-studio-code-bin
    papirus-icon-theme-git
    cpufetch-git
)
yay -S --noconfirm --needed ${YAY[@]}
###########################################################
# install and config Arabic Font
git clone https://github.com/samad20/arabicFonts4Linux.git
cd arabicFonts4Linux
./changeFont-kde.sh
cd $HOME
###########################################################
# change grub them
git clone https://github.com/samad20/ROG_GRUB_Theme.git
cd ROG_GRUB_Theme
chmod +x install.sh
sudo ./install.sh
cd $HOME
############################################################
