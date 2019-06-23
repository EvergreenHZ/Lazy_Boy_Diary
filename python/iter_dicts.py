#!/usr/bin/python
#coding:utf-8
import pickle
import sys
import io

names_map = {}

with io.open('./map_names', encoding='utf-8') as f:
    list_names = f.read().splitlines()
    names_map = {list_names[i]: list_names[i+1] for i in range(0, len(list_names), 2)}
    for key, value in names_map.iteritems():
        print key, value
