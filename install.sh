pmInstallCommand="sudo apt install"
here=$PWD
green=`tput setaf 2`
reset=`tput sgr0`

cd
#install git
echo "+++++++++++++| ${red}INSTALL GIT${reset} |+++++++++++++"
#$pmInstallCommand git

cd

#install vim
echo "+++++++++++++| ${red}INSTALL VIM${reset} |+++++++++++++"
$pmInstallCommand vim
cp $here/.vimrc /home/saracalihan/.vimrc
echo "+++++++++++++| ${red}INSTALL VUNDLE${reset} |+++++++++++++"
git clone https://github.com/VundleVim/Vundle.vim.git /home/saracalihan/.vim/bundle/Vundle.vim
git clone https://github.com/danilo-augusto/vim-afterglow.git /home/saracalihan/.vim/bundle/afterglow
echo "+++++++++++++| ${red}SET .VIMRC${reset} |+++++++++++++"
source /home/saracalihan/.vimrc
echo "+++++++++++++| ${red}INSTALL VIM PLUGINS${reset} |+++++++++++++"
vim +PluginInstall +qall
cd

#install node & npm
echo "+++++++++++++| ${red}INSTALL NODE & NPM${reset} |+++++++++++++"
$pmInstallCommand nodejs npm
node --version
npm --version

echo "+++++++++++++| ${red}INSTALL YARN${reset} |+++++++++++++"
npm install -g yarn
yarn --version

cd

#get all projects
echo "+++++++++++++| ${red}GET ALL PROJECTS${reset} |+++++++++++++"
$here/./install.sh
cd

8 #get all projects                                                                                        
echo "+++++++++++++| ${red}INSTALL BAT${reset} |+++++++++++++"
$here/./install.sh
cd  

#install zsh
#echo "+++++++++++++| ${red}INSTALL ZSH${reset} |+++++++++++++"
#$pmInstallCommand zsh

#echo "+++++++++++++| ${red}INSTALL OH-MY-ZSH${reset} |+++++++++++++"
#sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#cp $here/.zshrc /home/saracalihan/.zshrc
#source /home/saracalihan/.zshrc


#echo "+++++++++++++| ${red}CHANGE DEFAULT SHELL TO ZSH${reset} |+++++++++++++"
#sudo chsh -s $(which zsh)
