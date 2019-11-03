
#caseMenu varName fileName color
caseMenuProp(){
	local option=$1
	local file_name=$2
	while (! [[ "$option" =~ ^([yY][eE][sS]|[yY])$ || "$option" =~ ^([nN][oO]|[nN])$ ]])
	do
		option=${option,,} # convert to lowercase
		coloredEchoV2 "Do you want to set up properties?" lightgreen bold 
		coloredEchoV2 "press [y/yes]' - set up paths for cmd and cygwin;" lightgreen  
		readDataV2 "press [n/no]' - go further;" option lightgreen  
		option=${option,,} # convert to lowercase
		case $option in
				y|yes)
					coloredEcho "Changing..." cyan
					searchCygwinPath
					searchWinPath
					replaceCygwinPath
					replaceCmdPath;;
				n|no)
					;;
				*)
					coloredEchoV2 "Wrong value" lightred;;
			esac

	done
}

searchCygwinPath(){
	local partLetter=$(df | grep ".:/cygwin" | cut -c1-1)
	local cygPrefix="/cygdrive/"
	local cygPath=$(find "/cygdrive/$partLetter" -wholename "*cygwin*/bin/mintty.exe" -print -quit)
	cygwinWinPath=`sixfBackslash "$(cygpath -w $cygPath)"`
}
searchWinPath(){
	cmdWinPath="$SYSTEMROOT\\System32\\cmd.exe"
	cmdWinPath=$(sixfBackslash "$cmdWinPath") 
}
replaceCygwinPath(){
	sed -i "s|.*CYGWIN_PATH.*|CYGWIN_PATH=\"$cygwinWinPath\"|" $(find . -maxdepth 1 -type f -name "properties.sh")	
}
replaceCmdPath(){
	sed -i "s|.*CMD_PATH.*|CMD_PATH=\"$cmdWinPath\"|" $(find . -maxdepth 1 -type f -name "properties.sh")	
}


