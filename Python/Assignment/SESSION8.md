# Task 1
## Create a Python list called order_amounts with the values [120, 250, 90, 310, 150]. Use a for loop to calculate and print the total order value.
### Code
```python
order_amount=[120, 250, 90, 310, 150]
amt=0
for amount in order_amount:
    amt=amt+amount
print("Total Order Value: ",amt)
```
### Output
```
Total Order Value:  920
```
<br>
<br>

# Task 2
## Given a list of cricket scores [45, 78, 102, 34, 67, 89], use a while loop to print each score until you reach a score above 100, then stop printing.
### Code
```python
scores=[45, 78, 102, 34, 67, 89]
start=0
while scores[start]<=100:
    print(scores[start])
    start+=1
```
### Output
```
45
78
```
<br>
<br>

# Task 3
## Simulate a Flipkart cart with a list of item prices [299, 499, 199, 999, 149]. Use a for loop and the continue statement to skip any item priced below 200, and print the total of the remaining items.
### Code
```python
prices=[299, 499, 199, 999, 149]
total=0
for price in prices:
    if price<200:
        continue
    total+=price
print(total)
```
### Output
```
1797
```
<br>
<br>

# Task 4
## You have a list of favorite song names: ['Kesariya', 'Believer', 'Shape of You', 'Blinding Lights', 'Excuses']. Use the enumerate() function in a for loop to print each song with its playlist position (starting from 1).
### Code
```python
songs=['Kesariya', 'Believer', 'Shape of You', 'Blinding Lights', 'Excuses']
for position,name in enumerate(songs, start=1):
    print(f"{position}: {name}")
```
### Output
```
1: Kesariya
2: Believer
3: Shape of You
4: Blinding Lights
5: Excuses
```
<br>
<br>

# Task 5
## Write a for loop that goes through a list of Instagram follower counts [120, 1500, 23000, 800, 45000] and prints 'Micro', 'Influencer', or 'Celebrity' for each, based on the following: Micro (<1000), Influencer (1000-10000), Celebrity (>10000).<br><br><em><strong>Hint:</strong> Use if-elif-else inside the loop to check the follower count range.</em>
### Code
```python
followers=[120, 1500, 23000, 800, 45000]
for follower in followers:
    if follower<1000:
        print(f"{follower}: Micro")
    elif follower<=10000:
        print(f"{follower}: Influencer")
    else:
        print(f"{follower}: Celebrity")   
```
### Output
```
120: Micro
1500: Influencer
23000: Celebrity
800: Micro
45000: Celebrity
```