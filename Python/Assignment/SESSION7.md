# Task 1
## Write a Python script that checks if a user's entered age is 18 or above and prints 'Eligible for IPL ticket booking' if true, otherwise prints 'Not eligible'.
## Code:
```python
age=int(input("Enter Your Age: "))

if age>=18:
    print("You are eligible for the IPL Tickets!!!")
else:
    print("You are not eligible for the IPL Tickets.")
```
### Output 1:
```
Enter Your Age: 19
You are eligible for the IPL Tickets!!!
```
### Output 2:
```
Enter Your Age: 13
You are not eligible for the IPL Tickets.
```
<br>
<br>

# Task 2
## Create a Python program that takes the number of followers as input and uses if, elif, and else to print 'Micro Influencer' if followers < 10,000, 'Rising Star' if between 10,000 and 100,000, and 'Celebrity' if above 100,000.
## Code:
```python
foll=int(input("Enter Your Number of Followers: "))

if foll<10000:
    print("Micro Influencer")
elif foll>=10000 and foll<==100000>:
    print("Rising Star")
else foll>100000:
    print("Celebrity")
```
### Output 1:
```
Enter Your Number of Followers: 9999
Micro Influencer
```
### Output 2:
```
Enter Your Number of Followers: 10000
Rising Star
```
### Output 3:
```
Enter Your Number of Followers: 100001
Celebrity
```
<br>
<br>

# Task 3
## Build a Python script that asks the user for their Zomato order total and prints 'Apply Free Delivery' if total is above 299, 'Add more items for free delivery' if between 200 and 299, else 'Delivery charges apply'.
## Code:
```python
total=int(input("Enter your Zomato Order Total: "))

if total>299:
    print("Apply Free Delivery.")
elif total>=200 and total<=299:
    print("Add more items for free delivery.")
else:
    print("Delivery charges apply.")
```
### Output 1:
```
Enter your Zomato Order Total: 300
Apply Free Delivery.
```
### Output 2:
```
Enter your Zomato Order Total: 250
Add more items for free delivery.
```
### Output 3:
```
Enter your Zomato Order Total: 159
Delivery charges apply.
```
<br>
<br>

# Task 4
## Write a Python program using nested if statements: take a user's entered Flipkart cart value and payment method ('UPI', 'Card', 'Cash'). If the cart value is above 1000 and payment method is 'UPI', print 'Eligible for 10% cashback'; if above 1000 and payment is not 'UPI', print 'Eligible for 5% cashback'; else print 'No cashback'.
## Code:
```python
cartval=int(input("Enter Your Flipkart Cart Value: "))
paytype=input("Enter Payment Method (UPI/Card/Cash): ")

if cartval>1000 and paytype=="UPI":
    print("Eligible for 10% Cashback.")
elif cartval>1000 and paytype!="UPI":
    print("Eligible for 5% Cashback.")
else:
    print("No Cashback.")
```
### Output 3:
```
Enter Your Flipkart Cart Value: 1001 
Enter Payment Method (UPI/Card/Cash): UPI
Eligible for 10% Cashback.
```
### Output 2:
```Enter Your Flipkart Cart Value: 2000 
Enter Payment Method (UPI/Card/Cash): Card
Eligible for 5% Cashback.
```
### Output 3:
```
Enter Your Flipkart Cart Value: 950
Enter Payment Method (UPI/Card/Cash): UPI
No Cashback.
```