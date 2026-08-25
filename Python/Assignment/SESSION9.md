# Task 1
## Define a function called calculate_final_price(price, discount_rate) that returns the final price after applying the discount. Test it with price 1200 and discount_rate 0.15.
### Code
```python
def calculate_final_price(price,discount_rate):
    return price+discount_rate
finalprice=calculate_final_price(100,0.15)
print("The final amount is",finalprice)
```
### Output
```
The final amount is 100.15
```
<br>
<br>

# Task 2
## Create a function get_delivery_charge(amount, city='Ahmedabad') that returns a delivery charge: Rs. 30 for Ahmedabad, Rs. 50 for other cities. Call it with and without the city argument to see both results.
### Code
```python
def get_delivery_charge(amount,city):
    if city.lower()=="ahmedabad":
        return 30
    return 50
print("Delivery Charge: ",get_delivery_charge(330,"ahmedabad"))
print("Delivery Charge: ",get_delivery_charge(320,"mumbai"))
```
### Output
```
Delivery Charge:  30
Delivery Charge:  50
```
<br>
<br>

# Task 3
## Build a function called format_coupon_message(username, discount=10) that returns a string like 'Hi Rahul, you get 10% off!' If no discount is given, use 10% by default. Test it for two users: one with a custom discount, one with the default.
### Code
```python
def format_coupon_message(username,discount=10):
    print(f"Hi {username}, you get {discount}% off!")
default_user=format_coupon_message("Dipaxi")
custom_user=format_coupon_message("Jheel",discount=25)
```
<br>
<br>

# Task 4
## Given a function apply_discount(price, rate=0.10), update it so that if the rate is not passed, it uses 0.10 by default. Then, call it with only the price argument and print the result.<br><br><em><strong>Hint:</strong> Use default arguments in your function definition.</em>
### Code
```python
def apply_discount(price,rate=10):
    print(f"For {price} price, you get {rate}% off!")
user1=apply_discount(1200)
user2=apply_discount(2000,rate=18)
```
### Output
```
For 1200 price, you get 10% off!
For 2000 price, you get 18% off!
```
<br>
<br>

# Task 5
## Write a function called calculate_cashback(amount, cashback_rate=0.05) that returns the cashback amount. Then, use it to calculate cashback for a Zomato order of Rs. 500 with the default rate, and for a Flipkart order of Rs. 2000 with a 7% cashback.
### Code
```python
def calculate_cashback(amount,cashback_rate=0.05):
    return amount*cashback_rate

zomato_cb=calculate_cashback(500)
print("Your Zomato Cashback for your order is Rs.",zomato_cb)
fk_cb=calculate_cashback(2000, cashback_rate=0.07)
print("Your Flipkart Cashback for your order is Rs.",fk_cb)
```
### Output
```
Your Zomato Cashback for your order is Rs. 25.0
Your Flipkart Cashback for your order is Rs. 140.0
```