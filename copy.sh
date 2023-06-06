cat ~/.zshrc > ./.zshrc
cat ~/.vimrc > ./.vimrc
dconf dump /com/gexperts/Tilix/ > tilix.dconf
rm -rf ./licenses && cp -r ~/.licenses ./licenses
