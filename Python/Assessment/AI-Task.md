# AI AUGMENTED LEARNING 
## STEP 1: BUILD WITH AI
Use an AI tool of your choice (ChatGPT, Claude, GitHub Copilot, etc.) to help you write a Python program that:
- Accepts a list of food items and their prices for a delivery order and calculates the itemised subtotal.
- Adds an 18% GST charge and a delivery fee (Rs 30 flat) to produce a final bill amount.
- Applies a 10% loyalty discount on the subtotal if the customer has placed more than 5 previous orders — taken as a user input.
- Prints a formatted receipt showing each line item (subtotal, GST, delivery fee, discount if
applicable, and final amount payable) and handles invalid inputs such as negative prices or
non-numeric order counts.
## STEP 2: TEST & DEBUG  (WITHOUT AI)
Then, working without AI, test the code and find at least one bug, limitation, or improvement in the AI's solution. Fix it yourself. 
## GIVEN PROMPT
Help me build a python program that accepts a list of food items and their prices for a delivery order and calculates the itemised subtotal. Adds an 18% GST charge and a delivery fee (Rs 30 flat) to produce a final bill amount. Applies a 10% loyalty discount on the subtotal if the customer has placed more than 5 previous orders — taken as a user input. Prints a formatted receipt showing each line item (subtotal, GST, delivery fee, discount if applicable, and final amount payable) and handles invalid inputs such as negative prices or non-numeric order counts.
### AI GENERATED CODE
```python
"""
Delivery Order Billing System
------------------------------
- Accepts food items and prices
- Calculates subtotal
- Applies 18% GST
- Adds flat Rs 30 delivery fee
- Applies 10% loyalty discount on subtotal if previous orders > 5
- Prints a formatted receipt
- Handles invalid inputs (negative prices, non-numeric counts, etc.)
"""

GST_RATE = 0.18
DELIVERY_FEE = 30.0
LOYALTY_DISCOUNT_RATE = 0.10
LOYALTY_ORDER_THRESHOLD = 5


def get_positive_float(prompt):
    while True:
        raw = input(prompt).strip()
        try:
            value = float(raw)
        except ValueError:
            print("  Invalid input. Please enter a numeric value (e.g., 149.50).")
            continue
        if value < 0:
            print("  Price cannot be negative. Please try again.")
            continue
        return value


def get_non_negative_int(prompt):
    while True:
        raw = input(prompt).strip()
        try:
            value = int(raw)
        except ValueError:
            print("  Invalid input. Please enter a whole number (e.g., 3).")
            continue
        if value < 0:
            print("  Order count cannot be negative. Please try again.")
            continue
        return value

def collect_items():
    items = []

    while True:
        try:
            count = int(input("How many items are in this order? ").strip())
            if count <= 0:
                print("  Please enter a number greater than 0.")
                continue
            break
        except ValueError:
            print("  Invalid input. Please enter a whole number.")

    for i in range(1, count + 1):
        print(f"\nItem {i}:")
        name = input("  Name: ").strip()
        while not name:
            print("  Item name cannot be empty.")
            name = input("  Name: ").strip()

        price = get_positive_float("  Price (Rs): ")
        items.append((name, price))

    return items


def calculate_bill(items, previous_orders):
    subtotal = sum(price for _, price in items)

    discount = 0.0
    if previous_orders > LOYALTY_ORDER_THRESHOLD:
        discount = subtotal * LOYALTY_DISCOUNT_RATE

    discounted_subtotal = subtotal - discount
    gst = discounted_subtotal * GST_RATE
    final_amount = discounted_subtotal + gst + DELIVERY_FEE

    return {
        "subtotal": subtotal,
        "discount": discount,
        "discounted_subtotal": discounted_subtotal,
        "gst": gst,
        "delivery_fee": DELIVERY_FEE,
        "final_amount": final_amount,
    }


def print_receipt(items, bill, previous_orders):
    width = 42
    print("\n" + "=" * width)
    print("           DELIVERY ORDER RECEIPT")
    print("=" * width)

    for name, price in items:
        name_col = (name[:24] + "..") if len(name) > 26 else name
        print(f"{name_col:<30}{'Rs ' + format(price, '.2f'):>12}")

    print("-" * width)
    print(f"{'Subtotal':<30}{'Rs ' + format(bill['subtotal'], '.2f'):>12}")

    if bill["discount"] > 0:
        print(f"{'Loyalty Discount (10%)':<30}{'-Rs ' + format(bill['discount'], '.2f'):>12}")
        print(f"{'Subtotal after Discount':<30}{'Rs ' + format(bill['discounted_subtotal'], '.2f'):>12}")
    else:
        if previous_orders <= LOYALTY_ORDER_THRESHOLD:
            print(f"{'Loyalty Discount':<30}{'Not Applicable':>12}")

    print(f"{'GST (18%)':<30}{'Rs ' + format(bill['gst'], '.2f'):>12}")
    print(f"{'Delivery Fee':<30}{'Rs ' + format(bill['delivery_fee'], '.2f'):>12}")
    print("-" * width)
    print(f"{'FINAL AMOUNT PAYABLE':<30}{'Rs ' + format(bill['final_amount'], '.2f'):>12}")
    print("=" * width)


def main():
    print("Welcome to the Delivery Billing System!\n")

    items = collect_items()
    previous_orders = get_non_negative_int(
        "\nHow many previous orders has this customer placed? "
    )

    bill = calculate_bill(items, previous_orders)
    print_receipt(items, bill, previous_orders)


if __name__ == "__main__":
    main()
```
### Output
```
Welcome to the Delivery Billing System!

How many items are in this order? 3

Item 1:
  Name: Tiramisu
  Price (Rs): 310

Item 2:
  Name: Brownie
  Price (Rs): 160

Item 3:
  Name: Macaron
  Price (Rs): 240

How many previous orders has this customer placed? 3

==========================================
           DELIVERY ORDER RECEIPT
==========================================
Tiramisu                         Rs 310.00
Brownie                          Rs 160.00
Macaron                          Rs 240.00
------------------------------------------
Subtotal                         Rs 710.00
Loyalty Discount              Not Applicable
GST (18%)                        Rs 127.80
Delivery Fee                      Rs 30.00
------------------------------------------
FINAL AMOUNT PAYABLE             Rs 867.80
==========================================
```
<br>
<br>

## The Problem:
In the AI generated code it asks user for each and every item they are gonna order after entering the total items number without asking the quantity. What if a user only wants to buy 1 item but in 3 quantity. Therefore for improvement of better billing system I added a few fixes that asks for item quantiy for each item.
### FIXED CODE
```python
"""
Delivery Order Billing System (Detailed Receipt)
------------------------------------------------
- Accepts food items, prices, and quantities
- Calculates subtotal based on item quantities
- Applies 18% GST
- Adds flat Rs 30 delivery fee
- Applies 10% loyalty discount on subtotal if previous orders > 5
- Prints a detailed receipt showing unit price and quantities
- Handles invalid inputs (negative prices, non-numeric counts, etc.)
"""

GST_RATE = 0.18
DELIVERY_FEE = 30.0
LOYALTY_DISCOUNT_RATE = 0.10
LOYALTY_ORDER_THRESHOLD = 5


def get_positive_float(prompt):
    """Keep asking until the user enters a valid non-negative number."""
    while True:
        raw = input(prompt).strip()
        try:
            value = float(raw)
        except ValueError:
            print("  Invalid input. Please enter a numeric value (e.g., 149.50).")
            continue
        if value < 0:
            print("  Price cannot be negative. Please try again.")
            continue
        return value


def get_non_negative_int(prompt):
    """Keep asking until the user enters a valid non-negative integer."""
    while True:
        raw = input(prompt).strip()
        try:
            value = int(raw)
        except ValueError:
            print("  Invalid input. Please enter a whole number (e.g., 3).")
            continue
        if value < 0:
            print("  Order count cannot be negative. Please try again.")
            continue
        return value


def collect_items():
    """Collect item names, prices, and quantities from the user."""
    items = []

    while True:
        count = get_non_negative_int("How many distinct items are in this order? ")
        if count == 0:
            print("  Please enter a number greater than 0.")
            continue
        break

    for i in range(1, count + 1):
        print(f"\nItem {i}:")
        name = input("  Name: ").strip()
        while not name:
            print("  Item name cannot be empty.")
            name = input("  Name: ").strip()

        price = get_positive_float("  Price per unit (Rs): ")
        
        while True:
            quantity = get_non_negative_int("  Quantity: ")
            if quantity == 0:
                print("  Quantity must be at least 1.")
                continue
            break

        items.append((name, price, quantity))

    return items


def calculate_bill(items, previous_orders):
    subtotal = sum(price * quantity for _, price, quantity in items)

    discount = 0.0
    if previous_orders > LOYALTY_ORDER_THRESHOLD:
        discount = subtotal * LOYALTY_DISCOUNT_RATE

    discounted_subtotal = subtotal - discount
    gst = discounted_subtotal * GST_RATE
    final_amount = discounted_subtotal + gst + DELIVERY_FEE

    return {
        "subtotal": subtotal,
        "discount": discount,
        "discounted_subtotal": discounted_subtotal,
        "gst": gst,
        "delivery_fee": DELIVERY_FEE,
        "final_amount": final_amount,
    }


def print_receipt(items, bill, previous_orders):
    width = 42
    print("\n" + "=" * width)
    print("           DELIVERY ORDER RECEIPT")
    print("=" * width)

    for name, price, quantity in items:
        item_total = price * quantity
        # Truncate long item names if needed
        name_col = (name[:24] + "..") if len(name) > 26 else name
        
        # Print item name on the first line
        print(f"{name_col}")
        # Print unit price details and total on the second line indented
        details = f"  {quantity} x Rs {format(price, '.2f')}"
        print(f"{details:<30}{'Rs ' + format(item_total, '.2f'):>12}")

    print("-" * width)
    print(f"{'Subtotal':<30}{'Rs ' + format(bill['subtotal'], '.2f'):>12}")

    if bill["discount"] > 0:
        print(f"{'Loyalty Discount (10%)':<30}{'-Rs ' + format(bill['discount'], '.2f'):>12}")
        print(f"{'Subtotal after Discount':<30}{'Rs ' + format(bill['discounted_subtotal'], '.2f'):>12}")
    else:
        if previous_orders <= LOYALTY_ORDER_THRESHOLD:
            print(f"{'Loyalty Discount':<30}{'Not Applicable':>12}")

    print(f"{'GST (18%)':<30}{'Rs ' + format(bill['gst'], '.2f'):>12}")
    print(f"{'Delivery Fee':<30}{'Rs ' + format(bill['delivery_fee'], '.2f'):>12}")
    print("-" * width)
    print(f"{'FINAL AMOUNT PAYABLE':<30}{'Rs ' + format(bill['final_amount'], '.2f'):>12}")
    print("=" * width)


def main():
    print("Welcome to the Delivery Billing System!\n")

    items = collect_items()
    previous_orders = get_non_negative_int(
        "\nHow many previous orders has this customer placed? "
    )

    bill = calculate_bill(items, previous_orders)
    print_receipt(items, bill, previous_orders)


if __name__ == "__main__":
    main()
```
### Output
```
Welcome to the Delivery Billing System!

How many distinct items are in this order? 1

Item 1:
  Name: Tiramisu
  Price per unit (Rs): 310
  Quantity: 3

How many previous orders has this customer placed? 4

==========================================
           DELIVERY ORDER RECEIPT
==========================================
Tiramisu
  3 x Rs 310.00                  Rs 930.00
------------------------------------------
Subtotal                         Rs 930.00
Loyalty Discount              Not Applicable
GST (18%)                        Rs 167.40
Delivery Fee                      Rs 30.00
------------------------------------------
FINAL AMOUNT PAYABLE            Rs 1127.40
==========================================
```


