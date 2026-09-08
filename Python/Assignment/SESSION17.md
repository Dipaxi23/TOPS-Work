# Task 1
## Use the math module to calculate the square root, factorial, and value of pi for given numbers, and print each result.
### Code
```python
import math
number_for_sqrt=16
number_for_factorial=5

sqrt_result=math.sqrt(number_for_sqrt)
print(f"The square root of {number_for_sqrt} is {sqrt_result}")

factorial_result=math.factorial(number_for_factorial)
print(f"The factorial of {number_for_factorial} is {factorial_result}")

print(f"The value of pi is {math.pi}")
```
### Output
```
The square root of 16 is 4.0
The factorial of 5 is 120
The value of pi is 3.141592653589793
```
<br>
<br>

# Task 2
## Write a script that lists all files in your current directory using the os module, and prints only those files with a .jpg or .png extension.<br><br><em><strong>Hint:</strong> Use os.listdir() and string methods to filter file names.</em>
### Code
```python
import os
current_directory_items=os.listdir()

print("Filtered Image Files (.jpg / .png):")
print("-"*35)

for item in current_directory_items:
    if os.path.isfile(item) and item.lower().endswith(('.jpg','.png')):
        print(item)
```
### Output
```
Filtered Image Files (.jpg / .png):
-----------------------------------
```
<br>
<br>

# Task 3
## Create a Python program that accepts a date in 'YYYY-MM-DD' format from the user and displays the day of the week using the datetime module.
### Code
```python
from datetime import datetime
date_str=input("Enter a date in YYYY-MM-DD format: ")

try:
  date_obj=datetime.strptime(date_str,"%Y-%m-%d")
  day_of_week=date_obj.strftime("%A")
  print(f"The day of the week is: {day_of_week}")
except ValueError:
  print("Invalid format! Please enter the date strictly in YYYY-MM-DD format.")
```
### Output
```
Enter a date in YYYY-MM-DD format: 2026-09-10
The day of the week is: Thursday
```
<br>
<br>

# Task 4
## Build a simple custom module named insta_utils.py with a function format_follower_count(n) that returns '1.5K' for 1500 and '2.3M' for 2300000. Import and use this function in another script to display formatted counts for 3 sample numbers.
### Code (insta_utils.py):
```python
def format_follower_count(n):
    """Formats raw follower counts into Instagram-style strings (e.g., 1.5K, 2.3M)."""
    if n >= 1_000_000_000:
        return f"{n / 1_000_000_000:.1f}B".replace('.0', '')
    elif n >= 1_000_000:
        return f"{n / 1_000_000:.1f}M".replace('.0', '')
    elif n >= 1_000:
        return f"{n / 1_000:.1f}K".replace('.0', '')
    return str(n)
```
### Code (main.py):
```python
def format_follower_count(n):
    """Formats raw follower counts into Instagram-style strings (e.g., 1.5K, 2.3M)."""
    if n >= 1_000_000_000:
        return f"{n / 1_000_000_000:.1f}B".replace('.0', '')
    elif n >= 1_000_000:
        return f"{n / 1_000_000:.1f}M".replace('.0', '')
    elif n >= 1_000:
        return f"{n / 1_000:.1f}K".replace('.0', '')
    return str(n)
```
### Output
```
--- Instagram Follower Count Formatter ---
Original: 850        ➔ Formatted: 850
Original: 1500       ➔ Formatted: 1.5K
Original: 2300000    ➔ Formatted: 2.3M
```
<br>
<br>

# Task 5
## Create a new virtual environment using venv, activate it, and install the statistics and requests packages via pip. Then, write a script that uses statistics.mean() to calculate the average of a list of numbers.
### Code
```python
import statistics

numbers=[12,45,78,23,56,89,34]
average_value = statistics.mean(numbers)

print(f"The list of numbers is: {numbers}")
print(f"The average is: {average_value}")
```
### Output
```
The list of numbers is: [12, 45, 78, 23, 56, 89, 34]
The average is: 48.142857142857146
```
