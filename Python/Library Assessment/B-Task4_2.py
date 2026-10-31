import numpy as np
import pandas as pd
df=pd.read_csv('orders.csv')
for col in['delivery_time_mins','rating']:
    idx=np.random.choice(df.index,size=int(0.05*len(df)),replace=False)
    df.loc[idx,col]=np.nan
    df[col]=df[col].fillna(df[col].median())
df.to_csv('orders.csv',index=False)
print(df.isnull().sum())
print(df.head())