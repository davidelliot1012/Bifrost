#########################
#    Bifrost Install    #
#     Version 0.125     #
#        Amn173         #
#       04/03/18        #
#########################


clear
echo "Pre-Reqs -"
echo "Run termux-setup-storage"
echo "Have Termux-Api Installed"
echo "Manually grant termux-api permissions in app settings"
read -p "All Ready? Hit any key..." -n 1 -s

echo "\nInstalling Needed Packages"
yes | pkg install ncurses-utils
yes | pkg install curl

echo "Switch to Home, Make Directories"
cd ~/ && mkdir Yggdrasil
cd ~/Yggdrasil && mkdir Asgard
cd ~/Yggdrasil/Asgard

echo "Downloading Bifrost Files"
curl -LJO "raw.githubusercontent.com/davidelliot1012/Bifrost/master/Bifrost.sh"

echo "Relocating Files"
cp Bifrost.sh ${PREFIX}/bin/Bifrost

echo "Cleaning Up"
rm Bifrost.sh

echo "Changing executable bit"
chmod 555 ${PREFIX}/bin/Bifrost

echo "Updating"
apt update
yes | apt upgrade

echo "Just enter \"Bifrost\" at prompt to run"
read -p "Hit any key to exit" -n 1 -s




