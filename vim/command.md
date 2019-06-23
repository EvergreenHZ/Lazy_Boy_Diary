NOTES FOR VIM
=============

# check match mount
:%s/pattern//gn
:'<,'>s/pattern//gn

# substitute
:%s/pattern/replace/g

# paste in insert mode
C-r "  # insert last delete/yank
C-r *  # insert contents in clipboard

# delete content in a blanket
da(  # around
di(  # inner

# delete a buffer
:bdelete

# insertion abbreviation, type --- replaced by &mdash
:iabbrev <buffer> --- &mdash;

# Manage Tabs
:tabnew name  ; open a new tab
gt            ; go to next tab
gT            ; go to previous tab


# ctags, to trace files
ctags -R -f ./.git/tags .

# comments 
"
# help
* :help echo
* :help echom
* :help messages

# RECURSION MAP
## map (any mode)
* map - dd
* map <space> viw
* map <c-d> dd

## to specification, try: imap, vmap, nmap

## cancel map: nunmap, iunmap, vunmap
* nunmap -


# NON-RECURION MAP
* nnoremap - dd

# Leader Key
* let mapleader = ","
* nnoremap <leader>d dd

# Local leader for certain file (say python, html...)
* let maplocalleader = "-"
* for more information:
* help mapleader/maplocalleader

# Edit your .vimrc file
* :echo $MYVIMRC
* :nnoremap <leader>ev :vsplit $MYVIMRC<cr> "to edit your vimrc file

# Abbreviation for insert, replace & commond mode
* iabbrev ,a <Esc>I "go to the beginning of the line in insertino mode
* abbre is not totally same as map:  
** Mappings don't take into account what characters come before or after the map -- they only look at the specific sequence that you mapped to.
** map just considers sequence, abbre only replace the exact word

# Buffer local options
* nnoremap <buffer> <leader>x dd
* The <buffer> in the second nnoremap command told Vim to only consider that mapping when we're in the buffer where we defined it.
* use set or setlocal to set options

# AutoCommands
* Autocommands are a way to tell Vim to run certain commands whenever certain events happen. 
* autocmd BufNewFile * :write
* autocmd BufNewFile *.txt :write
* autocmd BufWritePre,BufRead *.html :normal gg=G
* autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
* autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>

# AutoCommand Group
## e.g. (create a group)
- augroup testgroup
-     autocmd BufWrite * :echom "Foo"
-     autocmd BufWrite * :echom "Bar"
- augroup END
## append autocommand
- augroup testgroup
-     autocmd BufWrite * :echom "Baz"
- augroup END
## clear autocommand
- augroup testgroup
-     autocmd!
-     autocmd BufWrite * :echom "Cats"
- augroup END


# Operator Pending
* An operator is a command that waits for you to enter a movement command, and then does something on the text between where you currently are and where the movement would take you.
* onoremap p i(  "now you can use dp as di(
* e.g. try :onoremap b /return<cr>

# replace all of the ^M with space
:%s/<Ctrl-V><Ctrl-M>/\r/g
