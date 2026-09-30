# Task 1
## Create a NumPy array called my_scores using np.array() with your last 5 Zomato order ratings (pick any integers between 1 and 5), and print the array.
### Code
```python
import numpy as np
scores=np.array([5, 4, 3, 5, 4])
print(scores)
```
### Output
```
[5 4 3 5 4]
```
<br>
<br>

# Task 2
## Use np.arange() to generate an array of all even numbers between 10 and 30 (inclusive), then print the result.
### Code
```python
import numpy as np
array=np.arange(10,31,2)
print(array)
```
### Output
```
[10 12 14 16 18 20 22 24 26 28 30]
```
<br>
<br>

# Task 3
## Generate an array of 8 equally spaced values between 0 and 1 using np.linspace(), and print the array.<br><br><em><strong>Hint:</strong> This is similar to how Spotify creates smooth volume sliders.</em>
### Code
```python
import numpy as np
array= np.linspace(0,1,8)
print(array)
```
### Output
```
[0.         0.14285714 0.28571429 0.42857143 0.57142857 0.71428571
 0.85714286 1.        ]
```
<br>
<br>

# Task 4
## Simulate a Flipkart-style 'Add to Cart' button counter by creating a NumPy array of 10 zeros using np.zeros(), then update the 3rd and 7th items to 1 (representing items added to cart), and print the updated array.
### Code
```python
import numpy as np
flipkart_cart=np.zeros(10, dtype=int)
flipkart_cart[2]=1
flipkart_cart[6]=1

print(flipkart_cart)
```
### Output
```
[0 0 1 0 0 0 1 0 0 0]
```
<br>
<br>

# Task 5
## Use np.random.randint() to create an array of 6 random integers between 1000 and 9999 (representing random OTP codes like Paytm), and print the array.<br><br><em><strong>Constraint:</strong> Set the random seed to 42 using np.random.seed(42) before generating the array so your results are reproducible.</em>
### Code
```python
import numpy as np
np.random.seed(42)
otp_arr=np.random.randint(1000,10000,size=6)

print(otp_arr)
```
### Output
```
[8270 1860 6390 6191 6734 7265]
```
