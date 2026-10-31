import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
np.random.seed(42)
num_orders=100
delivery_data={'delivery_time':np.random.randint(10,60,num_orders),'distance_km':np.random.uniform(1,15,num_orders),'order_value':np.random.uniform(100,1000,num_orders),'rating':np.random.uniform(3.0,5.0,num_orders),'prep_time':np.random.randint(5,30,num_orders),'cuisine_type':np.random.choice(['Italian','Chinese','Indian','Mexican'],num_orders)}
delivery_df=pd.DataFrame(delivery_data)
pairplot_grid=sns.pairplot(delivery_df,hue='cuisine_type')
pairplot_grid.savefig('food_orders.png',dpi=200)
plt.show()
plt.figure(figsize=(8,6))
correlation_matrix=delivery_df.select_dtypes(include=[np.number]).corr()
sns.heatmap(correlation_matrix,annot=True,cmap='coolwarm')
plt.tight_layout()
plt.savefig('food_correlation_heatmap.png',dpi=200)
plt.show()