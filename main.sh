#!/bin/bash
#load files
source "./scripts/addFunction.sh"
source "./scripts/menu.sh"
source "./scripts/filesMan.sh"
source "./scripts/setProp.sh"

#main
#set properties
caseMenuProp option1 properties.sh green lightgreen
source "properties.sh"

#input data
caseMenu option regFile.reg green lightgreen
