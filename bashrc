#########################
#    Bifrost Bashrc     #
#     Version 1.0.0     #
#        Amn173         #
#       04/03/18        #
#########################

clear
echo "Run Bifrosts' Bashrc? (Y|N)"
read -n 1 -s
clear

if [[ $REPLY =~ ^[Yy]$ ]]; then
	#Designate Text Colors
	NC='\033[0m'
	BLK='\033[0;30m'
	RED='\033[0;31m'
	GRN='\033[0;32m'
	ORNG='\033[0;33m'
	BLU='\033[0;34m'
	PRPL='\033[0;35m'
	CYN='\033[0;36m'
	LGRY='\033[0;37m'
	DGRY='\033[1;30m'
	LRED='\033[1;31m'
	LGRN='\033[1;32m'
	YLW='\033[1;33m'
	LBLU='\033[1;34m'
	LPRPL='\033[1;35m'
	LCYN='\033[1;36m'
	WHT='\033[1;37m'
	#         ^
	#2-Dark, 3-Italic, 4-Underline, 5-Bold, 6-? 7-Inverse, 8-Concealed, 9-Strike
	
	#Designate Background Colors
	BGBLK='\033[40m'
	BGRED='\033[41m'
	BGGRN='\033[42m'
	BGYLW='\033[43m'
	BGLBLU='\033[44m'
	BGPRPL='\033[45m'
	BGCYN='\033[46m'
	BGWHT='\033[47m'
	
	#Customize Prompts
	#export PS0="ps0>"
	export PS1="(\W)(\$)~>"
	export PS2="/~>"
	export PS3="ps3>"
	export PS4="ps4>"
	
	#Create Aliases
	alias ls='ls -a'
	
	#Setup Command History
	export HISTFILE=~/Yggdrasil/Asgard/.CmdHistory
	export HISTFILESIZE=100
	export HISTSIZE=100
	#set -o history
	#set -a HISTTIMEFORMAT
	#HISTCONTROL, HISTIGNORE
	
	#Add to $PATH
fi























