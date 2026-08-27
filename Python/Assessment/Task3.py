"""
Build a program that records food delivery orders to a JSON file and lets the user view all past
orders, demonstrating file handling and exception handling together.
Accept the following order details from the user: customer name, list of items
(comma-separated input converted to a Python list), total amount, and order status.
Load the existing orders list from orders.json before adding the new order, then save the
updated list back to the file — so all orders accumulate across runs.
Provide a 'View Orders' option that reads orders.json and prints each order in a readable
format.
Use a try-except block to handle FileNotFoundError (first run, no file yet) and ValueError
(non-numeric total amount).
"""

import json
import os

ORDERS_FILE="delievery_orders.json"

def load_orders():
    try:
        with open(ORDERS_FILE, "r") as file:
            return json.load(file)
    except FileNotFoundError:
        print("No previous orders found. Starting a fresh order list.\n")
        return []
    except json.JSONDecodeError:
        print("Warning: orders.json was empty or corrupted. Starting fresh.\n")
        return []


def save_orders(orders):
    with open(ORDERS_FILE, "w") as file:
        json.dump(orders, file, indent=4)


def add_order():
    orders = load_orders()

    name = input("Enter customer name: ").strip()

    items_input = input("Enter items (comma-separated): ").strip()
    items = [item.strip() for item in items_input.split(",") if item.strip()]

    try:
        total_amount = float(input("Enter total amount: ").strip())
    except ValueError:
        print("Invalid amount entered. Total amount must be a number. Order not saved.\n")
        return

    status = input("Enter order status (e.g., Pending/Delivered): ").strip()

    new_order = {
        "customer_name": name,
        "items": items,
        "total_amount": total_amount,
        "status": status
    }

    orders.append(new_order)
    save_orders(orders)
    print("Order saved successfully!\n")


def view_orders():
    orders = load_orders()

    if not orders:
        print("No orders to display.\n")
        return

    print("\n===== ALL ORDERS =====")
    for i, order in enumerate(orders, start=1):
        print(f"\nOrder #{i}")
        print(f"  Customer   : {order.get('customer_name', 'N/A')}")
        print(f"  Items      : {', '.join(order.get('items', []))}")
        print(f"  Total (Rs.)  : {order.get('total_amount', 'N/A')}")
        print(f"  Status     : {order.get('status', 'N/A')}")
    print("\n=======================\n")


def main():
    while True:
        print("Food Delivery Order Tracker")
        print("1. Add New Order")
        print("2. View Orders")
        print("3. Exit")

        choice = input("Choose an option (1-3): ").strip()

        if choice == "1":
            add_order()
        elif choice == "2":
            view_orders()
        elif choice == "3":
            print("Goodbye!")
            break
        else:
            print("Invalid choice. Please enter 1, 2, or 3.\n")

if __name__ == "__main__":
    main()
