
#caseMenu varName fileName color
caseMenu(){
	local option=$1
	local file_name=$2
	local runCygwinRegFile="regFile_createRunCygwin.reg"
	local runCygwinAsAdminRegFile="regFile_createRunCygwinAsAdmin.reg"
	local delCygwinRegFile="regFile_deleteRunCygwin.reg"
	local delCygwinAsAdminRegFile="regFile_deleteRunCygwinAsAdmin.reg"
	local runCmdRegFile="regFile_createRunCmd.reg"
	local runCmdAsAdminRegFile="regFile_createRunCmdAsAdmin.reg"
	local delCmdRegFile="regFile_deleteRunCmd.reg"
	local delCmdAsAdminRegFile="regFile_deleteRunCmdAsAdmin.reg"
	while [[ "$option" != "1"  \
	&& "$option" != "2" \
	&& "$option" != "3" \
	&& "$option" != "4" \
	&& "$option" != "5" \
	&& "$option" != "6" \
	&& "$option" != "7" \
	&& "$option" != "8" \
	&& "$option" != "9" \
	&& "$option" != "10" ]]
	do
	readData "Menu:\n'press 1' - create simple contex-menu (Run_cygwin_here);\
	\n'press 2' - delete simple contex-menu (Run_cygwin_here);\
	\n'press 3' - create simple contex-menu (Run_cygwin_here_as_admin);\
	\n'press 4' - delete simple contex-menu (Run_cygwin_here_as_admin);\
	\n'press 5' - create simple contex-menu (Run_cmd_here);\
	\n'press 6' - delete simple contex-menu (Run_cmd_here);\
	\n'press 7' - create simple contex-menu (Run_cmd_here_as_admin);\
	\n'press 8' - delete simple contex-menu (Run_cmd_here_as_admin);\
	\n'press 9' - create simple contex-menu;\
	\n'press 10' - exit " option $3
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
				coloredEcho "Creating '$runCygwinAsAdminRegFile' file"  cyan
				createFile $runCygwinAsAdminRegFile $option
				runFile $runCygwinAsAdminRegFile;;
			"4")
				coloredEcho "Creating '$delCygwinAsAdminRegFile' file"  cyan
				createFile $delCygwinAsAdminRegFile $option
				runFile $delCygwinAsAdminRegFile;;
			"5")
				coloredEcho "Creating '$runCmdRegFile' file"  cyan
				createFile $runCmdRegFile $option
				runFile $runCmdRegFile;;
			"6")
				coloredEcho "Creating '$delCmdRegFile' file"  cyan
				createFile $delCmdRegFile $option
				runFile $delCmdRegFile;;
			"7")
				coloredEcho "Creating '$runCmdAsAdminRegFile' file"  cyan
				createFile $runCmdAsAdminRegFile $option
				runFile $runCmdAsAdminRegFile;;
			"8")
				coloredEcho "Creating '$delCmdAsAdminRegFile' file"  cyan
				createFile $delCmdAsAdminRegFile $option
				runFile $delCmdAsAdminRegFile;;
			"9")
				coloredEcho "Creating '$file_name' file"  cyan
				createFile $file_name $option
				coloredEcho "Edit the file $file_name and run it" cyan
				read -p "Press enter to continue";;
			"10")
				coloredEcho "Bye" red
				exit 1;;	
			*)
				coloredEcho "Wrong value" red;;
		esac

	done
}

