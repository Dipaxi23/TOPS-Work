# Task 1
## Create a Python class called Product with a method get_discount() that returns 0. Write a subclass called Electronics that overrides get_discount() to return 10.
### Code
```python
class Product:

  def get_discount(self):
    return 0

class Electronics(Product):

  def get_discount(self):
    return 10
  
generic_item=Product()
print(f"Product discount: {generic_item.get_discount()}%")
laptop = Electronics()
print(f"Electronics discount: {laptop.get_discount()}%")
```
### Output
```
Product discount: 0%
Electronics discount: 10%
```
<br>
<br>

# Task 2
## Build a class FoodOrder with a method calculate_total() that returns the base price. Create a subclass ZomatoOrder that overrides calculate_total() to add a 5% delivery charge.
### Code
```python
class FoodOrder:

  def __init__(self,base_price):
    self.base_price=base_price

  def calculate_total(self):
    return self.base_price


class ZomatoOrder(FoodOrder):

  def calculate_total(self):
    return self.base_price*1.05

order=FoodOrder(500)
print(f"Base Order Total: Rs.{order.calculate_total()}")

zomato_order=ZomatoOrder(500)
print(f"Zomato Order Total (with 5% delivery): Rs.{zomato_order.calculate_total()}")
```
### Output
```
Base Order Total: Rs.500
Zomato Order Total (with 5% delivery): Rs.525.0
```
<br>
<br>

# Task 3
## Write a function show_bonus(employee) that takes any object with a bonus() method and prints the result. Test it with two classes: Influencer (bonus returns 2000) and BrandManager (bonus returns 5000), demonstrating polymorphism.
### Code
```python
def show_bonus(employee):
    print(employee.bonus())

class Influencer:
    def bonus(self):
        return 2000

class BrandManager:
    def bonus(self):
        return 5000

if __name__=="__main__":
    influencer_obj=Influencer()
    manager_obj=BrandManager()

    print("Influencer Bonus:")
    show_bonus(influencer_obj) 

    print("Brand Manager Bonus:")
    show_bonus(manager_obj)  
```
### Output
```
Influencer Bonus:
2000
Brand Manager Bonus:
5000
```
<br>
<br>

# Task 4
## Given this code: class User: def get_status(self): return 'active' class PremiumUser(User): pass. Update PremiumUser to override get_status() so it returns 'premium'. Then, create one User and one PremiumUser and print their statuses.<br><br><em><strong>Hint:</strong> Use the same method name in both classes to override.</em>
### Code
```python
class User:
    def get_status(self):
        return 'active'

class PremiumUser(User):
    def get_status(self):
        return 'premium'

regular_user=User()
vip_user=PremiumUser()

print(regular_user.get_status())
print(vip_user.get_status())
```
### Output
```
active
premium
```