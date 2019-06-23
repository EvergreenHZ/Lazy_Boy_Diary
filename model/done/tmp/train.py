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

        #print X[0]
        #print y[0]
        #print len(y)
        #print len(X)
        #print type(X[0])
        new_X = []
        for x in X:
            new_X.append(np.array(x))
            print len(x)
            #print np.array(x)
        X = np.nan_to_num(new_X)
        y = np.array(y)

        model = LogisticRegression()
        model.fit(X, y)

        print('Do the cross validation:')
        print(cross_val_score(model, X, y, cv = 5).mean())

        with open('logistic', 'wb') as h:
            pickle.dump(model, h)

hello()
