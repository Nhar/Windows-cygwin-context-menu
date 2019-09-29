#!/bin/bash

#createFile fileName option
createFile(){
local file_name=$1

if [[ $2 = "1" ]]; then
cd ..
path1="$(cmd /c cd)"
#remove  $'\r' 
full_path="${path1/$'\r'/}\icons\Cygwin.ico"
#doubleBackslash
full_path="$(doubleBackslash "$full_path")"
cd scripts
cat > $file_name <<EOF
Windows Registry Editor Version 5.00
[HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cygwin_here]
"Icon"="\"$full_path\""
[HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cygwin_here\command]
@="\"C:\\\cygwin64\\\bin\\\mintty.exe\""
EOF
elif [[ $2 = "2" ]]; then
cat > $file_name <<EOF
Windows Registry Editor Version 5.00
[-HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cygwin_here]
[-HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cygwin_here\command]
EOF
elif [[ $2 = "3" ]]; then
cd ..
path1="$(cmd /c cd)"
#remove  $'\r' 
full_path="${path1/$'\r'/}\icons\cmd.ico"
#doubleBackslash
full_path="$(doubleBackslash "$full_path")"
cd scripts
cat > $file_name <<EOF
Windows Registry Editor Version 5.00
[HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cmd_here]
"Icon"="\"$full_path\""
[HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cmd_here\command]
@="\"C:\\\Windows\\\System32\\\cmd.exe\""
EOF
elif [[ $2 = "4" ]]; then
cat > $file_name <<EOF
Windows Registry Editor Version 5.00
[-HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cmd_here]
[-HKEY_CLASSES_ROOT\Directory\Background\shell\Run_cmd_here\command]
EOF
elif [[ $2 = "5" ]]; then 
cat > $file_name <<EOF
Windows Registry Editor Version 5.00
#Change specific variables
#MenuItem - name of menu item (like cut, create_File, etc.)
#Icon - path to icon file
[HKEY_CLASSES_ROOT\Directory\Background\shell\MenuItem]
"Icon"="\"C:\\\cygwin64\\\cygwin.ico\""

#@= path to cygwin shell, name of script
#Warning - add bash script folder to path
[HKEY_CLASSES_ROOT\Directory\Background\shell\MenuItem\command]
@="\"C:\\\cygwin64\\\bin\\\mintty.exe\" \"nameOfScript.sh\""
EOF

fi
}
#doubleBackslab path
doubleBackslash(){
	echo $1 | sed -e 's/\\/\\\\/g'
}

function example { args : string firstName , string lastName , integer age } {
  echo "My name is ${firstName} ${lastName} and I am ${age} years old."
}

#runFile path
runFile(){
	cmd /c "%SystemRoot%\regedit.exe `cygpath -w $1`"
}
