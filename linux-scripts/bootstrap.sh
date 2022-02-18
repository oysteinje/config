# upgrade the system
sudo apt update && sudo apt upgrade -y

# fish
sudo apt-add-repository ppa:fish-shell/release-3

# pwsh
sudo apt-get install -y wget apt-transport-https software-properties-common
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt update

sudo apt-get install -y tmux neovim fish powershell

# Install Azure CLI 
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install bicep 
az bicep install

# Test installations
tmux -V
fish -v
nvim -v
az version
pwsh -v
az bicep version

ssh-keygen -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub

read  -n 1 -p "Add the public ssh key to Github and press an input when it's done:" mainmenuinput

mkdir -p repos/qbits/config
git clone git@github.com:oysteinje/config.git repos/qbits/config

# Install vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
