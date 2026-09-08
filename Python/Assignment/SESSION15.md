# Task 1
## Write a Python function safe_divide(a, b) that returns the result of a divided by b, and handles ZeroDivisionError by returning the string 'Cannot divide by zero'.
### Code
```python
def safe_divide(a,b):
  try:
    return a/b
  except ZeroDivisionError:
    return 'Cannot divide by zero'
print(safe_divide(10,2)) 
print(safe_divide(5,0))
```
### Output
```
5.0
Cannot divide by zero
```
<br>
<br>

# Task 2
## Simulate a Zomato-style rating system: ask the user for number of reviews and total stars, then calculate average rating. Use try-except to handle invalid (non-numeric) input and print an error message if input is not a number.<br><br><em><strong>Hint:</strong> Use input() and int() conversion inside a try block.</em>
### Code
```python
try:
    num_reviews=int(input("Enter the total number of reviews: "))
    stars=float(input("Enter the sum of all star ratings: "))
    if num_reviews <= 0:
        print("Error: Number of reviews must be greater than zero.")
    else:
        average_rating=stars/num_reviews
        print(f"\nZomato Average Rating: {average_rating:.2f}")
except ValueError:
    print("Error: Invalid input! Please enter numbers only.")
```
### Output 1
```
Enter the total number of reviews: 0
Enter the sum of all star ratings: 0
Error: Number of reviews must be greater than zero.
```
### Output 2
```
Enter the total number of reviews: 1
Enter the sum of all star ratings: 3.0

Zomato Average Rating: 3.00
```
<br>
<br>

# Task 3
## Create a function get_playlist_duration(songs) that takes a list of song durations (in seconds) and returns the total duration in minutes. Raise a custom exception InvalidDurationError if any duration in the list is negative.<br><br><em><strong>Hint:</strong> Define your own exception class by subclassing Exception.</em>
### Code
```python
class InvalidDurationError(Exception):
    pass

def get_playlist_duration(songs):
    if any(duration<0 for duration in songs):
        raise InvalidDurationError("Song durations cannot be negative.")
    total_seconds=sum(songs)
    return total_seconds/60

try:
    playlist=[180,240,200]  
    total_minutes=get_playlist_duration(playlist)
    print(f"Total duration: {total_minutes:.2f} minutes")
    invalid_playlist=[180,-30,200]
    get_playlist_duration(invalid_playlist)
except InvalidDurationError as e:
    print(f"Error: {e}")
```
### Output
```
Total duration: 10.33 minutes
Error: Song durations cannot be negative.
```
<br>
<br>

# Task 4
## Build a Flipkart-style order summary: ask the user for item price and quantity, then calculate and print total price. Use try-except-else-finally blocks to handle ValueError for invalid input, print the total if successful, and always print 'Thank you for shopping!' in the finally block.
### Code
```python
print("Welcome to Flipkart - Order Summary")

try:
    price=float(input("Enter the item price: "))
    quantity=int(input("Enter the quantity: "))
    if price<0 or quantity<0:
        raise ValueError("Price and quantity must be positive numbers.")
except ValueError as err:
    print(f"\n Invalid Input: Please enter valid numeric values. ({err})")
    
else:
    total_price=price*quantity
    
    print("\n----------------------------------------")
    print("           ORDER SUMMARY                ")
    print("----------------------------------------")
    print(f"Price per item : ₹{price:.2f}")
    print(f"Quantity       : {quantity}")
    print(f"----------------------------------------")
    print(f"Total Price    : ₹{total_price:.2f}")
    print("----------------------------------------")
finally:
    print("\n Thank you for shopping with us!")
```
### Output 1
```
Welcome to Flipkart - Order Summary
Enter the item price: 1321 
Enter the quantity: 2

----------------------------------------
           ORDER SUMMARY                
----------------------------------------
Price per item : ₹1321.00
Quantity       : 2
----------------------------------------
Total Price    : ₹2642.00
----------------------------------------

 Thank you for shopping with us!
```
### Output 2
```
Welcome to Flipkart - Order Summary
Enter the item price: -139
Enter the quantity: 1

 Invalid Input: Please enter valid numeric values. (Price and quantity must be positive numbers.)

 Thank you for shopping with us!
```
<br>
<br>

# Task 5
## Use ChatGPT or Copilot to generate a Python code snippet that asks for two numbers and divides them, handling both ZeroDivisionError and ValueError. Paste the generated code, run it, and write one line about what you learned from the AI's approach.
### AI Code
```python
try:
    num1 = float(input("Enter the first number: "))
    num2 = float(input("Enter the second number: "))

    result = num1 / num2
    print("Result:", result)

except ZeroDivisionError:
    print("Error: Cannot divide by zero.")

except ValueError:
    print("Error: Please enter valid numbers.")
```
What I learned about from this code is python exception handling. try-except allows us to anticipate errors and handle them instead of letting the program crash. With try-catch we can control what happens with our code if it has erros.
