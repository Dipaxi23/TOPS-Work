# Task 1
## Create a NumPy array called prices with the following values: [199, 299, 399, 499, 599]. Use basic indexing to print the first and last price.
### Code
```python
import numpy as np
prices=np.array([199, 299, 399, 499, 599])
print("First price:", prices[0])
print("Last price:", prices[-1])
```
### Output
```
First price: 199
Last price: 599
```
<br>
<br>

# Task 2
## Given a 2D NumPy array representing cricket scores for 3 players across 5 matches, use slicing to extract the scores of all players for matches 2 to 4 (index 1 to 3).
### Code
```python
import numpy as np
scores=np.array([[45,80,12,104,30],
                 [10,55,67,88,92],
                 [5,12,45,33,70]])
extracted_scores=scores[:,1:4]

print(extracted_scores)
```
### Output
```
[[ 80  12 104]
 [ 55  67  88]
 [ 12  45  33]]
```
<br>
<br>

# Task 3
## You have a NumPy array called ratings = np.array([4.5, 3.8, 4.2, 2.9, 5.0, 3.5]). Use negative indexing to print the last three ratings.
### Code
```python
import numpy as np
ratings=np.array([4.5,3.8,4.2,2.9,5.0,3.5])
print(ratings[-3:])
```
### Output
```
[2.9 5.  3.5]
```
<br>
<br>

# Task 4
## Create a NumPy array of the first 20 natural numbers. Use step slicing to print every 3rd number starting from the second element.<br><br><em><strong>Hint:</strong> Use the slice notation with a step value.</em>
### Code
```python
import numpy as np
arr=np.arange(1,21)
result=arr[1::3]

print(result)
```
### Output
```
[ 2  5  8 11 14 17 20]
```
<br>
<br>

# Task 5
## Given a NumPy array of Flipkart product prices, use boolean indexing to extract all prices greater than 500. Print the resulting array.
### Code
```python
import numpy as np
prices=np.array([250,499,550,1200,300,750])
filtered=prices[prices>500]

print(filtered)
```
### Output
```
[ 550 1200  750]
```
<br>
<br>

# Task 6
## You have an array of IPL team scores: np.array([210, 180, 195, 220, 205, 175]). Use np.where() to find the indices of all scores above 200 and print these indices.
### Code
```python
import numpy as np
scores=np.array([210,180,195,220,205,175])
indices=np.where(scores>200)

print(indices[0])
```
### Output
```
[0 3 4]
```