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
