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