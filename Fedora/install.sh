# BINARIES for Fedora

echo "Installing binaries:"

echo "Installing Update:"
sudo dnf --refresh upgrade

echo "Installing Git:"
sudo dnf install git

echo "Installing Htop:"
sudo dnf install htop

echo "Installing Tmux:"
sudo dnf install tmux

echo "Installing Zsh:"
sudo dnf install zsh

echo "Installing Oh My Zsh:"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing Zinit:"
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit self-update

echo "Installing Fish:"
sudo dnf install fish

echo "Installing Bash:"
sudo pacman -S bash

echo "Installing Nerd-Fonts:"
git clone https://github.com/ryanoasis/nerd-fonts.git
 cd nerd-fonts/   
 sudo chmod +x install.sh
 ./install.sh

echo "Installing NeoVim:"
sudo dnf install neovim

echo "Installing NvChad:"
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

echo "Installing OBS Studio:"
 sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install obs-studio
 sudo dnf install xorg-x11-drv-nvidia-cuda
sudo dnf install xorg-x11-drv-nvidia-340xx-cuda

echo "Installing Librewolf:"
sudo dnf config-manager --add-repo https://rpm.librewolf.net/librewolf-repo.repo
sudo dnf install librewolf

echo "Installing VSCodium:"
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium

#chmod +x install.sh
#sudo ./install.sh
echo "Done!"