# package manager install command
pmInstallCommand="sudo pacman -S"

here=$PWD

echo "+++++++++++++| Set Cron Jobs |+++++++++++++"
sudo cp crontab /etc/spool/$USER
crontab -l

cd
#install git
echo "+++++++++++++| INSTALL GIT |+++++++++++++"
$pmInstallCommand git

cd

#install vim
echo "+++++++++++++| INSTALL VIM |+++++++++++++"
$pmInstallCommand vim
cp $here/.vimrc /home/$USER/.vimrc
echo "+++++++++++++| INSTALL VUNDLE |+++++++++++++"
git clone https://github.com/VundleVim/Vundle.vim.git /home/saracalihan/.vim/bundle/Vundle.vim
git clone https://github.com/danilo-augusto/vim-afterglow.git /home/saracalihan/.vim/bundle/afterglow
echo "+++++++++++++| SET .VIMRC |+++++++++++++"
source /home/$USER/.vimrc
echo "+++++++++++++| INSTALL VIM PLUGINS |+++++++++++++"
vim +PluginInstall +qall
cd

#install node & npm
echo "+++++++++++++| INSTALL NODE & NPM |+++++++++++++"
$pmInstallCommand nodejs npm
node --version
npm --version

echo "+++++++++++++| INSTALL YARN |+++++++++++++"
sudo npm install -g yarn
yarn --version

#get all projects
echo "+++++++++++++| GET ALL PROJECTS |+++++++++++++"
$here/getProjects/install.sh $here
cd

echo "+++++++++++++| INSTALL Tree |+++++++++++++"
$pmInstallCommand tree

echo "+++++++++++++| INSTALL BAT |+++++++++++++"
$pmInstallCommand bat
cd  

echo "+++++++++++++| INSTALL Docker |+++++++++++++"
$pmInstallCommand docker
docker -v

echo "+++++++++++++| INSTALL KEYBOARD DRIVER |+++++++++++++"
$pmInstallCommand g810-led-lib
sudo cp g810-led.rules /etc/udev/rules.d/g810-led.rules

echo "+++++++++++++| INSTALL Tilix |+++++++++++++"
$pmInstallCommand tilix
# set tilix config, 'dconf dump /com/gexperts/Tilix/ > tilix.dconf' copy config 
dconf load /com/gexperts/Tilix/ < tilix.dconf

#install zsh
echo "+++++++++++++| INSTALL ZSH |+++++++++++++"
$pmInstallCommand zsh

echo "+++++++++++++| INSTALL OH-MY-ZSH |+++++++++++++"
cp $here/.zshrc /home/$USER/.zshrc
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source /home/$USER/.zshrc


echo "+++++++++++++| CHANGE DEFAULT SHELL TO ZSH |+++++++++++++"
chsh -s $(which zsh)
