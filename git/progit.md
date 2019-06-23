# Three States of Git
- *modified*
- *staged*
- *commited*
you have a working directory, staging area and git directory (local db)
you modify files in working directory;
    stage file into staging area
    commit changes into git directory.

# Config
- /etc/gitconfig
- ~/.gitconfig
- .git/config
git config  (--global, --system)
git config --global user.name EvergreenHZ
git config --global user.email evergreenhuaizhi@gmail.com
git config  --list

# HELP
- man git-add
- git help add
- git add --help

# Tracked & Untracked
- files are either untracked or tracked(unmodified, modified, staged)
- add the untracked files to tracked (unmodified)
- edit the unmodified file -> modified files
- add the modified files -> staged files
- commit the staged files -> commited/unmodified files
- git status
- Untracked basically means that Git sees a file you didn’t have in
the previous snapshot (commit)
