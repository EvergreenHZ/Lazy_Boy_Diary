import pandas as pd
import numpy as np

df1 = pd.DataFrame({'key':['b','b','a','c','a','a','b'],'data1': range(7)})

print(df1)

df2 = pd.DataFrame({'key':['a','b','d'],'data2':range(3)})

print(df2)

print(df1.merge(df2, on = 'key', how = 'inner'))
