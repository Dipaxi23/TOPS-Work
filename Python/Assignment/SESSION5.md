# Task 1
## Create a list called playlist_ids with 5 integers representing Spotify playlist IDs, then use append() to add a new playlist ID at the end and print the updated list.
### Code
```python
playlistID=[101,102,103,104]
print(playlistID)
playlistID.append(105)
print(playlistID)
```
### Output
```
[101, 102, 103, 104]
[101, 102, 103, 104, 105]
```
<br>
<br>

# Task 2
## Simulate a Flipkart shopping cart: start with a list cart_items containing 't-shirt', 'shoes'. Use extend() to add ['jeans', 'cap'] to the cart, then print the final list of items.
### Code
```python
cart_items=['t-shirt', 'shoes']
print(cart_items)
cart_items.extend(['jeans','cap'])
print(cart_items)
```
### Output
```
['t-shirt', 'shoes']
['t-shirt', 'shoes', 'jeans', 'cap']
```
<br>
<br>

# Task 3
## Write a function remove_last_item(order_list) that pops the last item from a Zomato order list and returns the removed item. Test it with a sample order_list.
### Code
```python
order_items=["Pizza","Pasta","Nachos","Cold Drinks"]

def remove_last_item(order_list):
    return order_list.pop()

cancelled=remove_last_item(order_items)
print("Cancelled item:",cancelled)
print("Remaing:",order_items)
```
### Output
```
Cancelled item: Cold Drinks
Remaing: ['Pizza', 'Pasta', 'Nachos']
```
<br>
<br>

# Task 4
## Create a tuple called insta_filters with 4 Instagram filter names. Try to update the second filter and observe what error you get. Explain in a comment why this happens.<br><br><em><strong>Hint:</strong> Tuples are immutable, so direct assignment won't work.</em>
### Code
```python
insta_filters = ("Natural", "CatFace", "Lavender", "Joker")
print(insta_filters)
insta_filters[1]="Bloom"
```
### Output
```
TypeError: 'tuple' object does not support item assignment
```
Explanation: Tuples are immutable. Meaning they cannot be changed or updated after they are created. Therefore "insta_filters[1]="Bloom"" causes typeerror.
<br>
<br>

# Task 5
## Given two scenarios — storing a user's favorite genres (which may change) and storing a fixed set of IRCTC train classes ('Sleeper', 'AC 3 Tier', 'AC 2 Tier') — choose whether to use a list or tuple for each. Write one sentence explaining your choice for both.
For storing a user's favourite genres using list is a right option because a user's prefences can change any time. If user wants to remove or add genres using list it is possible because lists are mutable. They can be changed. Meanwhile IRCTC train classes are fixed choice. They are constant and cannot be modified or changed.
