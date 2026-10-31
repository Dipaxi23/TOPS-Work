import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
df=pd.read_csv('orders.csv')
sns.pairplot(df,vars=['order_value','distance_km','delivery_time_mins','rating'],hue='speed_band')
plt.savefig('pairplot.png',dpi=150)
plt.show()
print(df['speed_band'].value_counts())