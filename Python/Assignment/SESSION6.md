# Task 1
## Create a Python dictionary called playlist_prices with at least 5 key-value pairs where the key is a Spotify playlist name (as a string) and the value is the playlist's price (as an integer). Print the dictionary.
### Code
```python
playlist_prices={"Pop":1200,"Jazz":3000,"R&B":2700,"Mix":2000}
print(playlist_prices)
```
### Output
```
{'Pop': 1200, 'Jazz': 3000, 'R&B': 2700, 'Mix': 2000}
```
<br>
<br>

# Task 2
##  Write a function update_playlist_price(playlist, new_price) that updates the price of a given playlist in the playlist_prices dictionary. Test it by updating the price of any one playlist and printing the updated dictionary.
### Code
```python
playlist_prices={"Pop":1200,"Jazz":3000,"R&B":2700,"Mix":2000}
print(playlist_prices)
def update_playlist_price(playlist,new_price):
    playlist_prices[playlist]=new_price
update_playlist_price("Jazz",3200)
print(playlist_prices)
```
### Output
```
{'Pop': 1200, 'Jazz': 3000, 'R&B': 2700, 'Mix': 2000}
{'Pop': 1200, 'Jazz': 3200, 'R&B': 2700, 'Mix': 2000}
```
<br>
<br>

# Task 3
## Remove a playlist from the playlist_prices dictionary using the del statement. Print the dictionary after deletion to confirm the change.
### Code
```python
playlist_prices={"Pop":1200,"Jazz":3000,"R&B":2700,"Mix":2000}
print(playlist_prices)
del playlist_prices["R&B"]
print(playlist_prices)
```
### Output
```
{'Pop': 1200, 'Jazz': 3000, 'R&B': 2700, 'Mix': 2000}
{'Pop': 1200, 'Jazz': 3000, 'Mix': 2000}
```
<br>
<br>

# Task 4
## Given two sets: set1 contains the names of restaurants you have ordered from on Zomato, and set2 contains the names of restaurants you have ordered from on Swiggy, find and print the union and intersection of these sets.<br><br><em><strong>Hint:</strong> Use the union() and intersection() methods of Python sets.</em>
### Code
```python
set1={"Chillis","Bon Homie","@Mango","Tim Tim"}
set2 = {"Tim Tim","Pizza Hut","Chillis","Subway"}
restaurants=set1.union(set2)
print("Union:",restaurants)
common=set1.intersection(set2)
print("Intersection:",common)
```
### Output
```
Union: {'Chillis', 'Pizza Hut', 'Tim Tim', '@Mango', 'Bon Homie', 'Subway'}
Intersection: {'Tim Tim', 'Chillis'}
```