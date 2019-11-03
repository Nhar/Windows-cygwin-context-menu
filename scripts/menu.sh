
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
	while ! [[ "$option" =~ "^[1-10]$" ]]
	do
	coloredEchoV2 "Menu:" $4 bold
	coloredEchoV2 "press 1 - create simple contex-menu (Run_cygwin_here);" $4 
	coloredEchoV2 "press 2 - delete simple contex-menu (Run_cygwin_here);" $3
	coloredEchoV2 "press 3 - create simple contex-menu (Run_cygwin_here_as_admin);" $4
	coloredEchoV2 "press 4 - delete simple contex-menu (Run_cygwin_here_as_admin);" $3
	coloredEchoV2 "press 5 - create simple contex-menu (Run_cmd_here);" $4
	coloredEchoV2 "press 6 - delete simple contex-menu (Run_cmd_here);" $3
	coloredEchoV2 "press 7 - create simple contex-menu (Run_cmd_here_as_admin);" $4
	coloredEchoV2 "press 8 - delete simple contex-menu (Run_cmd_here_as_admin);" $3
	coloredEchoV2 "press 9 - create simple contex-menu;" $4
	readDataV2 "press 10' - exit " option red
	case $option in
			"1")
				coloredEchoV2 "Creating '$runCygwinRegFile' file" cyan
				createFile $runCygwinRegFile $option
				runFile $runCygwinRegFile;;
			
			"2")
				coloredEchoV2 "Creating '$delCygwinRegFile' file"  cyan
				createFile $delCygwinRegFile $option
				runFile $delCygwinRegFile;;
			"3")
				coloredEchoV2 "Creating '$runCygwinAsAdminRegFile' file"  cyan
				createFile $runCygwinAsAdminRegFile $option
				runFile $runCygwinAsAdminRegFile;;
			"4")
				coloredEchoV2 "Creating '$delCygwinAsAdminRegFile' file"  cyan
				createFile $delCygwinAsAdminRegFile $option
				runFile $delCygwinAsAdminRegFile;;
			"5")
				coloredEchoV2 "Creating '$runCmdRegFile' file"  cyan
				createFile $runCmdRegFile $option
				runFile $runCmdRegFile;;
			"6")
				coloredEchoV2 "Creating '$delCmdRegFile' file"  cyan
				createFile $delCmdRegFile $option
				runFile $delCmdRegFile;;
			"7")
				coloredEchoV2 "Creating '$runCmdAsAdminRegFile' file"  cyan
				createFile $runCmdAsAdminRegFile $option
				runFile $runCmdAsAdminRegFile;;
			"8")
				coloredEchoV2 "Creating '$delCmdAsAdminRegFile' file"  cyan
				createFile $delCmdAsAdminRegFile $option
				runFile $delCmdAsAdminRegFile;;
			"9")
				coloredEchoV2 "Creating '$file_name' file"  cyan
				createFile $file_name $option
				coloredEcho "Edit the file $file_name and run it" cyan
				read -p "Press enter to continue";;
			"10")
				coloredEchoV2 "Bye" lightred
				exit 1;;	
			*)
				coloredEchoV2 "Wrong value" lightred;;
		esac

	done
}

