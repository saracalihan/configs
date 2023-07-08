DOTFILES=./dotfiles

cat ~/.zshrc > $DOTFILES/.zshrc
cat ~/.vimrc > $DOTFILES/.vimrc
cat ~/.gitconfig > $DOTFILES/.gitconfig
dconf dump /com/gexperts/Tilix/ > $DOTFILES/tilix.dconf
rm -rf ./licenses && cp -r ~/.licenses ./licenses
