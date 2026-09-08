# Task 1
## Use open() in write mode to create a file called my_playlist.txt and write the names of 5 songs you listened to this week, each on a new line.
### Code
```python
songs= ["From The Start-Laufey",
    "Sweet Night-V",
    "Mikrokosmos-BTS",
    "LOSER-Tame Impala",
    "Easy-Troye Sivan"
]
with open("my_playlist.txt","w") as file:
    for song in songs:
        file.write(song+"\n")
print("my_playlist.txt has been successfully created!")
```
### Output
```
my_playlist.txt has been successfully created!
```
<br>
<br>

# Task 2
## Read the my_playlist.txt file you created and print each song name in uppercase using Python file handling.
### Code
```python
with open("my_playlist.txt","r") as file:
    for song in file:
        print(song.upper())
```
### Output
```
FROM THE START-LAUFEY

SWEET NIGHT-V

MIKROKOSMOS-BTS

LOSER-TAME IMPALA

EASY-TROYE SIVAN
```
<br>
<br>

# Task 3
## Download a sample CSV file of IPL cricket match scores (or create your own with columns: Match, Team1, Team2, Winner), then write Python code to read the CSV and print the name of the winning team for each match.
### Code
```python
import csv
filename = 'ipl_matches.csv'
try:
    with open(filename, mode='r', encoding='utf-8') as file:
        reader = csv.DictReader(file)
        print("--- IPL Match Winners ---")
        for row in reader:
            print(f"{row['Match']}: {row['Team1']} vs {row['Team2']} ➔ Winner: {row['Winner']}")   
except FileNotFoundError:
    print(f"Error: The file '{filename}' was not found. Please make sure it's in the same directory.")
```
### Output
```
--- IPL Match Winners ---
Match 1: Mumbai Indians vs Chennai Super Kings ➔ Winner: Mumbai Indians
Match 2: Royal Challengers Bengaluru vs Kolkata Knight Riders ➔ Winner: Kolkata Knight Riders
Match 3: Rajasthan Royals vs Sunrisers Hyderabad ➔ Winner: Rajasthan Royals
Match 4: Delhi Capitals vs Punjab Kings ➔ Winner: Punjab Kings
```
<br>
<br>

# Task 4
## Given a JSON file named user_profile.json containing details like username, followers, and bio (similar to an Instagram profile), use the json module to load the file and print the username and number of followers.
### Code
```python
import json
with open('user_profile.json', 'r') as file:
    profile_data = json.load(file)
username=profile_data.get('username')
followers=profile_data.get('followers')

print(f"Username: {username}")
print(f"Followers: {followers}")
```
### Output
```
Username: dee_official
Followers: 1250
```
<br>
<br>

# Task 5
## Use pathlib to check if a file called zomato_orders.json exists in your current directory, and print an appropriate message if it is found or not.<br><br><em><strong>Hint:</strong> Use Path('zomato_orders.json').exists() from the pathlib module.</em>
### Code
```python
from pathlib import Path
file_path=Path("zomato_orders.json")
if file_path.is_file():
    print(f"Found it! '{file_path.name}' exists in the current directory.")
else:
    print(f"Not found: '{file_path.name}' does not exist in the current directory.")
```
### Output
```
Not found: 'zomato_orders.json' does not exist in the current directory.
```
