
#caseMenu varName fileName color
caseMenuProp(){
	local option=$1
	local file_name=$2
	while [[ "$option" != "y"  \
	&& "$option" != "n" ]]
	do
	readData "Do you want to set up properties? \n'press [y]' - set up paths for cmd and cygwin ;\
	\n'press [n]' - go further " option $3
	option=${option,,} # convert to lowercase
	case $option in
			y|yes)
				coloredEcho "Changing..." cyan
				searchCygwinPath
				searchWinPath
				replaceCygwinPath
				replaceCmdPath
				option=y;;
			n|no)
				option=n;;
			*)
				coloredEcho "Wrong value" red;;
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


