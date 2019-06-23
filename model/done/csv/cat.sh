#!/bin/bash

for each_file in $(ls *.csv);
do
        cat $each_file >> out_result
done
