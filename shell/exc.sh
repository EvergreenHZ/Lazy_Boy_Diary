#! /bin/bash

num=1
for dir in */
do
	find ${dir} -name *.jpg | sort > ${num}
	num=$((num+1))
done
