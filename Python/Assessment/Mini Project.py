import json
import os

DATA_FILE = "orders.json"

class Order:
    def __init__(self, order_id, customer_name, items, total_amount, status="Pending"):
        self.order_id = order_id
        self.customer_name = customer_name
        self.items = items
        self.total_amount = total_amount
        self.status = status

    def to_dict(self):
        return self.__dict__

    @staticmethod
    def from_dict(data):
        return Order(data["order_id"], data["customer_name"], data["items"],
                      data["total_amount"], data.get("status", "Pending"))


def load_orders():
    if not os.path.exists(DATA_FILE):
        return []
    try:
        with open(DATA_FILE, "r") as f:
            data = json.load(f)
        return [Order.from_dict(o) for o in data]
    except (json.JSONDecodeError, FileNotFoundError):
        print("Could not read existing data. Starting with an empty order list.")
        return []


def save_orders(orders):
    with open(DATA_FILE, "w") as f:
        json.dump([o.to_dict() for o in orders], f, indent=4)


def place_order(orders):
    try:
        name = input("Enter customer name: ").strip()
        if not name:
            raise ValueError("Customer name cannot be empty.")

        items_input = input("Enter items (comma separated): ").strip()
        items = [i.strip() for i in items_input.split(",") if i.strip()]
        if not items:
            raise ValueError("At least one item is required.")

        amount_input = input("Enter total amount: ").strip()
        total_amount = float(amount_input)   
        if total_amount <= 0:
            raise ValueError("Total amount must be greater than zero.")

        new_id = (orders[-1].order_id + 1) if orders else 1
        order = Order(new_id, name, items, total_amount)
        orders.append(order)
        save_orders(orders)

        print(f"Order placed successfully! Order ID: {new_id}")

    except ValueError as e:
        print(f"Invalid input: {e}")


def view_orders(orders):
    if not orders:
        print("No orders found.")
        return

    header = f"{'ID':<5}{'Customer':<15}{'Items':<8}{'Amount':<10}{'Status':<10}"
    print(header)
    print("-" * len(header))

    for o in orders:
        row = f"{o.order_id:<5}{o.customer_name:<15}{len(o.items):<8}{o.total_amount:<10.2f}{o.status:<10}"
        if o.status == "Delivered":
            print(f"\033[92m{row}\033[0m")   
        else:
            print(row)


def search_order(orders):
    try:
        order_id = int(input("Enter Order ID to search: ").strip())
    except ValueError:
        print("Order ID must be a number.")
        return

    for o in orders:
        if o.order_id == order_id:
            print("\nOrder Found:")
            print(f"ID          : {o.order_id}")
            print(f"Customer    : {o.customer_name}")
            print(f"Items       : {', '.join(o.items)}")
            print(f"Total Amount: {o.total_amount:.2f}")
            print(f"Status      : {o.status}")
            return

    print("Order not found.")


def main():
    orders = load_orders()

    menu = """
==== Food Delivery Order Management ====
1. Place New Order
2. View All Orders
3. Search Order by ID
4. Exit
"""

    while True:
        print(menu)
        choice = input("Enter choice (1-4): ").strip()

        if choice == "1":
            place_order(orders)
        elif choice == "2":
            view_orders(orders)
        elif choice == "3":
            search_order(orders)
        elif choice == "4":
            print("Goodbye!")
            break
        else:
            print("Invalid choice. Please enter 1-4.")

if __name__ == "__main__":
    main()