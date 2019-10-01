

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
