pmInstallCommand="sudo apt install"
here=$PWD


#install git
#echo "+++++++++++++| INSTALL GIT |+++++++++++++"
#$pmInstallCommand git

# install vim
echo "+++++++++++++| "INSTALL VIM |+++++++++++++"
$pmInstallCommand vim
cp $here/.vimrc /home/saracalihan/.vimrc
echo "+++++++++++++| INSTALL VUNDLE |+++++++++++++"
git clone https://github.com/VundleVim/Vundle.vim.git /home/saracalihan/.vim/bundle/Vundle.vim
git clone https://github.com/danilo-augusto/vim-afterglow.git /home/saracalihan/.vim/bundle/afterglow
echo "+++++++++++++| SET .VIMRC |+++++++++++++"
source /home/saracalihan/.vimrc
echo "+++++++++++++| INSTALL VIM PLUGINS |+++++++++++++"
vim +PluginInstall +qall
cd

# install node & npm
echo "+++++++++++++| INSTALL NODE & NPM |+++++++++++++"
$pmInstallCommand nodejs npm
node --version
npm --version

echo "+++++++++++++| INSTALL YARN |+++++++++++++"
npm install -g yarn
yarn --version

cd

#get all projects
echo "+++++++++++++| GET ALL PROJECTS |+++++++++++++"
$here/./install.sh
cd

8 #get all projects                                                                                        
echo "+++++++++++++| INSTALL BAT |+++++++++++++"
$here/./install.sh
cd  

# install zsh
echo "+++++++++++++| INSTALL ZSH |+++++++++++++"
$pmInstallCommand zsh

echo "+++++++++++++| INSTALL OH-MY-ZSH |+++++++++++++"
cp $here/.zshrc /home/saracalihan/.zshrc
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source /home/saracalihan/.zshrc


#echo "+++++++++++++| CHANGE DEFAULT SHELL TO ZSH |+++++++++++++"
#sudo chsh -s $(which zsh)
