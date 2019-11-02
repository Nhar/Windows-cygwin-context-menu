

#createFile fileName option
createFile(){
local file_name=$1

if [[ $2 = "1" ]]; then
path1="$(cmd /c cd)"
#remove  $'\r' 
full_path="${path1/$'\r'/}\icons\Cygwin.ico"
#doubleBackslash
full_path="$(doubleBackslash "$full_path")"
cat > $file_name <<EOF
Windows Registry Editor Version 5.00
[HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cygwin_here]
"Icon"="\"$full_path\""
[HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cygwin_here\command]
@="\"$CYGWIN_PATH\" \"-c cd\""
EOF
elif [[ $2 = "2" ]]; then
cat > $file_name <<EOF
Windows Registry Editor Version 5.00
[-HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cygwin_here]
[-HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cygwin_here\command]
EOF
elif [[ $2 = "3" ]]; then
path1="$(cmd /c cd)"
#remove  $'\r' 
full_path="${path1/$'\r'/}\icons\Cygwin.ico"
#doubleBackslash
full_path="$(doubleBackslash "$full_path")"
cat > $file_name <<EOF
Windows Registry Editor Version 5.00
[HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cygwin_here_as_admin]
"Icon"="\"$full_path\""
[HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cygwin_here_as_admin\command]
@="powershell -windowstyle hidden -Command \"Start-Process '$CYGWIN_PATH' -Verb runAs\""
EOF
elif [[ $2 = "4" ]]; then
cat > $file_name <<EOF
Windows Registry Editor Version 5.00
[-HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cygwin_here_as_admin]
[-HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cygwin_here_as_admin\command]
EOF
elif [[ $2 = "5" ]]; then
path1="$(cmd /c cd)"
#remove  $'\r' 
full_path="${path1/$'\r'/}\icons\cmd.ico"
#doubleBackslash
full_path="$(doubleBackslash "$full_path")"
cat > $file_name <<EOF
Windows Registry Editor Version 5.00
[HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cmd_here]
"Icon"="\"$full_path\""
[HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cmd_here\command]
@="\"$CMD_PATH\""
EOF
elif [[ $2 = "6" ]]; then
cat > $file_name <<EOF
Windows Registry Editor Version 5.00
[-HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cmd_here]
[-HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cmd_here\command]
EOF
elif [[ $2 = "7" ]]; then
path1="$(cmd /c cd)"
#remove  $'\r' 
full_path="${path1/$'\r'/}\icons\cmd.ico"
#doubleBackslash
full_path="$(doubleBackslash "$full_path")"
cat > $file_name <<EOF
Windows Registry Editor Version 5.00
[HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cmd_here_as_admin]
"Icon"="\"$full_path\""
[HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cmd_here_as_admin\command]
@="powershell -windowstyle hidden -Command \"Start-Process '$CMD_PATH' -Verb runAs\""
EOF
elif [[ $2 = "8" ]]; then
cat > $file_name <<EOF
Windows Registry Editor Version 5.00
[-HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cmd_here_as_admin]
[-HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cmd_here_as_admin\command]
EOF
elif [[ $2 = "9" ]]; then 
cat > $file_name <<EOF
Windows Registry Editor Version 5.00
#Change specific variables
#MenuItem - name of menu item (like cut, create_File, etc.)
#Icon - path to icon file
[HKEY_CLASSES_ROOT\Directory\Background\shell\MenuItem]
"Icon"="\"$CYGWIN_PATH\\""

#@= path to cygwin shell, name of script
#Warning - add bash script folder to path
[HKEY_CLASSES_ROOT\Directory\Background\shell\MenuItem\command]
@="\"$CYGWIN_PATH\" \"$ENV_PATH\" CHERE_INVOKING=1 \"$BASH_PATH\" -l -e \"nameOfScript.sh\""
EOF

fi
}

#runFile path
runFile(){
	cmd /c "%SystemRoot%\regedit.exe `cygpath -w $1`"
}
