import numpy as np
import matplotlib.pyplot as plt
np.random.seed(42)
month=np.arange(1,13)
orders=np.random.randint(1000,5001,size=12)
plt.figure(figsize=(8,5))
plt.plot(month,orders,marker='o')
for i,t in enumerate(orders):plt.annotate(str(t),(month[i],orders[i]),textcoords="offset points",xytext=(0,10),ha='center')
plt.title('Total Orders Per Month')
plt.xlabel('Month')
plt.ylabel('Total Orders')
plt.tight_layout()
plt.savefig('orders.png',dpi=150)
plt.show()