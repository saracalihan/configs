# package manager install command
pmInstallCommand="package manager install command"
here=$PWD

os=`grep "ID_LIKE" /etc/os-release | awk '{ print substr($1,9) }'`

# copy licenses
chmod 777 ./licenses/create_license.sh && chmod 777 ./licenses/create_licensed_file.sh &&
cp -r ./licenses ~/.licenses && echo "Licenses copied."

# select install command 
case $os in
  "arch")
    pmInstallCommand="sudo pacman -S"
    ;;
  "debian")
    pmInstallCommand="sudo apt-get install"
    ;;
esac

echo "+++++++++++++| Set Cron Jobs |+++++++++++++"
sudo cp crontab /etc/spool/$USER
crontab -l


#install git
echo "+++++++++++++| INSTALL GIT |+++++++++++++"
$pmInstallCommand git --noconfirm

cd

echo "+++++++++++++| INSTALL VIM |+++++++++++++"
$pmInstallCommand vim --noconfirm
cp $here/.vimrc /home/$USER/.vimrc

echo "+++++++++++++| INSTALL VUNDLE |+++++++++++++"
git clone https://github.com/VundleVim/Vundle.vim.git /home/saracalihan/.vim/bundle/Vundle.vim
git clone https://github.com/danilo-augusto/vim-afterglow.git /home/saracalihan/.vim/bundle/afterglow

echo "+++++++++++++| SET .VIMRC |+++++++++++++"
source /home/$USER/.vimrc

echo "+++++++++++++| INSTALL VIM PLUGINS |+++++++++++++"
vim +PluginInstall +qall
cd

echo "+++++++++++++| INSTALL NODE & NPM |+++++++++++++"
$pmInstallCommand nodejs npm --noconfirm
node --version
npm --version

echo "+++++++++++++| INSTALL YARN |+++++++++++++"
sudo npm install -g yarn --noconfirm
yarn --version

echo "+++++++++++++| GET ALL PROJECTS |+++++++++++++"
$here/getProjects/install.sh $here
cd

echo "+++++++++++++| INSTALL Tree |+++++++++++++"
$pmInstallCommand tree --noconfirm

echo "+++++++++++++| INSTALL BAT |+++++++++++++"
$pmInstallCommand bat --noconfirm
cd  

echo "+++++++++++++| INSTALL Docker |+++++++++++++"
$pmInstallCommand docker --noconfirm
docker -v

echo "+++++++++++++| INSTALL KEYBOARD DRIVER |+++++++++++++"
$pmInstallCommand g810-led-lib --noconfirm
sudo cp g810-led.rules /etc/udev/rules.d/g810-led.rules

echo "+++++++++++++| INSTALL Tilix |+++++++++++++"
$pmInstallCommand tilix --noconfirm
# set tilix config, 'dconf dump /com/gexperts/Tilix/ > tilix.dconf' copy config 
dconf load /com/gexperts/Tilix/ < tilix.dconf

echo "+++++++++++++| INSTALL ZSH |+++++++++++++"
$pmInstallCommand zsh --noconfirm

echo "+++++++++++++| INSTALL OH-MY-ZSH |+++++++++++++"
cp $here/.zshrc /home/$USER/.zshrc
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source /home/$USER/.zshrc


echo "+++++++++++++| CHANGE DEFAULT SHELL TO ZSH |+++++++++++++"
chsh -s $(which zsh)
