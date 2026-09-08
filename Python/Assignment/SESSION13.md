# Task 1
## Write a recursive function in Python called reverse_string(s) that takes a string and returns it reversed (e.g., 'hello' becomes 'olleh').
### Code
```python
def reverse_string(s):
  if len(s) <= 1:
    return s
  return reverse_string(s[1:])+s[0]
print(reverse_string("hello"))
```
### Output
```
olleh
```
<br>
<br>

# Task 2
## Build a recursive function sum_playlist_durations(durations) that takes a list of song durations (in seconds) and returns the total duration, similar to how Spotify totals a playlist.
### Code
```python
def sum_durations(durations):
  if not durations:
    return 0
  return durations[0]+sum_durations(durations[1:])

playlist=[210,180,240]
total_seconds=sum_durations(playlist)
print(f"Total playlist duration: {total_seconds} seconds")
```
### Output
```
Total playlist duration: 630 seconds
```
<br>
<br>

# Task 3
## Given the following code, identify whether the variable 'count' is local or global in each function, and explain what will be printed when run:
```
count = 10
def update_count():
count = 5
print('Inside:', count)
update_count()
print('Outside:', count)
```
### Output
```
Inside: 5
Outside: 10
```
Count initial value is 10. When update_count function is created a new value is assigned to count and in the same print function is called so it takes count value as 5. When the function is called any value assigned inside the function is printed. while simple print without a function print 10 as count value because we did not update the value and it simply print the intital value. Therefore, 'count' variable inside the fuction is local variable which can be accessed only if the function is called and 'count' variable outside the fucntion is a global variable that can be accesses anywhere in the code.
<br>
<br>

# Task 4
## Create a recursive function count_likes(posts) that takes a nested dictionary representing Instagram posts and their replies (each with a 'likes' key), and returns the total number of likes across all posts and replies.<br><br><em><strong>Hint:</strong> Each reply can itself have more replies, so use recursion to sum likes at all levels.</em>
### Code
```python
def count_likes(data):
    total=0
    if isinstance(data, dict):
        total+=data.get('likes',0)
        if 'replies' in data:
            total+=count_likes(data['replies'])
    elif isinstance(data, list):
        for item in data:
            total+=count_likes(item) 
    return total

feed=[{"id":1,"likes":10,"replies":[{"likes":2},{"likes":3}]},
        {"post_id":2,"likes":20,"replies":[{"likes":5,"replies":[{"likes":1}]}]}
        ]
print("Total likes across all posts:", count_likes(feed))
```
### Output
```
Total likes across all posts: 41
```
<br>
<br>

# Task 5
## Write a Python script that demonstrates the lifetime of a local variable inside a function versus a global variable by printing their values before, during, and after a function call. Use variable names similar to 'user_status' and 'app_status', inspired by WhatsApp online/offline status.
### Code
```python
app_status="Running"

def update_user_session():
    user_status="Online"
    print(f"-> [During] app_status (Global): {app_status}")
    print(f"-> [During] user_status (Local): {user_status}")

print("=== 1. BEFORE FUNCTION CALL ===")
print(f"app_status (Global): {app_status}")
print("user_status (Local): Does not exist yet!\n")

print("=== 2. DURING FUNCTION CALL ===")
update_user_session()
print()

print("=== 3. AFTER FUNCTION CALL ===")
print(f"app_status (Global): {app_status} (Still exists)")

try:
    print(f"user_status (Local): {user_status}")
except NameError:
    print("user_status (Local): NameError! The local variable was destroyed when the function finished.")
```
### Output
```
=== 1. BEFORE FUNCTION CALL ===
app_status (Global): Running
user_status (Local): Does not exist yet!

=== 2. DURING FUNCTION CALL ===
-> [During] app_status (Global): Running
-> [During] user_status (Local): Online

=== 3. AFTER FUNCTION CALL ===
app_status (Global): Running (Still exists)
user_status (Local): NameError! The local variable was destroyed when the function finished.\
```