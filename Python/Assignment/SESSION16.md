# Task 1
## Use iter() and next() to manually loop through a list of 5 trending movies from BookMyShow and print each movie name one by one.
### Code
```python
trending_movies=[
    "Hanuman Ansh",
    "Spider-Man: Brand New Day",
    "Awarapan 2"
]
movie_iter=iter(trending_movies)

print(next(movie_iter))
print(next(movie_iter))
print(next(movie_iter))
```
### Output
```
Hanuman Ansh
Spider-Man: Brand New Day
Awarapan 2
```
<br>
<br>

# Task 2
## Create a playlist of 6 songs (as a list of strings) and use enumerate() to print each song with its position like Spotify's tracklist (e.g., '1. Kesariya').
### Code
```python
# List of 6 Jazz and R&B tracks
playlist = [
    "What's Going On - Marvin Gaye",
    "Take Five - Dave Brubeck",
    "Golden - Jill Scott",
    "Fly Me to the Moon - Frank Sinatra",
    "Best Part - H.E.R. & Daniel Caesar",
    "Get You - Daniel Caesar ft. Kali Uchis"
]
for index, song in enumerate(playlist, start=1):
    print(f"{index}. {song}")
```
### Output
```
1. What's Going On - Marvin Gaye
2. Take Five - Dave Brubeck
3. Golden - Jill Scott
4. Fly Me to the Moon - Frank Sinatra
5. Best Part - H.E.R. & Daniel Caesar
6. Get You - Daniel Caesar ft. Kali Uchis
```
<br>
<br>

# Task 3
## Given two lists — one of food items and one of prices — use zip() to print each food item with its price like a Zomato menu (e.g., 'Pizza - ₹250').
### Code
```python
food_items=["Pizza","Burger","Pasta","Fries"]
prices=[250,180,220,120]
print("--- Zomato Menu ---")
for food, price in zip(food_items, prices):
    print(f"{food} - Rs.{price}")
```
### Output
```
--- Zomato Menu ---
Pizza - Rs.250
Burger - Rs.180
Pasta - Rs.220
Fries - Rs.120
```
<br>
<br>

# Task 4
## Write a generator function called insta_posts_generator(posts) that takes a list of Instagram post captions and yields one caption at a time. Use next() to get and print the next post caption each time until all captions are printed.<br><br><em><strong>Hint:</strong> Use the yield keyword inside your function and handle StopIteration when all posts are done.</em>
### Code
```python
def insta_posts_generator(posts):
    for post in posts:
        yield post
captions=[
    "Enjoying the sunny weekend!",
    "Coffee and coding.",
    "Exploring new hiking trails.",
]

gen=insta_posts_generator(captions)
while True:
    try:
        print(next(gen))
    except StopIteration:
        print("\nAll posts have been displayed!")
        break
```
### Output
```
Enjoying the sunny weekend!
Coffee and coding.
Exploring new hiking trails.

All posts have been displayed!
```
<br>
<br>

# Task 5
## Build a generator function called cashback_generator(transactions) that takes a list of Paytm transaction amounts and yields 5% cashback for each transaction. Print out the cashback values for all transactions.
### Code
```python
def cashback_generator(transactions):
  for amount in transactions:
    yield amount*0.05

paytm=[100,250,500,1200]

print("Cashback amounts:")
for cashback in cashback_generator(paytm):
  print(f"Rs.{cashback:.2f}")
```
### Output
```
Cashback amounts:
Rs.5.00
Rs.12.50
Rs.25.00
Rs.60.00
```
