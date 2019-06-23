#!/usr/bin/python
#coding:utf-8
import pickle
import pandas as pd
import csv
import sys
import io
import random

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
        row_data = list(row)
        key = row_data[0]  # team name
        value = row_data[1:]  # statistics

        pair = []
        pair.append(key)
        pair.append(value)
        #print pair

        stat_list.append(pair)

    with open('./train_data', 'wb') as f:
        pickle.dump(stat_list, f)

#build_data()

def get_game_result():
    path = './result17_18'
    result = pd.read_csv(path, encoding = 'utf8')

    stat_list = []

    for index, row in result.iterrows():
        row_data = list(row)
        stat_list.append(row_data)
    #stat_list.pop(0)
    del stat_list[0]
    print len(stat_list)

    with open('./result', 'wb') as f:
        pickle.dump(stat_list, f)

def create_trainning_data():
    features = []
    X = []
    y = []

    with open('./result') as result_file:  # get_game_result()
        result = pickle.load(result_file)  # this is a list
        #for item in result:
        #    print item
        #    print 'done'
        #return

        with open('./train_data') as g:
            data = pickle.load(g)
            #for item in data:
            #    print item
            #return
            #print data

            teams = []  # all teams
            coresponding_stats = []  # statistics

            print len(data), len(result)
            return
            for item in data:
                #print item
                teams.append(item[0])  # team
                coresponding_stats.append(item[1])  # stats

            #for item in teams:
            #    print item
            #return

            for each_game_result in result:  # tranverse the whole season
                winner = each_game_result[0]
                loser  = each_game_result[1]
                location = each_game_result[2]

                print winner, loser, location
                return

                # get feature
                feature = []
                winner_index = teams.index(winner)
                feature.append(coresponding_stats[winner])
                loser_index = teams.index(loser)
                feature.append(coresponding_stats[loser_index])
                if location == u'H':  # win at home
                    feature[0].append(1)
                    feature[1].append(0)
                else:
                    feature[0].append(0)
                    feature[1].append(1)

                features.append(feature)


                #flat_feature = [x for sublist in feature for x in sublist]  # real feature
                #X.append(flat_feature)
                if random.random() > 0.5:
                    X.append(feature[0] + feature[1])  # win former
                    y.append(0)
                else :
                    X.append(feature[1] + feature[0])  # win latter
                    y.append(1)

            print X

            with open('./X', 'wb') as xxx:
                pickle.dump(X, xxx)
            with open('./y', 'wb') as yyy:
                pickle.dump(y, yyy)
            with open('./features', 'wb') as zzz:
                pickle.dump(features, zzz)

build_data()
get_game_result()
create_trainning_data()

#get_game_result()

#with open('./result') as f:
#    data = pickle.load(f)
#
#    for i in range(len(data)):
#        print data[i]
