# -*- coding:utf-8 -*-
import pandas as pd
import math
import csv
import random
import numpy as np
from sklearn import svm
from sklearn.cross_validation import cross_val_score
from sklearn.linear_model import LogisticRegression
import pickle

def hello():
    with open('./X') as f:
        X = pickle.load(f)
        with open('./y') as g:
            y = pickle.load(g)

        print len(X)
        print len(y)

        new_X = []
        svm_trainning_data = []
        for x in X:
            #new_X.append(np.array(x))

            former = x[:18]
            latter = x[18:36]
            diff = []
            for x, z in zip(former, latter):
                diff.append(x - z)
            #print len(former), len(latter), len(diff)
            #print diff
            svm_trainning_data.append(np.array(diff))

        #X = np.nan_to_num(new_X)
        X = np.nan_to_num(svm_trainning_data)
        y = np.array(y)

        #print len(list(y)), len(list(X))

        model = LogisticRegression()
        #model = svm.SVC(kernel='sigmoid')
        model.fit(X, y)

        print('Do the cross validation:')
        #print(cross_val_score(model, X, y, cv = 10, scoring='accuracy', n_jobs=-1).mean())
        print(cross_val_score(model, X, y, cv = 10).mean())

        with open('svm', 'wb') as h:
            pickle.dump(model, h)

hello()
