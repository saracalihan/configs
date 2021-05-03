pmInstallCommand="sudo pacman -S" 
here=$PWD

cd
#install git
echo "+++++++++++++| ${red}INSTALL GIT${reset} |+++++++++++++"
$pmInstallCommand git

cd

#install vim
echo "+++++++++++++| ${red}INSTALL VIM${reset} |+++++++++++++"
$pmInstallCommand vim
cp $here/.vimrc /home/$USER/.vimrc
echo "+++++++++++++| ${red}INSTALL VUNDLE${reset} |+++++++++++++"
git clone https://github.com/VundleVim/Vundle.vim.git /home/saracalihan/.vim/bundle/Vundle.vim
git clone https://github.com/danilo-augusto/vim-afterglow.git /home/saracalihan/.vim/bundle/afterglow
echo "+++++++++++++| ${red}SET .VIMRC${reset} |+++++++++++++"
source /home/$USER/.vimrc
echo "+++++++++++++| ${red}INSTALL VIM PLUGINS${reset} |+++++++++++++"
vim +PluginInstall +qall
cd

#install node & npm
echo "+++++++++++++| ${red}INSTALL NODE & NPM${reset} |+++++++++++++"
$pmInstallCommand nodejs npm
node --version
npm --version

echo "+++++++++++++| ${red}INSTALL YARN${reset} |+++++++++++++"
sudo npm install -g yarn
yarn --version

#get all projects
echo "+++++++++++++| ${red}GET ALL PROJECTS${reset} |+++++++++++++"
$here/getProjects/install.sh $here
cd

echo "+++++++++++++| ${red}INSTALL Tree${reset} |+++++++++++++"
$pmInstallCommand tree

echo "+++++++++++++| ${red}INSTALL BAT${reset} |+++++++++++++"
$pmInstallCommand bat
cd  

echo "+++++++++++++| ${red}INSTALL Docker${reset} |+++++++++++++"
$pmInstallCommand docker
docker -v

#install zsh
echo "+++++++++++++| ${red}INSTALL ZSH${reset} |+++++++++++++"
$pmInstallCommand zsh

echo "+++++++++++++| ${red}INSTALL OH-MY-ZSH${reset} |+++++++++++++"
cp $here/.zshrc /home/$USER/.zshrc
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source /home/$USER/.zshrc


echo "+++++++++++++| ${red}CHANGE DEFAULT SHELL TO ZSH${reset} |+++++++++++++"
chsh -s $(which zsh)
