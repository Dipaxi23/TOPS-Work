import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
import pandas as pd
df=pd.read_csv('orders.csv')
plt.figure(figsize=(8,6))
sns.heatmap(df.select_dtypes(include=[np.number]).corr(),annot=True,cmap='coolwarm')
plt.savefig('correlation_heatmap.png',dpi=150)
plt.show()
print(df.select_dtypes(include=[np.number]).corr())