# Task 1
## Create a NumPy array representing the number of likes on 7 Instagram posts and print its ndim, shape, size, dtype, itemsize, and nbytes properties.
### Code
```python
import numpy as np
likes=np.array([122, 550, 88, 3403, 1300, 71, 2400])

print("Array:", likes)
print("ndim (Dimensions):", likes.ndim)
print("shape (Dimensions size):", likes.shape)
print("size (Total elements):", likes.size)
print("dtype (Data type):", likes.dtype)
print("itemsize (Bytes per element):", likes.itemsize)
print("nbytes (Total bytes):", likes.nbytes)
```
### Output
```
Array: [ 122  550   88 3403 1300   71 2400]
ndim (Dimensions): 1
shape (Dimensions size): (7,)
size (Total elements): 7
dtype (Data type): int64
itemsize (Bytes per element): 8
nbytes (Total bytes): 56
```
<br>
<br>

# Task 2
## Given a 2D NumPy array of daily step counts for 5 days (each row is a day, columns are morning and evening), use reshape() to convert it into a 1D array, then back to a 2D array with 5 rows and 2 columns.<br><br><em><strong>Hint:</strong> Use the shape attribute to check your array after each reshape.</em>
### Code
```python
import numpy as np
steps = np.array([
    [3000,4000],
    [2500,5000],
    [4000,6000],
    [3500,4500],
    [5000,7000]
])
print("Original:",steps.shape)

steps_1d=steps.reshape(-1)
print("1D Array:", steps_1d.shape)

steps_back=steps_1d.reshape(5,2)
print("Back to 2D:", steps_back.shape)
```
### Output
```
Original: (5, 2)
1D Array: (10,)
Back to 2D: (5, 2)
```
<br>
<br>

# Task 3
## Build a NumPy array representing the prices of 12 food items from a Zomato order, then use ravel(), flatten(), and resize() to create different shaped versions of the data and print each result.<br><br><em><strong>Constraint:</strong> Show the difference between ravel() and flatten() in your code comments.</em>
### Code
```python
import numpy as np
prices=np.array([
    [150, 200, 250, 100],
    [300, 120, 180, 220],
    [90,  350, 400, 270]
])
print("Original 2D Array:\n", prices)

ravled_prices=prices.ravel()
print("\n1. Ravelled array:", ravled_prices)

flattened_prices=prices.flatten()
print("2. Flattened array:", flattened_prices)

resized_prices=np.resize(prices, (2,6))
print("\n3. Resized array (2x6):\n", resized_prices)
```
### Output
```Original 2D Array:
 [[150 200 250 100]
 [300 120 180 220]
 [ 90 350 400 270]]

1. Ravelled array: [150 200 250 100 300 120 180 220  90 350 400 270]
2. Flattened array: [150 200 250 100 300 120 180 220  90 350 400 270]

3. Resized array (2x6):
 [[150 200 250 100 300 120]
 [180 220  90 350 400 270]]
```
<br>
<br>


# Task 4
## Take a 3x3 NumPy array representing a mini Spotify playlist grid (rows: playlists, columns: song counts in categories like Pop, Rock, Indie). Use both T and np.transpose() to swap rows and columns, then print the transposed array.
### Code
```python
import numpy as np
playlist_grid= np.array([
    [15, 8, 12], 
    [10, 20, 5],
    [25, 14, 7] 
])

transposed_t=playlist_grid.T

transposed_np=np.transpose(playlist_grid)

print("Transposed using .T:\n", transposed_t)
print("\nTransposed using np.transpose():\n", transposed_np)
```
### Output
```
Transposed using .T:
 [[15 10 25]
 [ 8 20 14]
 [12  5  7]]

Transposed using np.transpose():
 [[15 10 25]
 [ 8 20 14]
 [12  5  7]]
```
<br>
<br>


# Task 5
## Given a 1D NumPy array of 15 Flipkart product ratings, use reshape() to convert it into a 3x5 array, then use flatten() to return it to a 1D array. Explain in a comment when you would use flatten() versus ravel() in real projects.
### Code
```python
import numpy as np
ratings=np.array([4.5, 3.0, 5.0, 2.0, 4.0, 
                3.5, 4.8, 1.5, 5.0, 4.2, 
                3.8, 4.1, 4.9, 2.5, 3.2])

ratings_3x5=ratings.reshape(3, 5)
print("3x5 Array:\n", ratings_3x5)

ratings_1d=ratings_3x5.flatten()
```
### Output
```
3x5 Array:
 [[4.5 3.  5.  2.  4. ]
 [3.5 4.8 1.5 5.  4.2]
 [3.8 4.1 4.9 2.5 3.2]]
```
flatten() always returns a deep copy of the data. This is used hi when we want to modify the 1D output safely without accidentally altering the original array.
ravel() returns a view of the original data whenever possible where there is no copying to be made. This uses better performance and lower memory consumption.