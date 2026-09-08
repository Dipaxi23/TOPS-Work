# Task 1
## Use re.findall() to extract all valid Indian phone numbers (10 digits, starting with 7, 8, or 9) from a given text string that contains random numbers, prices, and phone numbers like those seen in OLX or WhatsApp chats.
### Code
```python
import re

text = """
Hey, check out this bike! Price is ₹45,000. Call me at 9876543210 or WhatsApp 8123456789. 
My old number was 6123456789 (invalid start) and random ID is 123456789. 
Another seller's number: 7012345678. Price: 1500 rs, pin code 380015.
"""
pattern=r"\b[7-9]\d{9}\b"
phone_numbers = re.findall(pattern, text)

print("Extracted Phone Numbers:")
for number in phone_numbers:
  print(number)
```
### Output
```
Extracted Phone Numbers:
9876543210
8123456789
7012345678
```
<br>
<br>

# Task 2
## Write a Python function using re.search() that checks if a given string contains a valid date in the format DD/MM/YYYY (e.g., 25/06/2024), and returns True if found, otherwise False.<br><br><em><strong>Hint:</strong> Use the pattern '\b\d{2}/\d{2}/\d{4}\b'.</em>
### Code
```python
import re
def has_valid_date(text):
    pattern = r'\b\d{2}/\d{2}/\d{4}\b'
    return bool(re.search(pattern, text))

print(has_valid_date("Today's date is 25/06/2024.")) 
print(has_valid_date("No date here!"))                 
```
### Output
```
True
False
```
<br>
<br>

# Task 3
## Given a messy text copied from a Zomato review containing multiple emails, use re.findall() to extract all valid email addresses and print them as a list.
### Code
```python
import re

review_text = """
Amazing food and service! If you want pictures, email me at john,winchester_123@gmail.com. 
For complaints, contact support@help.co.in or feedback@foodie.org. 
Ignore these fake ones: test@.com, admin@domain.
"""
email_pattern=r'[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+'
emails_list=re.findall(email_pattern, review_text)

print(emails_list)
```
### Output
```
['winchester_123@gmail.com.', 'support@help.co.in', 'feedback@foodie.org.']
```
<br>
<br>

# Task 4
## Use re.sub() to mask all but the last 4 digits of any phone number in a string (e.g., replace 9876543210 with ******3210) like Paytm does for privacy.<br><br><em><strong>Constraint:</strong> Do not use loops; achieve this only with re.sub().</em>
### Code
```python 
import re
text="Please contact support at 9876543210 for assistance."
masked_text=re.sub(r"\d{6}(\d{4})", lambda m: "*" * 6 + m.group(1), text)

print(masked_text)
```
### Output
```
Please contact support at ******3210 for assistance.
```
<br>
<br>

# Task 5
## Use ChatGPT to generate a regex pattern that matches Flipkart-style order IDs (e.g., OD123456789012345000) and test it in Python using re.search() on sample order strings.
### Code
```python
import re

pattern = r"OD\d{18}"

orders = [
    "Your order ID is OD123456789012345000",
    "Order: OD987654321098765432",
    "Invalid order: AB123456789012345000"
]

for order in orders:
    result = re.search(pattern, order)

    if result:
        print("Order ID found:", result.group())
    else:
        print("No valid Order ID found")
```
### Output
```
Order ID found: OD123456789012345000
Order ID found: OD987654321098765432
No valid Order ID found
```