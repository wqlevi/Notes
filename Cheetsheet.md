
## Typora:
~~~ python
Ctrl+/	# Toggle between source code mode and displayed
Ctrl+Shift+L # toggle sidebar
Ctrl+L  # select whole line
Shift+Enter # new line
Enter 	    # new paragraph
Ctrl+Shift+Backspace 	# delete line
Ctrl+E	# select cell(per type)
Ctrl+D	# select word
Ctrl+Shift+D # delete word
Ctrl+Home/End  		# jump to top/ bottom
Shift+Enter # find previous
Ctrl+H  # replace
F8	# focus mode
F9	# typewritter mode
Ctrl+Shift+ =/-		# zoom in/out
Ctrl+Shift+I		# insert picture
~~~

## Git:
~~~bash
git init #initiate git inside a directory
git config --global user.name "MYNAME"
git config --global user.email "some@mail.com"
git config --global color.ui auto # enable auto coloring

git clone <url> #clone a existing repo from git(from <url>)
git clone <branch> <url> # clone specific branch from <url>
git pull origin [branch] # update local repo from git and [branch]

git status # show modified files, staged for next commit
git add <file> # add a file for next commit
git reset <file> # unstage a file
git diff # different of whats changed but not staged
git diff --staged # different of whats staged but not committed
git commit -m "MESSAGE TO COMMIT" 

git branch # list all branches, a star(*) will appear next to current activate branch
git branch <branch_name> #create new branch
git checkout # switch to another branch and checkout it into cwd
git merge <branch> # merge specific branch to current branch
git log # show all commits history

git log <branch_A> <branch_B> # show commit history that are on branch_A but not branch_B
git diff <branch_A> <branch_B> # show difference between branch_A and branch_B

# create remote repo from local
git remote add origin <url> # create a git repo from local repo
git branch -M main
git push -u origin [branch] # push commits to remote repo, and set local [branch] as upstream
~~~

## Vim
a example .vimrc script [here](https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/)
~~~bash
gt # go to next tab
:tabnew <filename> # open new file in tab
:%s/foo/bar/gc  # replace ALL instance of 'foo' by 'bar' and ask for confirmation for each
:s/foo/bar/gc   # replace INLINE instance of 'foo' by 'bar' and ask for confirmation for each
%  # go to next matching bracket
Ctrl+N/Ctrl+P   # code completion using the first/previous match
*/# :           # search the word under cursor, backwards/forwards
za              # toggle folding option
:term           # open terminal shell in current panel 
~~~
### VimTex
more of its full list of command [here](https://github.com/lervag/vimtex/blob/e323c55e9669c1adb205295b06ec4463bae5b637/doc/vimtex.txt#L669)
~~~bash
\ll # to start(or stop) compiling
\lk # to stop compiling
\lc # to clear auxiliary files
\le # to toggle log error panel(the one split at bottom)
\lt # to toggle Table-of-Contents(ToC) panel
:cse [blockname]# a command to toggle surrouding environment change to [blockname]
:dse # delete an environment
:tse # to toggle "*" in environments
]] # * in NORMAL mode jump to next block | in INSERT mode close the environment
~~~
### Zathura
more of the shortcuts for the viewer is listed [here](http://manpages.ubuntu.com/manpages/xenial/man1/zathura.1.html)
~~~bash
#Basic Key Bindings:
+,-,= # zoom in, out, origional size
zI, zO, z0 # zoom in, out, origional size(more freely)
n= # zoom to size 'n'
q # quit
~~~

## LaTex
check out how to strike out words using packages [here](https://jansoehlke.com/2010/06/strikethrough-in-latex/)
~~~tex
\LaTex
~~~
