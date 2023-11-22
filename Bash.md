# Bash

## Exit code
The exit code refers to a returning status from an execution, both in bash and C such status was implemented.

A simple example could be addressed here:
~~~bash
cd dir_exist
echo $?
# This means program ran properly thus returns 0
>>> 0

cd dir_non_exist
echo $?
# This means a general error, since directory is non-existed
>>> 1
~~~
One could also write a follow-up script to show status per program:
~~~bash
#!/bin/bash

vim file.txt
if [ $? -eq 0 ]
then 
  echo "The script is OK"
  exit 0
else
  echo "The script failed" >&2
  exit 1
if
~~~
Since numbers from 0 to 255 represent detailed exit status, could be better to check [this](tldq.org/LDP/abs/html/exitcodes.html) for details.

## overwritten Bashrc
To retrieve the mistakenly overwritten bashrc file:
if the shell session running previous bashrc is still active:
~~~bash
cp /etc/skel/.bashrc ~/.bashrc
#or
declare > .bashrc.recovered
~~~

Put alias in seperated file(e.g. `~/.bash_alias`), called by `./bashrc`

~~~bash
source ~/.bash_alias
~~~

## authorizing permission
~~~
chown [OPTION] [USER][:GROUP] [FILE] # change the repository or file ownership to user/group\
                                     # if only [USER] is specified, then the ownership is changed to [USER]\
                                     # if only [:GROUP] is specified, then the ownership is changed to [:GROUP]\
                                     # if [USER:GROUP] are specified, the ownership is changed to both [USER] and [:GROUP]\
                                       
id -Gn [USER]                        # show the groups this [USER] belongs to
~~~

## Colorize python output to shell prompt
~~~python
class color_code:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

print(f"{color_code.WARNING}Warning: No active frommets remain. Continue?{color_code.ENDC}")
~~~

---
## Nevigation on commandline
_moving cursor_\
`Ctrl+A`: go to the __beginning__ of the line currently typing on\
`Ctrl+E`: go to the __end__ of the line currently typing on \
`Ctrl+xx`: move between the beginning of the line and the cursor position\
`Alt+F`: move the cursor one word forward\
`Alt+B`: move the cursor one word backward\
`Ctrl+F`: move the cursor one charactor forward\
`Ctrl+B`: move the cursor one charactor backward\

_cutting/ pasting_\
`Ctrl+U`: cut the current line from cursor position to beginning of the line\
`Ctrl+K`: cut the current line from cursor position to end of the line\
`Ctrl+W`: delete the word before the cursor, adding to the clipboard\
`Ctrl+Y`: pasting the thing on clipboard to current line \

_search history_\
`Ctrl+R`: search through the command history\
`Ctrl+G`: leaving the history searching mode\
`Ctrl+J`: copy the currently searched history cmd to cmdline, without executing it\
`Alt+R`: revert changed to cmd line from history\

`!!`: display last executed command\
`!*`: display the argument of the last command\

`Ctrl+S`: stop the output of program to screen\
`Ctrl+Q`: resume the output to the screen\
`Ctrl+C`: end current progress and return to prompt\
`Ctrl+D`: logout of current session\
`Ctrl+Z`: suspend foreground process, use `bg` to take it to background, or `fb` to bring it back to foreground\

_Users_\
`~+TAB+TAB`:list all users\

## check file exitstance
~~~bash
if [[-d "$DIR"]]
then 
  echo "$DIR exists!"
fi

if [[-f "$FILE"]]
then echo "$FILE exists!"
fi
~~~

## Create multiple files without writting content
~~~bash
touch file1 file2
~~~
## View a file with read-only
~~~bash
view file.txt
~~~

## Monitor machine activities 
__MacOS__
~~~bash
# on an Intel CPU machine:
# using measurement from the SMC sensor
powermetrics --sample smc | grep -i "CPU die temperature"

# Nvidia-smi monitoring (updating per 1 sec)
nvidia-smi -l 1

# Monitor free space in disk and swap
free -h

# updating the output from the command
watch -n [SECOND]

# list processes
ps aux

# list system informations
inxi -F
~~~

## Auto-completion in generic bash shell
### Steps:
1. Install `bash-completion`:`sudo apt install bash-completion`;
2. Write to `~/.bashrc`, then source it:
~~~bash
 if ! shopt -oq posix; then
   if [ -f /usr/share/bash-completion/bash_completion ]; then
     . /usr/share/bash-completion/bash_completion
   elif [ -f /etc/bash_completion ]; then
     . /etc/bash_completion
   fi
 fi
~~~
3. Assign some completion to the cmd: `complete [TARGET ARGUMENTS] [COMMAND TO BE ASSIGNED TO]`, an example:
~~~bash
$ complete -W name@remote.domain ssh 
$ ssh [TAB] 
ssh name@remote.domain
~~~
4. Done


## Moving the files
* moving last 100 files from _current_dir_ to _new_dir_: 
~~~bash
mv -t new_dir `ls current_dir | tail -n 100` 
~~~
* movign from remote server back to local machine:
~~~bash
rsync -aP -e 'ssh -J MyUsername@gateafs.mpcdf.mpg.de' source/dir MyUsername@eris01.bc.rzg.mpg.de:/destination
# reverse the source and distination when reverse the transferring
~~~

## Installing softwares
### Steps:
1. Download and unzip(e.g. to a `/downloads/pkg/software` folder, which include bin and includes)
2. Put such software bundle into `~/.local/share` folder, cuz its a convention
3. Create symbolic link(e.g. `ln -s ~/.local/share/software/bin/exe ~/.local/bin/exe`)
4. Add such `~/.local/bin` or your `$HOME/bin` folder to `$PATH`, for convenient launching.


### Generic Software
#### [ImageMagick](Manuals/ImageMagick.md)
~~~bash
identity <file> #tells basic spatial information of image
convert -/+append [<input_1> <input_2>...] <output> # append vertical/horizontal
convert <file> -crop 1xn@ out-%d.png # split one evenly to n
mogrify <file> -resize Nx *.png # rescale image by given width N proportionally 
~~~

### Commandline tools
#### [AWK](https://www.geeksforgeeks.org/awk-command-unixlinux-examples/)
#### CPU temperature
~~~bash
paste <(/sys/class/thermal/thermal_zone*/temp) | column -s $'\t' -t | sed 's/\(.\)..$/.\1°C/'
~~~
