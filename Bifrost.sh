#########################
#    Bifrost(Alpha)     #
#     Version 0.125     #
#        Amn173         #
#       04/02/18        #
#########################
#$COLUMNS, look,
#util-linux


#Variables
#Designate Colors
NC='\033[0m'
RED='\033[0;31m'
GRN='\033[0;32m'
ORNG='\033[0;33m'
BLU='\033[0;34m'
PRPL='\033[0;35m'
CYN='\033[0;36m'
YLW='\033[1;33m'

#Termux Polling Array
#Columns, Internet, Root, Py3, Py2, Bashrc, UrlOpen, Util-linux
declare -a Polled

#Misc
XIt=0
RePoll=1
Padding=0
BashRc=~/.bashrc
UrlOpener=~/bin/termux-url-opener


#Functions
#Test Availability to Termux
function PollTerm(){
	clear
	echo -e "${YLW}Testing Packages, Sudo, Root, Etc...${NC}"
	Polled[0]=$(tput cols)
	ping -c 5 www.google.com > /dev/null 2>&1
	Polled[1]=$?
	su > /dev/null 2>&1
	Polled[2]=$?
	dpkg -s python > /dev/null 2>&1
	Polled[3]=$?
	dpkg -s python2 > /dev/null 2>&1
	Polled[4]=$?
	if [ -e "$BashRc" ]; then Polled[5]=0;
	else Polled[5]=1; fi
	if [ -e "$UrlOpener" ]; then Polled[6]=0;
	else Polled[6]=1; fi
	dpkg -s util-linux > /dev/null 2>&1
	Polled[7]=$?
	echo -e "${YLW}Complete${NC}"
	RePoll=0
}

function CalcCenter(){
	TxtWidth=$1
	TrmWidth=${Polled[0]}
	Padding=$((($TrmWidth - $TxtWidth) /2))
}

#Print Header
function PrintHead(){
	clear
	CalcCenter 30
	printf "%${Padding}s" && echo -e "${YLW}-----------------------------${NC}"
	printf "%${Padding}s" && echo -e "${CYN} |\\ ${NC}${PRPL} -|- |-- |\\  /-\\ /-\\ /|\\ ${NC}"
	printf "%${Padding}s" && echo -e "${CYN} | |  |${NC}${PRPL}  |   | | | | |    | ${NC}"
	printf "%${Padding}s" && echo -e "${CYN} |/   |  |--${NC}${PRPL} |/  | | \\    | ${NC}"
	printf "%${Padding}s" && echo -e "${CYN} |\\   |  |   |\\ ${NC}${PRPL} | |   \\  | ${NC}"
	printf "%${Padding}s" && echo -e "${CYN} | |  |  |   | \\ | |${NC}${PRPL}   |  | ${NC}"
	printf "%${Padding}s" && echo -e "${CYN} |/  -|- |   | | \\-/ \\-/  ${NC}${PRPL}| ${NC}"
	printf "%${Padding}s" && echo -e "${YLW}-----------------------------${NC}"
}

#Print Intro
function PrintIntro(){
	CalcCenter 23
	printf "%${Padding}s" && echo -e "${PRPL}4mn173s' Termux Toolkit${NC}"
	CalcCenter 15
	printf "%${Padding}s"
	if ((Polled[1] == 0)); then echo -e -n "${GRN}Internet${NC}";
	else echo -e -n "${RED}Internet${NC}"; fi
	echo -e -n "${PRPL} | ${NC}"
	if ((Polled[2] == 0)); then echo -e "${GRN}Root${NC}";
	else echo -e "${RED}Root${NC}"; fi
	CalcCenter 23
	printf "%${Padding}s" && echo -e "-----------------------\n"
}

#Print Menu
function PrintMenu(){
	if ((Polled[3] == 0)) && ((Polled[4] == 0)) && ((Polled[7] == 0)); then echo -e "${GRN}X. Installed${NC}";
	else echo -e "${RED}1. Essentials${NC}"; fi
	if ((Polled[5] == 0)); then echo -e "${YLW}2. Bashrc Config${NC}";
	else echo -e "${RED}2. Bashrc Config${NC}"; fi
	if ((Polled[6] == 0)); then echo -e "${YLW}3. Url-Opener${NC}";
	else echo -e "${RED}3. Url-Opener${NC}"; fi
	echo -e "${YLW}0. EXIT${NC}"
}

#Handle Menu Selection
function HandleMenu(){
	case $1 in
		0) XIt=1 && clear ;;
		1) InstallEssentials ;;
		2) InstallBashrc ;;
		3) InstallUrlOpener ;;
		*) echo "" ;;
	esac
}

#Install Essentials
function InstallEssentials(){
	PrintHead
	PrintIntro
	echo -e "${BLU}Packages To Install:${NC}"
	echo -e "  ${CYN}Python 3${NC}"
	echo -e "  ${CYN}Python 2${NC}"
	echo -e "  ${CYN}Util-Linux${NC}"
	if ((Polled[1] == 0)); then
		echo -e "${YLW}(C)ontinue or (A)bort${NC}"
		read -n 1 -s
		if [[ $REPLY =~ ^[Cc]$ ]]; then
			echo -e "${YLW}Installing...${NC}"
			yes | pkg install python > /dev/null 2>&1
			yes | pkg install python2 > /dev/null 2>&1
			yes | pkg install util-linux > /dev/null 2>&1
		fi
	else
		echo -e "${RED}No Internet...${NC}"
		read -n 1 -r
	fi
	RePoll=1
}

#Install Bashrc
function InstallBashrc(){
	PrintHead
	PrintIntro
	echo -e "${BLU}Terminal Configuration Changes:${NC}"
	echo -e "  ${CYN}Informative PS1${NC}"
	echo -e "  ${CYN}Modified System Paths${NC}"
	echo -e "  ${CYN}Add Color Globals${NC}"
	if ((Polled[1] == 0)); then
		echo -e "${YLW}(C)ontinue or (A)bort${NC}"
		read -n 1 -s
		if [[ $REPLY =~ ^[Cc]$ ]]; then
			echo "bashrc code here"
		fi
	else
		echo -e "${RED}No Internet...${NC}"
		read -n 1 -r
	fi
	RePoll=1
}

#Install Url-Opener
function InstallUrlOpener(){
	PrintHead
	PrintIntro
	echo -e "${BLU}Non-Local App Share Handling:${NC}"
	echo -e "${BLU}From App Click \"Share\" Then \"Termux\" ${NC}"
	echo -e "  ${CYN}Youtube-${NC}"
	echo -e "    ${CYN}Download As MP4 or MP3${NC}"
	echo -e "  ${CYN}Pinterest-${NC}"
	echo -e "    ${CYN}Handle Downloading${NC}"
	if ((Polled[1] == 0)); then
		echo -e "${YLW}(C)ontinue or (A)bort${NC}"
		read -n 1 -r
		if [[ $REPLY =~ ^[Cc]$ ]]; then
			echo "url code here"
		fi
	else
		echo -e "${RED}No Internet...${NC}"
		read -n 1 -r
	fi
	RePoll=1
}


#Main Loop
while ((XIt == 0)); do
	#Collect Availabilty to Termux
	if ((RePoll == 1)); then PollTerm; fi

	#Print Interface
	PrintHead
	PrintIntro
	PrintMenu

	#Get Menu Selection
	read -p "Menu(0-3)~>" -n 1 -r
	HandleMenu $REPLY
	echo ""
done












