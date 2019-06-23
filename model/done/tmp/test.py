#!/usr/bin/python
#coding:utf-8
import pandas as pd
import csv
import numpy as np
import pickle
import sys

def read_all_csvs():
    path = 'xxx'
    stat = pd.read_csv(path, encoding = 'utf8')
    new_stat = stat.drop(['Time', 'result','Loc', 'Game'], axis=1)
    new_stat = new_stat.set_index('Team', inplace=False, drop=True)
    new_stat.to_csv('yyy', encoding='utf8')
    print new_stat
    #writer = csv.writer(sys.stdout)
    #writer.writerows(stat)

#read_all_csvs()
