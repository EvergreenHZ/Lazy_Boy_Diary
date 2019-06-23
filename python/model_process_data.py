#!/usr/bin/python
#coding:utf-8
import pickle
import pandas as pd
import csv
import sys
import io

#with io.open('./map_names', encoding='utf-8') as f:
#    names_map = {}
#    list_names = f.read().splitlines()
#    names_map = {list_names[i]: list_names[i+1] for i in range(0, len(list_names), 2)}
#    for key, value in names_map.iteritems():
#        print '%s/' + value + '/' + key +'/g'

def build_data():
    path = './ideal_csv'
    stat = pd.read_csv(path, encoding = 'utf8')
    stat.set_index('Team', inplace = False, drop = True)

    stat_list = []

    for index, row in stat.iterrows():
        #print index
        stat_list.append(list(row))

    for item in stat_list:
        print item
    #with open('./train_data', 'wd') as f:
    #    pickle.dump(stat_list, f)

build_data()
