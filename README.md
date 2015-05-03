K9's dotfiles
========

Use it at your own risks.

```
            __ __              ____  _           ___
           / //_/__  __  __   / __ )(_)___  ____/ (_)___  ____ ______
          / ,< / _ \/ / / /  / __  / / __ \/ __  / / __ \/ __ `/ ___/
         / /| /  __/ /_/ /  / /_/ / / / / / /_/ / / / / / /_/ (__  )
        /_/ |_\___/\__, /  /_____/_/_/ /_/\__,_/_/_/ /_/\__, /____/
                  /____/                               /____/
        =============================================================
                                    K9
```

### tmux
```
C-b j       down
C-b k       up
C-b h       left
C-b l       right

C-b c       Create new window
C-b x       Ask before deleting the current window

C-b w       List windows
C-b q       List panes

C-b "       Split horizontaly
C-b %       Split verticaly

C-b up      Resize up
C-b right   Resize right
C-b left    Resize left
C-b down    Resize down

C-b ,       Rename window
C-b t       Clock mode


Copy mode
---------
C-b pageUp  Enter copy/scrolling
C-b [       Enter copy mode
q           Exit copy mode (without selecting anything)
space       Start selecting
return      Copy selection and exit (can be used to exit)
C-b ]       Paste selection
```

### vim
Useful commands
```
:sp             Split horizontaly
:vsp            Split verticaly
:reg{}          List register content (clipboard)
:verbose  map [key binding]     show who uses that key binding
:e [file]       Edit file
:r [file]       Read file to current buffer (at current cursor position)
:tabdo [cmd]    Execute cmd on all tabs
:bufdo [cmd]    Execute cmd on all buffers
:Explore        Open explorer (usefull for rename files pressing R on desired file)
:on             Close all other split
```
Bindings
```
Many commands accept prefix quantifiers ex: 3dd means delete 3 lines

F5      Paste mode
F4      Toggle NerdTree
F8      Toggle Ctags
F9      Toggle BufferExplorer

Modes
-----
i       Enter insert at current position
I       Enter insert at begining of the line
a       Enter insert at next character
A       Enter insert at end of the line
kj      Leave insert mode
Esc     Leave insert, visual mode

Edition
----
.       Repeat last action
dd      Delete x line
v       Enter visual mode by lines
^k      Enter visual mode by vertical character
r       Replace current character
s       Substitute current character
S       Substitute current line
C       Subsitute rest of the line from current position
yy      Yank current line
p       Paste below
P       Paste on line above
"+p     paste system clipboard
"+y     yank to system clipboard
u       Undo
^r      Redo
dw      Delete word
o       Open a new line below
O       Open a new line above
~       Toggle case for the current character
x       Delete at current position
X       Delete before current position

indenting may use modifiers like k,j or highlighted lines using visual modes (line or block)
"<"l    Unindent current line
>h      Indent current line

Searching
---------
/           Start search
leader ,    Stop highlighting search result
n           Next found item
N           Previous found item

Replacing
---------
:%s/find/replace/g    Find and replace all occurences

Moving cursor around
-------------
j       down
k       up
h       left
l       right
^D      half page down
^U      half page up
0       first character
$       last character
{       paragraph up
}       paragraph down
(       sentence up
)       sentence down
g       top
G       bottom
H       top of the window
M       middle of the window
L       bottom of the window
w       forward one word
e       forward end of word
b       backward 1 word
^y      Scroll up (without moving the cursor)
^e      Scroll down (without moving the cursor)
zz      Move cursor line to the middle of the screen
zt      Move cursor line to the top of the screen
zb      Move cursor line to the bottom of the screen

Folding
-------
zR      Open all folds recursively
za      Open folds recursively below cursor
zc      Close a fold
zo      Open a fold

Buffers
-------
K       Next buffer
J       Previous buffer

Windows
-------
^k      Window up
^j      Window down
^h      Window left
^l      Window right
<       Resize current window left
>       Resize current window right

Tabs
----
C-n     Next tab
C-p     Previous tab

Surround (plugin)
-----------------
Press S-s after highlighting a string

NeoComplete (plugin)
--------------------
C-p     Select previous option
C-n     Select next option

NerdTree (plugin)
-----------------
m       open file menu
o       open file under the cursor
s       split verticaly
i       split horizontaly

Neosnippet
-----------------
Potential snippets appears in the NeoComplete pull down window automatically
C-k     select-and-expand a snippet from the Neocomplcache popup or jump to the next snippet's field.
C-n     Cycle next snippet
C-p     Cycle previous snippet
tab     Can be use instead of C-k to jump to the next field in the snippet

Emmet (plugin)
--------------
^f,      Generate

My functions
------------
leader c    Show end of lines
leader q    Quit
leader w    Save
leader ws   Remove white spaces
```
# Vimdiff
```
]c      Next modification
[c      Previous modification
```
