# Task 1
## Declare four variables in Python: one integer (number of followers), one float (average rating), one string (your favorite app's name), and one boolean (is_premium_user). Print each variable and its type using the type() function.
### Code
```python
followers=3974
avg_rating=3.9
fav_app="Twitter"
is_premium_user=False
print("Favourite App:",fav_app,"\nType",type(fav_app))
print("Number of Followers:",followers,"\nType",type(followers))
print("Average Rating:",avg_rating,"\nType",type(avg_rating))
print("Premium User?:",is_premium_user,"\nType",type(is_premium_user))
```
### Output
```
Favourite App: Twitter 
Type <class 'str'>
Number of Followers: 3974 
Type <class 'int'>
Average Rating: 3.9 
Type <class 'float'>
Premium User?: False 
Type <class 'bool'>
```
<br>
<br>

# Task 2
## Write a Python program that takes a user's input for the price of a Zomato order as a string, converts it to a float using type casting, adds 18% GST, and prints the final bill amount.
### Code
```python
price=input("Enter Order Price:")
orderPrice=float(price)
gst=18
gst_amount=orderPrice*gst/100
final_amount=orderPrice+gst_amount
print("-"*40)
print("             ZOMATO BILL       ")
print("-"*40)
print("Order Price:",price)
print("GST (%):",gst)
print("GST Amount:",round(gst_amount,2))
print("Final Bill Amount:",round(final_amount,2))
```
### Output
```
Enter Order Price:1233 
----------------------------------------
             ZOMATO BILL       
----------------------------------------
Order Price: 1233
GST (%): 18
GST Amount: 221.94
Final Bill Amount: 1454.94
```
<br>
<br>

# Task 3
## Given a list of strings representing product prices from Flipkart, like ['199.99', '299.50', '150'], convert all to floats and calculate the total cart value.
### Code
```python
cart_values=['199.99', '299.50', '150']
cart=[float(values) for values in cart_values]
cart_total=sum(cart)
print("Flipkart cart total is",cart_total,"Rs.")
```
### Output
```
Flipkart cart total is 649.49 Rs.
```
<br>
<br>

# Task 4
## Build a function is_discount_applicable(order_amount) that takes a float and returns True if the amount is greater than 500, otherwise False. Print the result for order amounts 450 and 750.
### Code
```python
def is_discount_applicable(order_amount):
    if order_amount>500:
        return True
    else:
        return False
order1=is_discount_applicable(450)
order2=is_discount_applicable(750)
print(order1)
print(order2)
```
### Output
```
False
True
```
<br>
<br>

# Task 5
## You received a dataset of ratings as strings from Spotify: ['4.5', '3.0', '5', '4.2']. Use type casting to convert these to floats, then find and print the highest rating.<br><br><em><strong>Hint:</strong> Use the float() function inside a loop or list comprehension.</em>
### Code
```python
ratings=['4.5', '3.0', '5', '4.2']
rate=[float(rates) for rates in ratings]
print("Highest rating is",max(rate))
```
### Output
```
Highest rating is 5.0
```