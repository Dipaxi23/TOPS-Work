import numpy as np
import pandas as pd
np.random.seed(42)
df=pd.DataFrame({'restaurant_name':np.random.choice(['Das_Khaman',
                                                     'Agra_Sweet_Home',
                                                     'Honest','Toran_Dining',
                                                     'Mirch_Masala'],40),
                'city':np.random.choice(['Ahmedabad','Surat','Vadodara'],40),
                'order_value':np.random.uniform(100,500,40),
                'delivery_time_mins':np.random.uniform(15,38,40),
                'rating':np.random.uniform(3.5,5.0,40),
                'cuisine_type':np.random.choice(['Gujarati','Fast_Food','Punjabi'],40)})
result=df.groupby('restaurant_name').agg({'order_value':'mean','delivery_time_mins':'mean','rating':'mean'}).loc[lambda x:(x['rating']>4.0)&(x['delivery_time_mins']<35)].sort_values(by='order_value',ascending=False).reset_index()
print(result)