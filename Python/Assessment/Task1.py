"""
Build a console program that calculates and displays the final bill for a food delivery order
based on order value and delivery distance. Prompt the user to enter the order value (Rs ) and delivery distance (km) 
as separate inputs. Apply these fee rules using conditional statements: free delivery if order value >= Rs 500; 
Rs 30 fee if distance <= 5 km; Rs 60 fee if distance > 5 km.
Display the item total, delivery fee, and final amount payable in a clearly formatted output.
Handle the case where the user enters a negative distance or negative order value by printing
an appropriate error message and stopping execution.
"""

while True:
    Order_Value=float(input("Enter Your Order Value (Rs.): "))
    if Order_Value>0:
        break
    print("Error: Please enter a valid number.")

while True:
    Dist=float(input("Enter Delivery Distance (in km): "))
    if Dist>0:
        break
    print("Error: Please enter a valid number.")

if Order_Value>=500:
    delivery_fee=0
    print("~"*40)
    print("Your order is eligible for free delivery.")
    print("~"*40)
elif Dist<=5:
    delivery_fee=30
    print("*"*65)
    print("Rs. 30 Delivery Charge would be added to your final bill amount.")
    print("*"*65)
else:
    delivery_fee=60
    print("*"*65)
    print("Rs. 60 Delivery Charge would be added to your final bill amount.")
    print("*"*65)
final_amount=Order_Value+delivery_fee
print("-"*40)
print("             GENERATED BILL")
print("-"*40)
print("Order Value:", Order_Value)
print("Distance (km):", Dist)
print("Delivery Fee:", delivery_fee)
print("Final Bill Amount:", final_amount)
print("-"*40)
