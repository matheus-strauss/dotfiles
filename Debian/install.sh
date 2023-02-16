# BINARIES for Debian

echo "Installing binaries:"

echo "Installing Update:"
sudo apt-get update

echo "Installing Git:"
sudo apt-get install git

echo "Installing Htop:"
sudo apt-get install htop

echo "Installing Tmux:"
sudo apt-get install tmux

echo "Installing Zsh:"
sudo apt-get install zsh

echo "Installing Oh My Zsh:"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing Zinit:"
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit self-update

echo "Installing Fish:"
sudo apt-get install fish

echo "Installing Bash:"
sudo apt-get install bash

echo "Installing Nerd-Fonts:"
git clone https://github.com/ryanoasis/nerd-fonts.git
 cd nerd-fonts/   
 sudo chmod +x install.sh
 ./install.sh

echo "Installing NeoVim:"
sudo apt-get update
sudo apt-get install python3-pip
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

echo "Installing NvChad:"
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

echo "Installing OBS Studio:"
sudo apt-get install obs-studio

echo "Installing Librewolf:"
sudo apt update && sudo apt install -y wget gnupg lsb-release apt-transport-https ca-certificates
distro=$(if echo " una vanessa focal jammy bullseye vera uma" | grep -q " $(lsb_release -sc) "; then echo $(lsb_release -sc); else echo focal; fi)
wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/librewolf.gpg
sudo tee /etc/apt/sources.list.d/librewolf.sources << EOF > /dev/null
Types: deb
URIs: https://deb.librewolf.net
Suites: $distro
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/librewolf.gpg
EOF
sudo apt update
sudo apt install librewolf -y

echo "Installing VSCodium:"
#Add the GPG key of the repository:
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

#Add the repository:
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list

#Update then install vscodium (if you want vscodium-insiders, then replace codium by codium-insiders):
sudo apt update && sudo apt install codium

#chmod +x install.sh
#sudo ./install.sh
echo "Done!"
