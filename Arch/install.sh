# BINARIES for Arch Linux

echo "Installing binaries:"

echo "Installing Update:"
sudo pacman -Syu

echo "Installing Git:"
sudo pacman -S git

echo "Installing yay:"
mkdir AUR
cd AUR
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..

echo "Installing Htop:"
sudo pacman -S htop

echo "Installing Tmux:"
sudo pacman -S tmux

echo "Installing Zsh:"
sudo pacman -S zsh

echo "Installing Oh My Zsh:"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing Zinit:"
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit self-update

echo "Installing Fish:"
sudo pacman -S fish

echo "Installing Bash:"
sudo pacman -S bash

echo "Installing Nerd-Fonts:"
git clone https://github.com/ryanoasis/nerd-fonts.git
 cd nerd-fonts/   
 sudo chmod +x install.sh
 ./install.sh

echo "Installing NeoVim:"
sudo pacman -S python3-pip
sudo pacman -Syu
sudo pacman -S neovim

echo "Installing NvChad:"
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

echo "Installing OBS Studio:"
sudo pacman -Sy v4l2loopback-dkms
sudo pacman -S obs-studio

echo "Installing Librewolf:"
git clone https://aur.archlinux.org/librewolf-bin.git
cd librewolf-bin
makepkg -si
cd ..

echo "Installing VSCodium:"
yay -S vscodium-bin

#chmod +x install.sh
#sudo ./install.sh
echo "Done!"