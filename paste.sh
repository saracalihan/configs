DOTFILES=./dotfiles

cp  $DOTFILES/.vimrc ~/.vimrc
cp  $DOTFILES/.zshrc ~/.zshrc
cp  $DOTFILES/.gitconfig ~/.gitconfig
cp -r ./licenses ~/.licenses
cp $DOTFILES/crontab /etc/spool/$USER
cp $DOTFILES/g810-led.rules /etc/udev/rules.d/g810-led.rules
