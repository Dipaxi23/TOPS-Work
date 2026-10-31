import numpy as np
import matplotlib.pyplot as plt
np.random.seed(42)
month=np.arange(1,13)
orders=np.random.randint(1000,5001,size=12)
revenue=orders*np.random.uniform(200,400,size=12)
color=['green'if x>800000 else'red'for x in revenue]
plt.figure(figsize=(8,5))
plt.bar(month,revenue,color=color)
plt.axhline(800000,color='black',linestyle='--')
plt.title('Monthly Revenue')
plt.xlabel('Month')
plt.ylabel('Revenue (Rs)')
plt.tight_layout()
plt.savefig('revenue.png',dpi=150)
plt.show()