#!/usr/bin/python
#coding:utf-8
import pickle
import pandas as pd
import csv
import sys
import io
import random

def build_data():
    path = './ideal_csv'
    stat = pd.read_csv(path, encoding = 'utf8')
    stat.set_index('Team', inplace = False, drop = True)

    stat_list = []

    for index, row in stat.iterrows():
        row_data = list(row)
        key = row_data[0]  # team name
        value = row_data[1:]  # statistics
        if len(value) != 17:
            print len(value)

        pair = []
        pair.append(key)
        pair.append(value)
        #print pair

        stat_list.append(pair)

    #print 'ideal_csv ori_data: ' + str(len(stat_list))  # 2596, right
    with open('./train_data', 'wb') as f:
        pickle.dump(stat_list, f)

def get_game_result():
    path = './result17_18'
    result = pd.read_csv(path, encoding = 'utf8')

    stat_list = []

    for index, row in result.iterrows():
        row_data = list(row)
        stat_list.append(row_data)

#    foo = []
#    for i in range(len(stat_list)):
#        foo = foo + stat_list[i]
#
    #foo = set(foo)
    #foo.remove(u'H')
    #foo.remove(u'V')
    #for item in foo:
    #    print item

    #print len(foo)

    with open('./game_result', 'wb') as f:
        pickle.dump(stat_list, f)

def create_trainning_data():
    features = []
    X = []
    y = []

    with open('./game_result') as game_result:  # get_game_result()
        result = pickle.load(game_result)  # this is a list
        #print len(result)

        with open('./train_data') as g:  # list too
            data = pickle.load(g)

            teams = []  # all teams
            coresponding_stats = []  # statistics

            for item in data:
                #print item
                teams.append(item[0])  # team
                coresponding_stats.append(item[1])  # stats

            #for item in coresponding_stats:
            #    if len(item) != 17:
            #        print len(item)
            #print teams.count(u'Denver Nuggets')
            #count = 0
            #for i in result:
            #    if i[0] == u'Denver Nuggets' or i[1] == u'Denver Nuggets':
            #        count += 1

            #print count

            #team_set = set(teams)
            #for item in team_set:
            #    print item
            #return

            #print len(result)
            with open('./V_H') as vh:
                v_or_h = vh.read().splitlines()
            print len(v_or_h)
            ITERATE = 0
            for each_game_result in result:  # tranverse the whole season less
                feature = []
                winner = each_game_result[0]
                loser  = each_game_result[1]
                #location = each_game_result[2]
                location = v_or_h[ITERATE]
                ITERATE = ITERATE + 1
                #print winner,loser, location
                #print type(location), location
                #print location

                # get feature
                try:
                    winner_index = teams.index(winner)
                except:
                    break
                try:
                    loser_index = teams.index(loser)
                except:
                    break
                feature.append(coresponding_stats[winner_index])
                feature.append(coresponding_stats[loser_index])
                #print len(feature[0]), len(feature[1])

                print winner, coresponding_stats[winner_index]
                print loser, coresponding_stats[loser_index]
                print location
                print

                break

                del coresponding_stats[winner_index]
                del coresponding_stats[loser_index]
                del teams[winner_index]
                del teams[loser_index]
                #print winner_index, winner, loser_index, loser
                #print len(feature[0])

                #if location == u'H':  # win at home
                #    feature[0].append(1)
                #    feature[1].append(0)
                #if location == u'V':
                #    feature[0].append(0)
                #    feature[1].append(1)
                #if location == unicode('H'):  # win at home
                #    feature[0].append(1)
                #    feature[1].append(0)
                #if location == unicode('V'):
                #    feature[0].append(0)
                #    feature[1].append(1)

                #print type(feature[0])
                #print type(feature[1])
                #print len(feature[0]), len(feature[1])
                if location == 'H':  # win at home
                    #print ITERATE
                    #print len(feature[0]), len(feature[1])
                    (feature[0]).append(1)
                    (feature[1]).append(0)
                    #print len(feature[0]), len(feature[1])
                    #print
                if location == 'V':
                    #print ITERATE
                    #print len(feature[0]), len(feature[1])
                    (feature[0]).append(0)
                    (feature[1]).append(1)
                    #print len(feature[0]), len(feature[1])
                    #print

                #print len(feature[0]), len(feature[1]), len(feature[0] + feature[1])
                features.append(feature)

                #print len(feature[0] + feature[1])
                if random.random() > 0.5:
                    X.append(feature[0] + feature[1])  # win former
                    y.append(0)  # label 0, the former wins
                else :
                    X.append(feature[1] + feature[0])  # win latter
                    y.append(1)

            with open('./X', 'wb') as xxx:
                pickle.dump(X, xxx)
            with open('./y', 'wb') as yyy:
                pickle.dump(y, yyy)
            with open('./features', 'wb') as zzz:
                pickle.dump(features, zzz)

build_data()
get_game_result()
create_trainning_data()
