here=$1/getProjects
echo " +++++++| start to clone all projects |+++++++ "
mkdir /home/${USER}/Desktop/projects
cd $here
npm install
npm run start
echo " +++++++| all repos successfully cloned to ~/Desktop/projects |+++++++ "
cd ..
