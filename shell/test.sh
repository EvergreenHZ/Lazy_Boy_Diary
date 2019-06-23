#!  /bin/bash

rm -rf *.rar
unzip '*.zip'
rm -rf *.zip

for dir in $(ls -d */ | cut -f1 -d'/')
do
        cd ${dir};
        echo "${dir}" > ./$dir.txt
        for subdir in $(ls -d */ | cut -f1 -d'/')
        do
                cd ${subdir};
                echo ${subdir} &>> ../../$dir.txt
                ((gcc *.c -w || g++ *.cpp -w) &>>  ../../$dir.txt ) && \
                        ./a.out &>> ../../$dir.txt
                cd ..;
        done
        echo -e "\n\n\n"  >> $dir.txt
        cd ..
done
