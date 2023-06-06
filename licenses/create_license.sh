LICENSES_PATH=~/.licenses

# copy license file to current folder
if [[ "$1" == "MIT" || "$1" == "GNU" ]]; then
  cp $LICENSES_PATH/$1 "`pwd`/LICENSE"
  echo "`pwd`/LICENSE created."
else
  echo  "Wrong license: $1"
  exit
fi
