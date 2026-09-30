# Task 1
## Given a NumPy array of IPL team names with some duplicates, use np.unique() to print a sorted list of all unique team names.
### Code
```python
import numpy as np
teams=np.array(["MI","CSK","RCB","MI","CSK","KKR","DC"])
unique_teams=np.unique(teams)

print(unique_teams)
```
### Output
```
['CSK' 'DC' 'KKR' 'MI' 'RCB']
```
<br>
<br>

# Task 2
## Create a NumPy array of Zomato order ratings (with some NaN values), then use np.isnan() to count how many ratings are missing.
### Code
```python
import numpy as np
ratings=np.array([4.5,3.8,np.nan,4.2,5.0,np.nan,3.0])
missing_count=np.isnan(ratings).sum()

print("Ratings:", ratings)
print("Number of missing ratings:", missing_count)
```
### Output
```
Ratings: [4.5 3.8 nan 4.2 5.  nan 3. ]
Number of missing ratings: 2
```
<br>
<br>

# Task 3
## Given an array of Flipkart product prices, use np.clip() to limit all prices between 100 and 1000, and print the resulting array.<br><br><em><strong>Hint:</strong> Use np.clip(array, 100, 1000).</em>
### Code
```python
import numpy as np
prices=np.array([50,150,800,1200,95])
clipped_prices=np.clip(prices,100,1000)

print(clipped_prices)
```
### Output
```
[ 100  150  800 1000  100]
```
<br>
<br>

# Task 4
## You have a NumPy array of YouTube video view counts, some of which are NaN or inf. Replace all NaN values with 0, and all inf values with the maximum finite value in the array.
### Code
```python
import numpy as np
views=np.array([1500,np.nan,3200,np.inf,450,-np.inf])
views[np.isnan(views)]=0
views[np.isinf(views)]=np.max(views[np.isfinite(views)])

print(views)
```
### Output
```
[1500.    0. 3200. 3200.  450. 3200.]
```
<br>
<br>

# Task 5
## Use ChatGPT to generate a Python code snippet that finds the indices of all even numbers in a NumPy array using np.where(), then test the code with your own example array.
### Code
```python
import numpy as np
numbers=np.array([11, 27, 14, 33, 40, 56, 64])
even_indices = np.where(numbers%2==0)

print("Indices of even numbers:", even_indices[0])
```
### Output
```
Indices of even numbers: [2 4 5 6]
```