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
    #celtics = './feature_vec/celtics'
    #worriors = './feature_vec/worriors'
    #cavaliers = './feature_vec/cavaliers'
    #rockets = './feature_vec/rockets'
    celtics = './feature_vec/c2'
    worriors = './feature_vec/w2'
    cavaliers = './feature_vec/j2'
    rockets = './feature_vec/r2'

    fea_celtics = []
    fea_worriors = []
    fea_cavaliers = []
    fea_rockets = []

    # collect features
    with open(celtics) as f1:
        fea_celtics = f1.read().split()
        fea_celtics = [float(item) for item in fea_celtics]
        f1.close()

    with open(worriors) as f2:
        fea_worriors = f2.read().split()
        fea_worriors = [float(item) for item in fea_worriors]
        f2.close()

    with open(cavaliers) as f3:
        fea_cavaliers = f3.read().split()
        fea_cavaliers = [float(item) for item in fea_cavaliers]
        f3.close()

    with open(rockets) as f4:
        fea_rockets = f4.read().split()
        fea_rockets = [float(item) for item in fea_rockets]
        f4.close()

    celt_h_vs_cava_v = fea_celtics[:]
    cava_h_vs_celt_v = fea_cavaliers[:]
    rock_h_vs_worr_v = fea_rockets[:]
    worr_h_vs_rock_v = fea_worriors[:]

    celt_h_vs_cava_v.append(1)
    cava_h_vs_celt_v.append(1)
    rock_h_vs_worr_v.append(1)
    worr_h_vs_rock_v.append(1)

    celt_h_vs_cava_v = celt_h_vs_cava_v + fea_cavaliers
    cava_h_vs_celt_v = cava_h_vs_celt_v + fea_celtics
    rock_h_vs_worr_v = rock_h_vs_worr_v + fea_worriors
    worr_h_vs_rock_v = worr_h_vs_rock_v + fea_rockets

    celt_h_vs_cava_v.append(0)
    cava_h_vs_celt_v.append(0)
    rock_h_vs_worr_v.append(0)
    worr_h_vs_rock_v.append(0)

    #with open('./svm') as f:
    with open('./logistic') as f:
        model = pickle.load(f)

        p1 = model.predict_proba([np.nan_to_num(celt_h_vs_cava_v)])
        p2 = model.predict_proba([np.nan_to_num(cava_h_vs_celt_v)])
        p3 = model.predict_proba([np.nan_to_num(rock_h_vs_worr_v)])
        p4 = model.predict_proba([np.nan_to_num(worr_h_vs_rock_v)])
        print 'celtics_h vs cavaliers_v: ' + str(p1[0][0]) + ' ' + str(p1[0][1])
        print 'cavaliers_h vs celtics_v: ' + str(p2[0][0]) + ' ' + str(p2[0][1])
        print 'rockets_h vs worriors_v: ' + str(p3[0][0]) + ' ' + str(p3[0][1])
        print 'worriors_h vs rockets_v: ' + str(p4[0][0]) + ' ' + str(p4[0][1])
hello()
