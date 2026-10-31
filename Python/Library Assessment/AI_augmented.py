import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Set random seed for reproducibility
np.random.seed(42)
n = 100

# Generate synthetic food delivery dataset using NumPy
data = {
    'delivery_time': np.random.randint(10, 60, n),
    'distance_km': np.random.uniform(1, 15, n),
    'order_value': np.random.uniform(100, 1000, n),
    'rating': np.random.uniform(3.0, 5.0, n),
    'prep_time': np.random.randint(5, 30, n),
    'cuisine_type': np.random.choice(['Italian', 'Chinese', 'Indian', 'Mexican'], n)
}

# Load the generated data into a Pandas DataFrame
df = pd.DataFrame(data)

# Produce a Seaborn pairplot of all numeric columns, coloured by cuisine_type, and save as orders.png
sns.pairplot(df, hue='cuisine_type')
plt.savefig('AI_food_orders.png')
plt.close()

# Compute the Pearson correlation matrix for numeric columns
plt.figure(figsize=(8, 6))
corr = df.select_dtypes(include=[np.number]).corr()

# Display the correlation matrix as a Seaborn heatmap and save as correlation_heatmap.png
sns.heatmap(corr, annot=True, cmap='coolwarm')
plt.savefig('AI_food_correlation_heatmap.png')
plt.close()