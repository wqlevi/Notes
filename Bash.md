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
esle
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








