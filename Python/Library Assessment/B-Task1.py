import numpy as np
np.random.seed(42)
distances=np.random.uniform(1.0,15.0,25)
fees=20+5*distances
delivery_fee=fees>60
print(np.column_stack((distances[delivery_fee],fees[delivery_fee])))
print(f"Minimum Fee: {fees.min():.2f}") 
print(f"Maximum Fee: {fees.max():.2f}")
print(f"Mean Fee: {fees.mean():.2f}")
print(f"Standard Deviation: {fees.std():.2f}")