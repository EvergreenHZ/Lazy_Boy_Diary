#!/usr/bin/python
# -*- coding: <encoding name> -*-
import pandas as pd
import csv
import numpy as np
import pickle
import sys

new_data = [
        'b',
        'c',
        'd',
        'e',
        'f',
        'g',
        'h',
        'i',
        'j',
        'k',
        'l',
        'm',
        'n',
        'o',
        'p',
        'q',
        'r']
csv_file_paths = ['a.csv',
        'b.csv',
        'c.csv',
        'd.csv',
        'e.csv',
        'f.csv',
        'g.csv',
        'h.csv',
        'i.csv',
        'j.csv',
        'k.csv',
        'l.csv',
        'm.csv',
        'n.csv',
        'o.csv',
        'p.csv',
        'q.csv',
        'r.csv']

def read_all_csvs():
    for path, saved_path in zip(csv_file_paths, new_data):
        stat = pd.read_csv(path)
        new_stat = stat.drop(['果', '场', '时间', '得分'], axis=1)
        writer = csv.writer(sys.stdout)
        writer.writerows(new_stat)

read_all_csvs()
