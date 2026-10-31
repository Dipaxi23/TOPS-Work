import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
np.random.seed(42)
num_rows=250
restaurants=[f"Restaurant_{i}" for i in np.random.randint(1,20,num_rows)]
delivery_time=np.random.normal(30,5,num_rows)
rating=np.random.uniform(3.0,5.0,num_rows)
order_value=np.random.exponential(20,num_rows)+10
distance=np.random.uniform(1,15,num_rows)
df=pd.DataFrame({'restaurant':restaurants,'delivery_time':delivery_time,'rating':rating,'order_value':order_value,'distance':distance})
df.loc[10:15,'delivery_time']=np.nan
df.fillna(df.mean(numeric_only=True),inplace=True)
def summary_statistics(data):
 delivery_values=data['delivery_time'].values
 print("Mean:",np.mean(delivery_values))
 print("Std:",np.std(delivery_values))
 print("Median:",np.median(delivery_values))
 fig,axis=plt.subplots()
 axis.plot(delivery_values)
 plt.savefig("summary.png",dpi=150)
 plt.show()
def distribution_analysis(data):
 sns.histplot(data['delivery_time'],kde=True)
 plt.savefig("distribution.png",dpi=150)
 plt.show()
def correlation_heatmap(data):
 fig,axes=plt.subplots(2,2)
 numeric_data=data.select_dtypes(include=[np.number])
 axes[0,0].scatter(numeric_data.iloc[:,0],numeric_data.iloc[:,1])
 axes[0,1].scatter(numeric_data.iloc[:,0],numeric_data.iloc[:,2])
 axes[1,0].scatter(numeric_data.iloc[:,1],numeric_data.iloc[:,2])
 axes[1,1].scatter(numeric_data.iloc[:,2],numeric_data.iloc[:,3])
 plt.savefig("correlation.png",dpi=150)
 plt.show()
def restaurant_performance(data):
 grouped_performance=data.groupby('restaurant')['order_value'].mean()
 grouped_performance.plot(kind='bar')
 plt.savefig("restaurant_performance.png",dpi=150)
 plt.show()
while True:
 choice=input("1: Summary Statistics\n2: Distribution Analysis\n3: Correlation Heatmap\n4: Restaurant Performance Report\n5: Exit\nSelect option: ")
 if choice=='1':summary_statistics(df)
 elif choice=='2':distribution_analysis(df)
 elif choice=='3':correlation_heatmap(df)
 elif choice=='4':restaurant_performance(df)
 elif choice=='5':break
top_restaurants=df.groupby('restaurant')['rating'].mean().nlargest(3)
print("Top 3 Restaurants by Mean Rating:")
print(top_restaurants)
numeric_dataframe=df.select_dtypes(include=[np.number])
correlation_matrix=numeric_dataframe.corr().abs()
unstacked_corr=correlation_matrix.unstack()
unstacked_corr=unstacked_corr[unstacked_corr<1.0]
highest_pair=unstacked_corr.idxmax()
print("Highest Absolute Pearson Correlation Pair:",highest_pair)
print("Overall Mean Delivery Time:",np.mean(df['delivery_time']))
print("Overall Std Delivery Time:",np.std(df['delivery_time']))