# Mini Numpy Case Study
- Create a NumPy array named prices with these values: [299, 499, 799, 0, 1599, -1, 899]. Print the array and its data type.
- Some entries in the prices array are invalid (0 or negative). Replace all values less than or equal to zero with the average of the remaining positive prices.<br><em><strong>Hint:</strong> Use boolean indexing and the mean() function.</em>
- Suppose you have a NumPy array quantities = [2, 1, 3, 4, 2, 1, 5]. Calculate the total bill for each item by multiplying the cleaned prices array with quantities, and print the resulting array.
- Generate and print a summary report: show the minimum, maximum, average, and total of the cleaned prices array, and also the total bill for all items combined.<br><em><strong>Hint:</strong> Use NumPy functions like min(), max(), mean(), and sum().</em>
### Code
```python
import numpy as np
prices=np.array([299,499,799,0,1599,-1,899])
print("1. Prices:", prices)
print("Data Type:", prices.dtype)

positive_mean=prices[prices>0].mean()
cleaned_prices=np.where(prices<=0, positive_mean, prices)
print("\n2. Cleaned Prices:", cleaned_prices)

quantities=np.array([2,1,3,4,2,1,5])
total_bill_per_item=cleaned_prices*quantities
print("\n3. Total Bill per Item:", total_bill_per_item)

print("\n4. Summary Report:")
print(f"- Minimum Price : {cleaned_prices.min():.2f}")
print(f"- Maximum Price : {cleaned_prices.max():.2f}")
print(f"- Average Price : {cleaned_prices.mean():.2f}")
print(f"- Total of Prices: {cleaned_prices.sum():.2f}")
print(f"- Grand Total Bill: {total_bill_per_item.sum():.2f}")
```
### Output
```
1. Prices: [ 299  499  799    0 1599   -1  899]
Data Type: int64

2. Cleaned Prices: [ 299.  499.  799.  819. 1599.  819.  899.]

3. Total Bill per Item: [ 598.  499. 2397. 3276. 3198.  819. 4495.]

4. Summary Report:
- Minimum Price : 299.00
- Maximum Price : 1599.00
- Average Price : 819.00
- Total of Prices: 5733.00
- Grand Total Bill: 15282.00
```
- Use ChatGPT or Copilot to suggest a NumPy function or method that can help you find out how many unique price values are present in your cleaned prices array. Try the suggested method and print the result.
ChatGPT suggested np.unique() function. By passing the array into np.unique() and also by using the .size attribute on the result we can get the count.
### Code
```python
unique_count=np.size(np.unique(cleaned_prices))
print("Number of unique prices:", unique_count)
```
### Output
```
Number of unique prices: 6
```
