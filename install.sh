#!/data/data/com.termux/files/usr/bin/bash
# Stylish fonts for termux
# Created by Tech-X

# Colors

blue='\033[1;34m'
green='\033[1;92m'
red='\033[1;91m'
reset='\033[0m'

CheckDir () {
	if [ -d ~/.termux ]; then
		echo ""
		printf "${green}Termux directory Is Ok${reset}\n"
	else
		mkdir -p ~/.termux
		printf "${blue}Termux directory is created\n"
	fi
	if [ -d $PREFIX/share/tfonts ]; then
		echo ""
		printf "${green}tfonts directory is ok${reset}\n"
	else
		mkdir $PREFIX/share/tfonts
		echo ""
		printf "${blue}tfont directory is created${reset}\n"
	fi
	
}
tfonts () {
   
    if [ ! -f $PREFIX/share/tfonts/tfonts.sh ]; then
	    echo ""
	    printf "${blue}Downloading fonts....${reset}\n"
	    cd $PREFIX/share/tfonts
	    wget https://archive.org/download/tfonts/tfonts.zip || { printf "${red}Check your internet connection.Aborting\n"; exit 1; }
	unzip tfonts.zip ||{ echo >&2 "Required unzip package inatall it first"; exit 1;}
	chmod +x tfonts.sh
	rm tfonts.zip
   else
	   echo ""
	   printf "${red}fonts is already downloaded${reset}\n"
    fi

	if [ -e $PREFIX/bin/tfonts ]; then
		echo ""
		printf "${green}tfonts installed${reset}\n"
	else
		cp tfonts $PREFIX/bin
		echo ""
		printf "${green}start tfonts by using command ${red}tfonsts -s ${reset}\n"
	fi
	
}

banner () {
	clear
echo ""
printf "${red}████████╗${blue}███████╗ ██████╗ ███╗   ██╗████████╗███████╗\n"
printf "${red}╚══██╔══╝${blue}██╔════╝██╔═══██╗████╗  ██║╚══██╔══╝██╔════╝\n"
printf "${red}   ██║   ${blue}█████╗  ██║   ██║██╔██╗ ██║   ██║   ███████╗\n"
printf "${red}   ██║   ${blue}██╔══╝  ██║   ██║██║╚██╗██║   ██║   ╚════██║\n"
printf "${red}   ██║   ${blue}██║     ╚██████╔╝██║ ╚████║   ██║   ███████║\n"
printf "${red}   ╚═╝   ${blue}╚═╝      ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚══════╝\n"
printf "${reset}\n"
}
banner
sleep 1
CheckDir
tfonts

