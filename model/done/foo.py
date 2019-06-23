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
from sklearn.decomposition import PCA

def hello():
    with open('./X') as f:
        X = pickle.load(f)
        with open('./y') as g:
            y = pickle.load(g)

        new_X = []
        for x in X:
            new_X.append(np.array(x))

        X = np.nan_to_num(new_X)
        y = np.array(y)

        #print('Do the PCA')
        #pca = PCA(n_components=10, whiten=True)
        #pca.fit(X)

        #print len(X[0])

        print('Train the Model')
        #model = LogisticRegression()
        model = svm.SVC(kernel='linear', probability=True)
        #model = svm.SVC(probability=True)
        model.fit(X, y)
        print('Finish trainning')

        print('Do the cross validation:')
        print(cross_val_score(model, X, y, cv = 10).mean())

        #with open('logistic', 'wb') as h:
            #pickle.dump(model, h)

        with open('logistic', 'wb') as h:
            pickle.dump(model, h)
hello()
