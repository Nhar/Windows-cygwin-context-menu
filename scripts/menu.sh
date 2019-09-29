#!/bin/bash
#load files
source filesMan.sh
# coloredEcho "This text is green" green
coloredEcho(){
    local exp=$1;
    local color=$2;
    if ! [[ $color =~ '^[0-9]$' ]] ; then
       case $(echo $color | tr '[:upper:]' '[:lower:]') in
        black) color=0 ;;
        red) color=1 ;;
        green) color=2 ;;
        yellow) color=3 ;;
        blue) color=4 ;;
        magenta) color=5 ;;
        cyan) color=6 ;;
        white|*) color=7 ;; # white or invalid color
       esac
    fi
    tput setaf $color;
	# -e flag = newline characters
    echo -e $exp;
    tput sgr0;
}

#readData text varName color
readData(){
	coloredEcho "$1" "$3"
	read "$2"  
}

#caseMenu varName fileName color
caseMenu(){
	local option=$1
	local file_name=$2
	local runCygwinRegFile="regFile_createRunCygwin.reg"
	local delCygwinRegFile="regFile_deleteRunCygwin.reg"
	local runCmdRegFile="regFile_createRunCmd.reg"
	local delCmdRegFile="regFile_deleteRunCmd.reg"
	while [[ "$option" != "1"  \
	&& "$option" != "2" \
	&& "$option" != "3" \
	&& "$option" != "4" \
	&& "$option" != "5" \
	&& "$option" != "6" ]]
	do
	readData "Menu:\n'press 1' - create simple contex-menu (Run_cygwin_here);\
	\n'press 2' - delete simple contex-menu (Run_cygwin_here);\
	\n'press 3' - create simple contex-menu (Run_cmd_here);\
	\n'press 4' - delete simple contex-menu (Run_cmd_here);\
	\n'press 5' - create simple contex-menu;\
	\n'press 6' - exit " option $3
	case $option in
			"1")
				coloredEcho "Creating '$runCygwinRegFile' file" cyan
				createFile $runCygwinRegFile $option
				runFile $runCygwinRegFile;;
			
			"2")
				coloredEcho "Creating '$delCygwinRegFile' file"  cyan
				createFile $delCygwinRegFile $option
				runFile $delCygwinRegFile;;
			"3")
				coloredEcho "Creating '$runCmdRegFile' file"  cyan
				createFile $runCmdRegFile $option
				runFile $runCmdRegFile;;
			"4")
				coloredEcho "Creating '$delCmdRegFile' file"  cyan
				createFile $delCmdRegFile $option
				runFile $delCmdRegFile;;
			"5")
				coloredEcho "Creating '$file_name' file"  cyan
				createFile $file_name $option
				coloredEcho "Edit the file $file_name and run it" cyan
				read -p "Press enter to continue";;
			"6")
				coloredEcho "Bye" red
				exit 1;;	
			*)
				coloredEcho "Wrong value" red;;
		esac

	done
}

