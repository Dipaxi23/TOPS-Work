import pandas as pd
df=pd.read_csv('orders.csv')
df['delivery_speed_kmph']=df['distance_km']/(df['delivery_time_mins']/60)
df['speed_band']=pd.qcut(df['delivery_speed_kmph'],3,labels=['Slow','Normal','Fast'])
df.to_csv('orders.csv',index=False)
print(df[['delivery_speed_kmph','speed_band']].head())