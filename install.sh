pmInstallCommand="pacman -S"
here=$PWD

sudo su
cd
#install git
$pmInstallCommand git

#install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp $here/.zshrc ~/.zshrc
source ~/.zshrc

cd

#install vim
git clone https://github.com/vim/vim.git
cd vim
git pull
make
make install
mv .vimrc ~/.vimrc
source ~/.vimrc
cd

#install node & npm
$pmInstallCommand nodejs npm
npm install -g yarn
cd

#get all projects
./$here/getProjects/install.sh
