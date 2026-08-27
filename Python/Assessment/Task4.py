"""
Build an object-oriented system that models delivery riders using a class, stores multiple rider
objects in a list, and persists their data to a CSV file.
Create a Rider class with instance attributes: rider_id, name, status (default 'Available'), and
total_deliveries (default 0).
Implement three methods: assign_order(order_id) — sets status to 'On Delivery' and prints a
confirmation; complete_delivery() — increments total_deliveries, resets status to 'Available';
display_info() — prints all rider details.
In the main program, create at least three Rider objects and provide a simple numbered menu
to assign and complete orders for any rider selected by ID.
Save all rider data to riders.csv using the csv module when the user exits, and reload it at
program start if the file exists.
"""
import csv
import os

CSV_FILE = "riders.csv"


class Rider:
    def __init__(self, rider_id, name, status="Available", total_deliveries=0):
        self.rider_id = rider_id
        self.name = name
        self.status = status
        self.total_deliveries = int(total_deliveries)

    def assign_order(self, order_id):
        self.status = "On Delivery"
        print(f"Order {order_id} assigned to {self.name}. Status: {self.status}")

    def complete_delivery(self):
        self.total_deliveries += 1
        self.status = "Available"
        print(f"{self.name} completed delivery. Total: {self.total_deliveries}")

    def display_info(self):
        print(f"ID: {self.rider_id} | Name: {self.name} | "
              f"Status: {self.status} | Deliveries: {self.total_deliveries}")


def load_riders():
    riders = []
    if os.path.exists(CSV_FILE):
        with open(CSV_FILE, newline="") as f:
            for row in csv.DictReader(f):
                riders.append(Rider(row["rider_id"], row["name"],
                                     row["status"], row["total_deliveries"]))
    return riders


def save_riders(riders):
    with open(CSV_FILE, "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["rider_id", "name", "status", "total_deliveries"])
        for r in riders:
            writer.writerow([r.rider_id, r.name, r.status, r.total_deliveries])
    print(f"Saved {len(riders)} riders to {CSV_FILE}")


def find_rider(riders, rider_id):
    return next((r for r in riders if r.rider_id == rider_id), None)


def main():
    riders = load_riders() or [
        Rider("R1", "Aryan"),
        Rider("R2", "Bobby"),
        Rider("R3", "Dev"),
    ]

    menu = """
1. Show all riders
2. Assign order
3. Complete delivery
4. Exit
"""
    while True:
        print(menu)
        choice = input("Choose an option: ").strip()

        if choice == "1":
            for r in riders:
                r.display_info()

        elif choice == "2":
            rider = find_rider(riders, input("Rider ID: ").strip())
            if rider:
                rider.assign_order(input("Order ID: ").strip())
            else:
                print("Rider not found.")

        elif choice == "3":
            rider = find_rider(riders, input("Rider ID: ").strip())
            if rider:
                rider.complete_delivery()
            else:
                print("Rider not found.")

        elif choice == "4":
            save_riders(riders)
            print("Goodbye!")
            break

        else:
            print("Invalid choice, try again.")


if __name__ == "__main__":
    main()