# Task 1
## Create two NumPy arrays: one representing the number of likes on your last 7 Instagram posts, and another for the number of comments. Use arithmetic operators to calculate the average engagement (likes + comments) per post and print the result.
### Code
```python
import numpy as np
likes=np.array([120, 150, 95, 200, 180, 130, 210])
comments=np.array([12, 15, 8, 22, 19, 14, 25])
engagement=likes+comments
avg_engagement=np.mean(engagement)

print(f"Average engagement per post: {avg_engagement:.1f}")
```
### Output
```
Average engagement per post: 171.4
```
<br>
<br>

# Task 2
## Given two NumPy arrays: one with the prices of 5 food items on Zomato and another with the corresponding discounts in rupees, use element-wise subtraction to get the final price for each item and display the array.
### Code
```python
import numpy as np
prices=np.array([250, 400, 180, 350, 500])
discounts=np.array([50, 80, 20, 70, 100])
final_prices=prices-discounts

print("Final Prices:", final_prices)
```
### Output
```
Final Prices: [200 320 160 280 400]
```
<br>
<br>

# Task 3
## Suppose you have a NumPy array of IPL team scores for 5 matches. Use comparison operators to create a boolean array indicating which matches had scores greater than 180, then print the boolean array.<br><br><em><strong>Hint:</strong> Use the '>' operator directly on the array.</em>
### Code
```python
import numpy as np
scores=np.array([165, 192, 178, 205, 180])
high_scores=scores>180

print(high_scores)
```
### Output
```
[False  True False  True False]
```
<br>
<br>

# Task 4
## Create two NumPy arrays: one showing whether a user paid via Paytm (1 for paid, 0 for not) and another for PhonePe for 6 transactions. Use np.logical_or() to find out which transactions were paid by either app and print the result.
### Code
```python
import numpy as np
paytm=np.array([1, 0, 1, 0, 0, 1])
phonepe=np.array([0, 1, 1, 0, 1, 0])
either_app=np.logical_or(paytm, phonepe).astype(int)

print("Paytm:  ", paytm)
print("PhonePe:", phonepe)
print("Either: ", either_app)
```
### Output
```
Paytm:   [1 0 1 0 0 1]
PhonePe: [0 1 1 0 1 0]
Either:  [1 1 1 0 1 1]
```
<br>
<br>

# Task 5
## Given a NumPy array of the number of steps you walked each day for a week, use broadcasting to add a bonus of 500 steps to each day's count, then calculate and print the total steps for the week using an aggregate operation.
### Code
```python
import numpy as np
steps=np.array([8000, 9500, 7200, 10400, 6100, 11200, 8900])
total_steps=(steps+500).sum()

print("Total steps for the week:", total_steps)
```
### Output
```
Total steps for the week: 64800
```