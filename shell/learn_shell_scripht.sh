#!/bin/bash
# LEARN SHELL SCRIPT

date; who

echo $PATH

user_name="Tristian Hsu"
echo user_name

date_string=`date`
echo $date_string

date_string2=$(date +%y%m%d)
echo $date_string2
ls -alF ./learn_shell_script.sh > log.$date_string2
wc < learn_shell_script.sh | cat
