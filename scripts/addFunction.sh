

# coloredEcho "This text is green" green (optional)
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
	if [ "$3" != "" ]; then
		tput bold;
	fi
	# -e flag = newline characters
    echo -e "$exp";
    tput sgr0;
}

#$coloredEcho text color (optional) bold (optional)
coloredEchoV2(){
    local exp=$1;
    local color=$2;
	local bold=$3;
    if ! [[ $color =~ '^[0-9]$' ]] ; then
       case $(echo $color | tr '[:upper:]' '[:lower:]') in
        black) color="\e[30m" ;;
        red) color="\e[31m" ;;
        green) color="\e[32m" ;;
        yellow) color="\e[33m" ;;
        blue) color="\e[34m" ;;
        magenta) color="\e[35m" ;;
        cyan) color="\e[36m" ;;
		lightgray) color="\e[37m" ;;
		darkgray) color="\e[90m" ;;
		lightred) color="\e[91m" ;;
		lightgreen) color="\e[92m" ;;
		lightyellow) color="\e[93m" ;;
		lightblue) color="\e[94m" ;;
		lightmagenta) color="\e[95m" ;;
		lightcyan) color="\e[96m" ;;
        white|*) color="\e[39m" ;; # white or invalid color
       esac
    fi
	local output="$color$exp"
	if [ "$3" != "" ]; then
		tput bold;
	fi
    echo -e $output
	tput sgr0;
}

#readData text varName color
readData(){
	coloredEcho "$1" "$3"
	read "$2"  
}

#readData text varName color (optional) bold (optional)
readDataV2(){
	coloredEchoV2 "$1" "$3" "$4"
	read "$2"  
}

#doubleBackslab path
doubleBackslash(){
	echo $1 | sed -e 's/\\/\\\\/g'
}
#tripleBackslab path
tripleBackslash(){
	echo $1 | sed -e 's/\\/\\\\\\/g'
}
#sixfoldBackslab path
sixfBackslash(){
	echo $1 | sed -e 's/\\/\\\\\\\\\\\\/g'
}
