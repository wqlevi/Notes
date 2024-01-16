
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

# Git SSH:
ssh-keygen -t ed25519 -C "your_email@example.com"  # generate new SSH key, by creating pair of new file(e.g. id_ed25519, id_ed25519.pub)
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519 # save password phase into such file

git clone <url> #clone a existing repo from git(from <url>)
git clone <branch> <url> # clone specific branch from <url>
git pull origin [branch] # update local repo from git and [branch]

git status # show modified files, staged for next commit
git add <file> # add a file for next commit
git reset <file> # unstage a file
git diff # different of whats changed but not staged
git diff --staged # different of whats staged but not committed
git commit -m "MESSAGE TO COMMIT" 
git rm --cache <file> # untack a local file, put it into cache

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

# change remote from URL to SSH
git remote set-url <SSH/repo/address>
git remote -v # check with this command
~~~

## [Vim](https://vimhelp.org/usr_toc.txt.html)
an example .vimrc script [here](https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/) and a [book](https://learnvimscriptthehardway.stevelosh.com/)
~~~bash
gt # go to next tab
gf # go to the definition of the file path where the cursor is hovering on
:tabnew <filename> # open new file in tab
:term           # open terminal shell in current panel

#------------extra settings------------#
set wildmode=full # set the explore menu for cmd completion to default
set wildmenu    # set wildmenu explore window

set tabstop=4   # set TAB = 4*SPACE
set shiftwidth=4
set expandtab

Ctrl+w+v        # open split window vertically

Note: when searched pattern contains [ or ], use \[ or \] instead
:%s/foo/bar/gc  # replace ALL instance of 'foo' by 'bar' and ask for confirmation for each
:s/foo/bar/gc   # replace INLINE instance of 'foo' by 'bar' and ask for confirmation for each

%               # go to next matching bracket
]]              # go to next { or } location
f[SYMBOL]       # go to next matching [SYMBOL]
Ctrl+N/Ctrl+P   # code completion using the first/previous match
Ctrl+I/Ctrl+o   # move cursor to forward/previous modified location
*/# :           # search the word under cursor, backwards/forwards
za              # toggle folding option
zO              # unfold to maximium level
zr              # unfold all hierarchy
<C-D>           # also used for auto complete command

`.              # back to last cursor position of editing 
.               # repeat the last command(e.g. `dw` for deleting words)

#------------extra editing------------#
<Insert MODE> Ctrl+v [UNICODE]   # to inplace covert unicode in vim
ga              # display charater code name under cursor
mark or m [SYMBOL]   # place a mark [SYMBOL] at cursor location
marks [SYMBOL]  # show specific mark [SYMBOL] location
'[SYMBOL]       # return to mark location [SYMBOL]

#------------quick editing------------#
di" or di(  # put curse at the line, then delete content inside " " or ()
{ or ( or : # get out of a {} or () or " " 
q<a-z> [SOME ACTIONS]  # to record the action following the letter in <a-z> into register, press q again to end recording
@<a-z>                 # repeat the recorded action

#------------file editing------------#
`t`             # for selecting files in VIFM then use `y` to yank
[VISUAL MODE]: w newfile.txt     # save highlighted text to new file
[VISUAL MODE] "*y                # copy highlighted text to system clipboard
:r newfile.txt  # load and past newfile to cursor location
:!ctags *.c     # generate tags for all *.c file in current dir, then each function could be accessed by <C-]> or go backwards by <C-T>

~~~
### [Unicode.vim](https://github.com/chrisbra/unicode.vim)
~~~bash
# Quick completion
<C-X><C-Z> # to complete current Unicode under cursor
            example :
            euro <C-X><C-Z> ➡️ 💶
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
### Coc Vim LSP
~~~bash
  call coc#config('python', {
  \   'jediEnabled': v:false,
  \   'pythonPath': split(execute('!which python'), '\n')[-1]
  \ }) # automatically parse current python env to the LSP
# or
CocCommand python.setInterpreter # the choose target env

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

Plotting package: [Tikz](https://tikz.dev/)
* For plotting package `Pgfplot`, memory overflow happens often, instead of modifying `textmf.cnf`, it's easier to compile with `lualatex -shell-escape <file>` other than `pdflatex -shell-escape <file>` 

## Markdown
* Line break: 2 training space(or put 2 spaces after the first line.)

## Gnome Ubuntu Files window
* Press `F3` to vertical split an identical window for moving files
