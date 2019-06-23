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
    celtics = './feature_vec/c2'
    rockets = './feature_vec/r2'

    fea_celtics = []
    fea_rockets = []

    # collect features
    with open(celtics) as f1:
        fea_celtics = f1.read().split()
        fea_celtics = [float(item) for item in fea_celtics]
        f1.close()

    with open(rockets) as f4:
        fea_rockets = f4.read().split()
        fea_rockets = [float(item) for item in fea_rockets]
        f4.close()

    rock_h_vs_celt_v = fea_rockets[:]
    celt_h_vs_rock_v = fea_celtics[:]

    rock_h_vs_celt_v.append(1)
    celt_h_vs_rock_v.append(1)

    rock_h_vs_celt_v = rock_h_vs_celt_v + fea_celtics
    celt_h_vs_rock_v = celt_h_vs_rock_v + fea_rockets

    rock_h_vs_celt_v.append(0)
    celt_h_vs_rock_v.append(0)

    #with open('./svm') as f:
    with open('./logistic') as f:
        model = pickle.load(f)

        p1 = model.predict_proba([np.nan_to_num(rock_h_vs_celt_v)])
        p2 = model.predict_proba([np.nan_to_num(celt_h_vs_rock_v)])
        print 'rockets_h vs celtics_v: ' + str(p1[0][0]) + ' ' + str(p1[0][1])
        print 'celtics_v_h vs rockets_v: ' + str(p2[0][0]) + ' ' + str(p2[0][1])
hello()
