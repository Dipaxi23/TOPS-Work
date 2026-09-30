# Task 1
## Create two NumPy arrays representing the number of likes on your last 7 Instagram posts and your friend's last 7 posts, then use np.add() and np.subtract() to calculate both the combined and difference arrays.
### Code
```python
import numpy as np
my_likes=np.array([120, 145, 98, 210, 175, 130, 190])
friend_likes=np.array([110, 160, 85, 195, 180, 140, 170])
combined_likes=np.add(my_likes, friend_likes)
diff_likes=np.subtract(my_likes, friend_likes)

print("Combined Likes:", combined_likes)
print("Difference (My-Friend):", diff_likes)
```
### Output
```
Combined Likes: [230 305 183 405 355 270 360]
Difference (My-Friend): [ 10 -15  13  15  -5 -10  20]
```
<br>
<br>

# Task 2
## Given a NumPy array of item prices from your last Zomato order, use np.multiply() to apply a 10% discount on each item, then use np.sum() to calculate the final bill amount after discount.<br><br><em><strong>Hint:</strong> To apply a 10% discount, multiply each price by 0.9.</em>
### Code
```python
import numpy as np
prices=np.array([253.0, 450.07, 125.24, 300.0])
final_bill=np.sum(np.multiply(prices, 0.9))

print("Final Bill Amount:", final_bill)
```
### Output
```
Final Bill Amount: 1015.479
```
<br>
<br>

# Task 3
## Take a NumPy array of daily step counts for the last 30 days (you can make up the numbers), and use np.mean(), np.median(), np.std(), and np.max() to analyze your fitness stats like a health app would.
### Code
```python
import numpy as np
np.random.seed(2)
steps=np.random.randint(4000,15000,30)
mean_val=np.mean(steps)
median_val=np.median(steps)
std_val=np.std(steps)
max_val=np.max(steps)
min_val=np.min(steps)

print(f"Mean: {mean_val:.1f}")
print(f"Median: {median_val:.1f}")
print(f"Std: {std_val:.1f}")
print(f"Max: {max_val}")
print(f"Min: {min_val}")
```
### Output
```
Mean: 9196.8
Median: 9100.5
Std: 2669.8
Max: 14827
Min: 4255
```
<br>
<br>

# Task 4
## Create a NumPy array of 10 random float ratings (between 1 and 5) for a new movie on BookMyShow, then use np.round(), np.floor(), and np.ceil() to show how the rating would appear if rounded to the nearest whole number, always rounded down, and always rounded up.
### Code
```python
import numpy as np
ratings=np.random.uniform(1.0, 5.0, 10)
rounded=np.round(ratings)  
floored=np.floor(ratings) 
ceiled=np.ceil(ratings)
print(f"Ratings: {ratings}")
print(f"Rounded: {rounded}")
print(f"Floored: {floored}")
print(f"Ceiled: {ceiled}")
```
### Output
```
Ratings: [1.93867977 3.21813707 2.41144252 2.73579354 4.99617885 3.65310391
 2.91672118 4.70137922 3.18499603 3.76686256]
Rounded: [2. 3. 2. 3. 5. 4. 3. 5. 3. 4.]
Floored: [1. 3. 2. 2. 4. 3. 2. 4. 3. 3.]
Ceiled: [2. 4. 3. 3. 5. 4. 3. 5. 4. 4.]
```
<br>
<br>


# Task 5
## Use ChatGPT to generate Python code that calculates the percentage of songs you skipped in your last 20 Spotify plays using NumPy arrays and np.percentile(), then run the code and paste your output.<br><br><em><strong>Hint:</strong> Ask ChatGPT for code that finds the 75th percentile of skips in a NumPy array.</em>
### Code
```python
import numpy as np

# 1 = skipped, 0 = not skipped
last_20_plays = np.array([
    1, 0, 1, 0, 0,
    1, 1, 0, 0, 1,
    0, 0, 1, 0, 1,
    0, 0, 0, 1, 0
])

# Percentage of songs skipped
skip_percentage = np.mean(last_20_plays) * 100

# 75th percentile
skip_75th_percentile = np.percentile(last_20_plays, 75)

print("Last 20 plays:", last_20_plays)
print("Number of songs skipped:", np.sum(last_20_plays))
print("Percentage of songs skipped:", skip_percentage, "%")
print("75th percentile of skips:", skip_75th_percentile)
```
### Output
```
Last 20 plays: [1 0 1 0 0 1 1 0 0 1 0 0 1 0 1 0 0 0 1 0]
Number of songs skipped: 8
Percentage of songs skipped: 40.0 %
75th percentile of skips: 1.0
```