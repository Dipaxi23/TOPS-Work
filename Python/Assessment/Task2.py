"""
Build a menu management program that stores a restaurant's menu in a dictionary and lets
the user interact with it through a looped console interface.
Store at least 6 menu items in a dictionary; each item maps a dish name (key) to a nested
dictionary with keys: price and category.
Provide three options in a loop: (1) View all items formatted as a numbered table, (2) Filter
items by category, (3) Search for a dish by name and display its price.
Define a separate function for each of the three operations; call them from the main loop.
Keep the loop running until the user enters '0' to exit.
"""
menu={"Cheesy 7 Pizza":{"price":650,"category":"main course"},
      "Spring Rolls":{"price":320,"category":"starter"},
      "Chocolate Brownie":{"price":280,"category":"dessert"},
      "Pink Pasta":{"price":480,"category":"main course"},
      "Ice Mojito":{"price":180,"category":"beverage"},
      "Garlic Bread": {"price": 220, "category": "starter"} 
    }

def view_items(choice):
    print("-"*40)
    print("              ITEMS LIST")
    print("-"*40)
    for item,details in menu.items():
        print("-"*40)
        print(f"{item}")
        for val,cat in details.items():
            print(f"{val}:{cat}")

def filter_items(choice):
    cat=input("Enter category (starter,beverage,main course,dessert): ")
    for item,details in menu.items():
        if details["category"]==cat:
            print("-"*40)
            print(f"{item}") 
            for key,values in details.items():
                print(f"{key}: {values}") 

def search_items(choice):
    search=input("Enter the dish name you want to search: ")
    for item,details in menu.items():
        if item.lower()==search.strip().lower():
            print("-"*40)
            print(f"{item}") 
            for key,values in details.items():
                print(f"{key}: {values}") 
            
while True:
    print("*"*40)
    print("            Restaurant Menu")
    print("*"*40)
    print("1. View all items")
    print("2. Filter items by category")
    print("3. Search for a dish by name")
    print("0. Exit Menu")
    choice=int(input("Enter Your Choice: "))
    if choice==[1,2,3,0]:
        print("Error: Please enter a valid number.")

    elif choice==1:
        view_items(choice)

    elif choice==2:
                filter_items(choice)

    elif choice==3:
        search_items(choice)

    elif choice==0:
        print("Exiting menu system.")
        break

