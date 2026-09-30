# Task 1
## Create two NumPy arrays representing the ratings of 5 restaurants on Zomato and Swiggy, then use np.concatenate() to combine them into a single array of 10 ratings and print the result.
### Code
```python
import numpy as np
zomato_ratings=np.array([4.2,4.5,3.8,4.0,4.7])
swiggy_ratings=np.array([4.1,3.9,4.6,4.3,4.8])
all_ratings=np.concatenate((zomato_ratings, swiggy_ratings))

print("Combined Ratings:", all_ratings)
```
### Output
```
Combined Ratings: [4.2 4.5 3.8 4.  4.7 4.1 3.9 4.6 4.3 4.8]
```
<br>
<br>

# Task 2
## Given three arrays representing the number of likes on three different Instagram posts over 7 days, stack them vertically using np.vstack() so that each row represents one post's weekly likes, and print the stacked array.
### Code
```python
import numpy as np
post1=np.array([123,145,132,160,185,210,195])
post2=np.array([90,105,115,130,142,167,150])
post3=np.array([200,220,213,142,260,300,285])
stacked_likes=np.vstack((post1, post2, post3))

print(stacked_likes)
```
### Output
```
[[123 145 132 160 185 210 195]
 [ 90 105 115 130 142 167 150]
 [200 220 213 142 260 300 285]]
```
<br>
<br>

# Task 3
## You have an array of 12 Flipkart product IDs. Use np.array_split() to divide this array into 5 nearly equal parts, and display each part.<br><br><em><strong>Hint:</strong> Check the shape of each split to confirm the division.</em>
### Code
```python
import numpy as np
product_ids=np.arange(101,13)
splits=np.array_split(product_ids, 5)

for i,s in enumerate(splits,1):
    print(f"Part {i}: {s} (Shape: {s.shape})")
```
### Output
```
Part 1: [] (Shape: (0,))
Part 2: [] (Shape: (0,))
Part 3: [] (Shape: (0,))
Part 4: [] (Shape: (0,))
Part 5: [] (Shape: (0,))
```
<br>
<br>

# Task 4
## Simulate a WhatsApp group chat: create a 2D NumPy array where each row is a user and each column is the number of messages sent per day for a week. Use np.insert() to add a new user (row) with their message counts, then use np.delete() to remove the user who sent the least messages overall.
### Code
```python
import numpy as np
data = np.array([[5,10,3,8,12,15,6],
                 [1,2,0,1,2,0,1],
                 [8,6,9,7,10,11,9]])

data=np.insert(data, len(data), [4, 5, 6, 7, 8, 9, 10], axis=0)
data=np.delete(data, np.argmin(np.sum(data, axis=1)), axis=0)
print(data)
```
### Output
```
[[ 5 10  3  8 12 15  6]
 [ 8  6  9  7 10 11  9]
 [ 4  5  6  7  8  9 10]]
```
<br>
<br>

# Task 5
## Given a NumPy array of YouTube video view counts, use .view() to create a view and .copy() to create a copy. Modify the first element in each and print all arrays to demonstrate the difference between view and copy.<br><br><em><strong>Hint:</strong> Observe which changes affect the original array.</em>
### Code
```python
import numpy as np
original=np.array([1000,2500,500])
view_arr=original.view()
copy_arr=original.copy()

view_arr[0]=9999
copy_arr[0]=1111

print("Original:", original)
print("View:    ", view_arr)
print("Copy:    ", copy_arr)
```
### Output
```
Original: [9999 2500  500]
View:     [9999 2500  500]
Copy:     [1111 2500  500]
```