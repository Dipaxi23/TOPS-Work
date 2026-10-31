import numpy as np
import pandas as pd
np.random.seed(7)
df=pd.DataFrame({'order_value':np.random.uniform(100,800,200),
                 'distance_km':np.random.uniform(1,20,200),
                 'delivery_time_mins':np.random.normal(30,8,200),
                 'rating':np.random.uniform(1.0,5.0,200),
                 'discount_pct':np.random.uniform(0,30,200)})
df.to_csv('orders.csv',index=False)
print(df.head())