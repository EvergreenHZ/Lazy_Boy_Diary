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

        stat_list.append(pair)

    with open('./train_data', 'wb') as f:
        pickle.dump(stat_list, f)

def get_game_result():
    path = './result17_18'
    result = pd.read_csv(path, encoding = 'utf8')

    stat_list = []

    for index, row in result.iterrows():
        row_data = list(row)
        stat_list.append(row_data)

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

            with open('./V_H') as vh:
                v_or_h = vh.read().splitlines()
            ITERATE = 0
            for each_game_result in result:  # tranverse the whole season less
                feature = []
                winner = each_game_result[0]
                loser  = each_game_result[1]
                location = each_game_result[2]
                location = v_or_h[ITERATE]
                ITERATE = ITERATE + 1

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
                del coresponding_stats[winner_index]
                del coresponding_stats[loser_index]
                del teams[winner_index]
                del teams[loser_index]

                team1_feature = feature[0][:]
                team2_feature = feature[1][:]

                if location == 'H':  # win at home
                    team1_feature.append(1)
                    team2_feature.append(0)
                if location == 'V':
                    team1_feature.append(0)
                    team2_feature.append(1)

                if random.random() > 0.5:
                    X.append(team1_feature + team2_feature)  # win former
                    y.append(0)
                else :
                    X.append(team2_feature + team1_feature)  # win latter
                    y.append(1)

            with open('./X', 'wb') as xxx:
                pickle.dump(X, xxx)
            with open('./y', 'wb') as yyy:
                pickle.dump(y, yyy)

build_data()
get_game_result()
create_trainning_data()
