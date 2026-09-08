# Task 1
## Create a Python class called Product with a private attribute _price. Initialize _price in the constructor and write a method to display its value.
### Code
```python
class Product:
    product_name="laptop"
    __price=47000

    def __init__(self):
        print("Price:",self.__price)
ob1=Product()
ob1.__init__
```
### Output
```
Price: 47000
```
<br>
<br>

# Task 2
## Add getter and setter methods for the _price attribute in your Product class to safely access and update the price. Make sure the setter prevents setting a negative price.<br><br><em><strong>Hint:</strong> Raise a ValueError if the new price is less than zero.</em>
### Code
```python
class Product:
    def __init__(self,name,price):
        self.name=name
        self.price=price 

    @property
    def price(self):
        return self._price

    @price.setter
    def price(self,new_price):
        if new_price<0:
            raise ValueError("Price cannot be negative.")
        self._price=new_price

item=Product("Laptop", 999.99)
print(item.price) 

item.price=849.99
print(item.price) 
try:
    item.price=-50.00
except ValueError as e:
    print(e)
```
### Output
```
999.99
849.99
Price cannot be negative.
```
<br>
<br>

# Task 3
## Build a class called Playlist that has a private attribute _songs (a list of song names). Write methods to add a song, remove a song, and get the current list of songs using proper encapsulation.
### Code
```python
class Playlist:
    def __init__(self):
        self._songs=[]

    def add_song(self,song_name):
        if song_name and song_name not in self._songs:
            self._songs.append(song_name)
            print(f"Added: '{song_name}'")
        else:
            print(f"'{song_name}' is already in the playlist or invalid.")

    def remove_song(self,song_name):
        if song_name in self._songs:
            self._songs.remove(song_name)
            print(f"Removed: '{song_name}'")
        else:
            print(f"'{song_name}' not found in the playlist.")

    def get_songs(self):
        return list(self._songs)

my_playlist=Playlist()
my_playlist.add_song("Bohemian Rhapsody")
my_playlist.add_song("Fly Me To The Moon")

print("Current Playlist:", my_playlist.get_songs())
my_playlist.remove_song("Fly Me To The Moon")
print("Current Playlist:", my_playlist.get_songs())
```
### Output
```
Added: 'Bohemian Rhapsody'
Added: 'Fly Me To The Moon'
Current Playlist: ['Bohemian Rhapsody', 'Fly Me To The Moon']
Removed: 'Fly Me To The Moon'
Current Playlist: ['Bohemian Rhapsody']
```
<br>
<br>

# Task 4
## Create an abstract class PaymentMethod with an abstract method pay(amount). Then, create two subclasses: UPI and CreditCard, each implementing the pay method with a print statement showing how the payment would be processed.<br><br><em><strong>Hint:</strong> Use the abc module for abstraction.</em>
### Code
```python
from abc import ABC, abstractmethod
class PaymentMethod(ABC):

  @abstractmethod
  def pay(self, amount):
    pass

class UPI(PaymentMethod):

  def pay(self,amount):
    print(
        f"Processing UPI payment of Rs.{amount} securely through your linked"
        " VPA."
    )

class CreditCard(PaymentMethod):

  def pay(self,amount):
    print(
        f"Processing Credit Card payment of Rs.{amount} by swiping/authorizing the"
        " card chip."
    )

if __name__=="__main__":
  methods = [UPI(), CreditCard()]
  for method in methods:
    method.pay(150.00)
```
### Output
```
Processing UPI payment of Rs.150.0 securely through your linked VPA.
Processing Credit Card payment of Rs.150.0 by swiping/authorizing the card chip.
```