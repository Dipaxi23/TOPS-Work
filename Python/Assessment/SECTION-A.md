# SCENARIO-1
## You are building a food delivery app that tracks four values per order: the order total (Rs 499.50), the delivery distance (7.3 km), the payment method ('UPI'), and whether the restaurant is currently accepting orders (True).
### Question: Identify the correct Python data type for each of the four values above. Then explain why assigning the wrong type — for example, storing Rs 499.50 as an integer — would cause an incorrect result when applying a 10% discount calculation.
### Answer:
Assigning data types:
- order total: float or decimal (because total/number can contain decimal points)
- delivery distance: float (used for accurate measurements)
- payment method: string (it represents text data)
- accepting orders or not: boolean (it can only have two values, true or false.)
Assignig wrong data type for order total for storing 499.50 as an integer can cause problems because python takes it as a whole number and it forces computer to drop o.50 and just remember 499 the computer calculates it on 499 instead of 499.50 and when the order are more those small fractions can lead to big data miscalculations. 
<br>
<br>

# SCENARIO-2
## You are developing a restaurant menu system. A teammate suggests storing the menu as a list of tuples like [('Paneer Burger', 180, 'Snacks'), ('Masala Dosa', 90, 'Breakfast')], while you prefer a dictionary where each dish name is the key.
### Question: Compare these two data structures for looking up a dish price by name. Which gives faster and more readable access, and why? Describe one limitation of the list-of-tuples approach that the dictionary design solves.
### Answer:
- Dictionary: using dictinary to assign each dish name a key and its value is more faster and more readable access. Dictionary use menu["paneer burger"] thererefor finding a dish by its name is faster and easier with less line of code.
- List: Using list of tuples is takes time and memory. When in need to find a particular item in the list it takes a for loop, conditions, generators. The lines of code increases and it gets more complex.
Moreover, dictionary can overwrite values i.e if you added a paneer burger second time it overwrites the existing one and keeps it consistent. No duplicates allowed like list of tuples.
<br>
<br>

# SCENARIO-3
## You are writing a delivery fee calculator that applies three different fee rules: no charge if the order value is Rs 500 or more, Rs 30 fee if distance is 5 km or less, and Rs 60 fee for distances above 5 km. A colleague proposes writing this as a single lambda function.
### Question: Explain why a named function defined with def is more appropriate than a lambda for this multi-condition fee logic. Then describe one specific situation inside this same app where a lambda would genuinely be \the better choice.
### Answer:
A defined function better in this case because it can be easier to read as the calculator applies multiple conditions. It can be easily found and accessed at any point. Meanwhile lambda functions are nameless anonymous kind of functions. When in need it would take time to find and access those. But lambda function can be used to filter orders by distance or order values.
<br>
<br>

# SCENARIO-4
## You are working on an order history feature that must save completed delivery orders to a JSON file so the system can reload all orders when the app restarts.
### Question: Describe the complete Python sequence to write a single order dictionary to a JSON file and read it back. What exception is raised if the file does not exist at read time, and how should your program handle it so the app starts cleanly on its first run?
### Answer:
- Import json module in python.
- Create a dictionary and add the order details.
- Use with open() to create the file in 'w' mode.
- Dump the order data.
- Again by using with open() read file in 'r' mode.
- Load the order data.
- When attempting to read from a file that does not exist yet use try catch block.
- Write the read mode code in try block and in exception block use "except FileNotFoundError" and print the desired message.
<br>
<br>

# SCENARIO-5
## You are designing a delivery tracking system. Each delivery must store the rider's name, current GPS location, assigned order ID, and status (e.g. 'On the way'). It must also support actions such as updating the location and marking the delivery as complete.
### Question: Justify why a class is a better design choice here than storing all of this data in separate variables or a plain dictionary. Identify at least two OOP principles your class design would apply and explain what each one achieves.
### Answer:
A class is a better choice in this case because while dictionary can help you group the data but it can lack the privacy and security attached to those data. One can easily overwrite any data. It would be also tricky and lengthy to store large amount of data in different variables. Meanwhile a class can store data and have different methods for different kind of needs. It bundles data together in one class and encapsulate it. Therefore no other user can overwrite or update anything if they don't have access to the class. And with abstraction method it can also hide the data and inner working of a structure. They can simply call the method and see the output.It is easier to maintain.
<br>
<br>

# SCENARIO-6
## You are debugging a delivery cost calculator. When a user types 'two hundred' instead of a number for the order amount, the program crashes with an unhandled exception.
### Question: Describe how you would use a try-except block to handle this error gracefully. Name the specific exception type you would catch, and explain how you would structure the code so the program asks the user to re-enter the value instead of terminating.
### Answer:
To handle this problem we can use try-catch block with while loop. When a user types 'two hundred' python raises "ValueError'. We can add the input and conversation logic inside while True loop that keeps running until a user enters a valid input. Use 'except ValuError' and print the desired message. And since its a while loop it will not terminate and keep running until a valid input is given.