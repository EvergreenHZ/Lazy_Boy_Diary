find . -type f
find . -type d
find . -name 'hello.txt'
find . -regex [a-z].so

find . -mtime -2
find . -mtime +2

find . -type f -print -exec ls {} \;
find . -type f | xargs file
