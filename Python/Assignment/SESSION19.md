# Task 1
## Define a Python class called Song with attributes title, artist, and duration (in seconds), and use the __init__() constructor to initialize these values when creating an object.
### Code
```python
class Song:
    def __init__(self,title,artist,duration):
        self.title=title
        self.artist=artist
        self.duration=duration 
my_song = Song("Bohemian Rhapsody","Queen",354)

print(f"Title: {my_song.title}")
print(f"Artist: {my_song.artist}")
print(f"Duration: {my_song.duration} seconds")
```
### Output
```
Title: Bohemian Rhapsody
Artist: Queen
Duration: 354 seconds
```
<br>
<br>

# Task 2
## Create an object of the Song class for your favorite track from Spotify, and print out its title and artist using object attributes.
### Code
```python
class Song:

  def __init__(self,title,artist):
    self.title=title
    self.artist=artist
my_favorite_song=Song(title="Like The Movies", artist="Laufey")

print(f"Song Title: {my_favorite_song.title}")
print(f"Artist: {my_favorite_song.artist}")
```
### Output
```
Song Title: Like The Movies
Artist: Laufey
```
<br>
<br>

# Task 3
## Add a method play_preview(self) to your Song class that prints 'Playing 30-second preview of [title] by [artist]'. Call this method for your Song object.
### Code
```python
class Song:
    def __init__(self,title,artist):
        self.title=title
        self.artist=artist

    def play_preview(self):
        print(f"Playing 30-second preview of {self.title} by {self.artist}")
my_song= Song("Bohemian Rhapsody","Queen")
my_song.play_preview()
```
### Output
```
Playing 30-second preview of Bohemian Rhapsody by Queen
```
<br>
<br>

# Task 4
## Create a class called FoodOrder with attributes restaurant_name, items (a list), and total_price. Add a method add_item(self, item, price) that adds the item to the items list and updates total_price. Demonstrate by creating a FoodOrder object and adding two items like you would on Zomato.
### Code
```python
class FoodOrder:
    def __init__(self,restaurant_name):
        self.restaurant_name=restaurant_name
        self.items=[]
        self.total_price=0.0

    def add_item(self,item,price):
        self.items.append(item)
        self.total_price+= price
        print(f"Added {item} (Rs.{price}) to your order.")

my_order=FoodOrder("Honest")

my_order.add_item("Pav Bhaji", 320.0)
my_order.add_item("Veg. Biryani", 245.0)

print("\n--- Order Summary ---")
print(f"Restaurant: {my_order.restaurant_name}")
print(f"Items: {my_order.items}")
print(f"Total Price: Rs.{my_order.total_price}")
```
### Output
```
Added Pav Bhaji (Rs.320.0) to your order.
Added Veg. Biryani (Rs.245.0) to your order.

--- Order Summary ---
Restaurant: Honest
Items: ['Pav Bhaji', 'Veg. Biryani']
Total Price: Rs.565.0
```
<br>
<br>

# Task 5
## Refactor your Song class so that it also tracks a play_count attribute (starting at 0), and add a method increment_play_count(self) that increases play_count by 1 each time it's called. Show how you would use this to count how many times a user plays a song.<br><br><em><strong>Hint:</strong> Call increment_play_count() multiple times and print play_count to see the update.</em>
### Code
```python
class Song:

  def __init__(self,title,artist):
    self.title=title
    self.artist=artist
    self.play_count=0

  def increment_play_count(self):
    self.play_count+= 1

my_song = Song("From The Start", "Laufey")
print(f"Initial play count: {my_song.play_count}")

my_song.increment_play_count()
my_song.increment_play_count()
my_song.increment_play_count()

print(f"Play count after listening: {my_song.play_count}")
```
### Output
```
Initial play count: 0
Play count after listening: 3
```
