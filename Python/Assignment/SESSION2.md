# Task 1
## Create three variables in Python: user_name, fav_app, and daily_usage_hours. Assign your own name, your favorite app (like Instagram or Zomato), and how many hours you use it daily.
### Code
```python
user_name="Dipaxi"
fav_app="Twitter"
daily_usage_hours=7
print("User:",user_name)
print("Favouriye app:",fav_app)
print("Daily Usage Hours:",daily_usage_hours)
```
### Output
```
User: Dipaxi
Favouriye app: Twitter
Daily Usage Hours: 7
```
<br>
<br>

# Task 2
## Write a Python script that declares variables for product_name, price, and is_available to represent an item on Flipkart. Print each variable and its data type using the type() function.
### Code
```python
product_name="Smartphone"
price=34999
is_available=True
print("Product Name:",product_name,"\nType:",type(product_name))
print("Price:",price,"\nType:",type(price))
print("Is available:",is_available,"\nType:",type(is_available))
```
### Output
```
Product Name: Smartphone 
Type: <class 'str'>
Price: 34999 
Type: <class 'int'>
Is available: True 
Type: <class 'bool'>
```
<br>
<br>

# Task 3
## Demonstrate the difference between single-line and multi-line comments in Python by writing a script that explains how a Spotify playlist recommendation system might work. Use # for single-line and triple quotes for multi-line comments.
Single line comments use (#) for short comments and explanations while for multiple lines of comment or for longer explanations ("""/''') triple quotes are used.
### Code
```python
"""
This is multiple line comment section that would explain how a
Spotify Playlist Recommendation system might work.
Spotify might use user's listening activiy, recent plays, their top genre and top songs
to determine what to recommend.
"""
recent_genre="Jazz-Pop"
#stores user's recent or last listened genre
recent_genre_plays=7
#stores how many songs a user listened to
recommendation="Contemporary R&B"
print("Your last listened genre was",recent_genre)
print("Here's recommended",recommendation,"playlist for you")
```
### Output
```
Your last listened genre was Jazz-Pop
Here's recommended Contemporary R&B playlist for you
```
<br>
<br>

# Task 4
## Create variables for order_total, delivery_region, and discount_percent to represent a Zomato order. Follow Python naming conventions and print a sentence using all three variables, like 'Order from [region] totals ₹[order_total] with [discount_percent]% discount.'
### Code
```python
delivery_region="Satellite"
order_total=853
discount_percent=12
print(f"Zomato Order from {delivery_region} totals ₹{order_total} with {discount_percent}% discount.")
```
### Output
```
Zomato Order from Satellite totals ₹853 with 12% discount.
```
<br>
<br>

# Task 5
## Write a Python script that intentionally mixes tabs and spaces for indentation, then fix the script so it runs without errors.<br><br><em><strong>Hint:</strong> Use only spaces for indentation, as per Python's best practices.</em>
### Code
```python
x=10
   if x>5:
            print("Greater than")
```
### Output
```
    if x>5:
IndentationError: unexpected indent
```
### Fixed
```python
x=10
if x>5:
    print("Greater than 5")
```
### Output
```
Greater than 5
```
