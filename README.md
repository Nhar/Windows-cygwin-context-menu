
## Windows-cygwin-context-menu
Windows-cygwin-context-menu is a program for manipulation contex-menu items

## Requirements:
- cygwin shell
- powershell (for 'run as admin')

## Usage:
- Install cygwin shell
- Instal powershell (Windows 7)
- Add a new environment variable, called `CYGWIN_HOME` and set its value to C:\cygwin (C:\cygwin64)
 Edit the `Path` environment variable and add C:\cygwin\bin (C:\cygwin64\bin) to it (usually separated by a ';').
 **Warning: set up Cygwin directories before Windows system directories.**
- Run `main.sh` script 

## License
This software is licensed using the MIT License.  [MIT](https://choosealicense.com/licenses/mit/)