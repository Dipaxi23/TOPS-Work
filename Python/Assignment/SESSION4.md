# Task 1
## Create a Python script that takes any product name string (e.g., 'Redmi Note 12 Pro') and prints the name in all uppercase and all lowercase using the upper() and lower() methods.
### Code
```python
product_name=input("Enter Product Name: ")
print(product_name.upper())
print(product_name.lower())
```
### Output
```
Enter Product Name: Redmi Note 12 Pro
REDMI NOTE 12 PRO
redmi note 12 pro
```
<br>
<br>

# Task 2
## Write a function clean_brand_name(name) that removes leading/trailing spaces and replaces any hyphens '-' with a single space in the input string. Test it with ' oneplus-Nord '.
### Code
```python
def clean_brand_name(name):
    return name.replace('-', ' ')

brand=clean_brand_name("oneplus-Nord")
print(brand)
```
### Output
```
oneplus Nord
```
<br>
<br>

# Task 3
## Given the string 'Apple iPhone 14 Pro Max', use string slicing to extract and print only the brand name and the model (i.e., 'Apple' and 'iPhone 14 Pro Max') separately.<br><br><em><strong>Hint:</strong> Use split() to help find the split point, then use slicing for the substrings.</em>
### Code
```python
string="Apple iPhone 14 Pro Max"
brand,model=string.split(" ",1)
print("Brand:",brand)
print("Model:",model)
```
### Output
```
Brand: Apple
Model: iPhone 14 Pro Max
```
<br>
<br>

# Task 4
## Build a function format_product_display(name, price) that takes a product name and price (e.g., 'Boat Earbuds', 1299) and returns a formatted string like 'Boat Earbuds - ₹1299'.
### Code
```python
def format_product_display(name, price):
    print(f"{name} - ₹{price}")
format_product_display("Boat earbuds",1299)
```
### Output
```
Boat earbuds - ₹1299
```
<br>
<br>

# Task 5
## Suppose you have a list of messy product names: [' mi-Band 5 ', ' SAMSUNG-Galaxy ', ' realme-Book ']. Write code to clean each name (remove spaces, replace hyphens with spaces, and make the brand title case) and print the cleaned list.<br><br><em><strong>Constraint:</strong> Use at least three string methods from this session.</em>v
### Code
```python
brands=[' mi-Band 5 ', ' SAMSUNG-Galaxy ', ' realme-Book ']
for name in brands:
    name=name.replace('-', ' ')
    name=name.strip()
    name=name.title()
    print(name)
```
### Output
```
Mi Band 5
Samsung Galaxy
Realme Book
```
