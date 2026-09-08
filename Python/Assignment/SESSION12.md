# Task 1
## Write a lambda function that takes a price in rupees and returns the price after adding 18% GST. Test it on the prices 100, 250, and 500.
### Code
```python
amount=100
amount2=250
amount3=500
gst=lambda price:price*0.18
total=lambda price:price+gst(price)
print("Total1:",total(amount))
print("Total2:",total(amount2))
print("Total3:",total(amount3))
```
### Output
```
Total1: 118.0
Total2: 295.0
Total3: 590.0
```
<br>
<br>

# Task 2
## Given a list of song titles from Spotify with extra spaces and inconsistent casing, use map() and a lambda function to clean each title so that it is stripped of spaces and converted to title case (e.g., ' shape OF you ' → 'Shape Of You').
### Code
```python
titles=[' shape OF you ', 'blinding LIGHTS', ' levitating ']
cleaned=list(map(lambda title:title.strip().title(), titles))

print(cleaned)
```
### Output
```
['Shape Of You', 'Blinding Lights', 'Levitating']
```
<br>
<br>

# Task 3
## Use filter() and a lambda function to extract only those Flipkart product names from a list that start with the letter 'S' (case-insensitive).
### Code
```python
products=["Smartphone","Shoes","Laptop","Smartwatch","T-shirt","Speaker","shirt"]
filtered=list(filter(lambda name: name.lower().startswith('s'),products))

print(filtered)
```
### Output
```
['Smartphone', 'Shoes', 'Smartwatch', 'Speaker', 'shirt']
```
<br>
<br>

# Task 4
## Given a list of order amounts from a Zomato cart [120, 340, 560, 80], use reduce() from functools to calculate the total bill amount.
### Code
```python
from functools import reduce
amounts=[120,340,560,80]
total=reduce(lambda x,y:x+y,amounts)
print(f"Total bill amount: {total}")
```
### Output
```
Total bill amount: 1100
```
<br>
<br>

# Task 5
## Use ChatGPT or Copilot to generate a Python code snippet that uses map(), filter(), and reduce() together to process a list of numbers: first double each number, then filter to keep only numbers greater than 100, and finally sum the result. Paste and test the generated code with the list [40, 60, 80, 120].
### Code
```python
from functools import reduce
numbers=[40,60,80,120]
doubled=map(lambda x:x*2,numbers)
filtered=filter(lambda x:x>100,doubled)
result=reduce(lambda x,y:x+y,filtered)
print("Result:", result)
```
### Output
```
Result: 520
```