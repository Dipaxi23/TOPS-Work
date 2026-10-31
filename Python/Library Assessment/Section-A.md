# SCENARIO 1
## You are building a delivery fee calculator for a food delivery platform. You have a NumPy array of 50,000 order distances (in km) and need to compute a delivery fee for every order simultaneously. A teammate suggests iterating over the array using a Python for-loop and appending results to a list.
### Question: Explain why NumPy vectorisation is a technically superior approach to the for-loop suggestion. In your answer, describe what broadcasting allows when a single scalar fee rate (e.g., Rs 5 per km) is applied to the entire array, and identify one scenario where a Python loop would still be necessary despite NumPy being available.
- Why vectorisation is better: A standard python loop goes through 50,000 order numbers one by one, which makes the computer do the math slowly. NumPy vectorisation processes all 50,000 numbers at the exact same time using built-in computer code, making it dramatically faster.
- What broadcasting does: Broadcasting allows us to take a single number like a flat delivery fee of Rs.30 and automatically apply it to all 50,000 order distances at once without us having to write extra code to repeat that number 50,000 times.
- When a loop is still necessary: We still need a loop if the math for our current order depends directly on the answer from the order before it (like a running total), because we cannot calculate the next step until the previous step is finished.
<br>
<br>

# SCENARIO 2
## You are working on a reporting pipeline for a food delivery platform. You have a Pandas DataFrame with columns: order_id, restaurant_name, city, order_value, delivery_time_mins, and rating. A colleague proposes filtering the DataFrame in a for-loop once per restaurant and computing averages manually inside the loop.
### Question: Explain why groupby() combined with agg() is the correct approach instead of the for-loop strategy. Describe the specific method chain you would write to compute average order value, average delivery time, and average rating per restaurant in a single operation, and explain what the resulting DataFrame's index represents after the operation.
- Why groupby() is correct: Instead of writing a loop to filter our data restaurant by restaurant, the groupby() function automatically groups all rows by restaurant name behind the scenes so we can calculate averages for all of them in one single command.
- The method chain:
```python
df.groupby('restaurant_name').agg({'order_value':'mean',
                                   'delivery_time_mins':'mean',
                                   'rating':'mean'})
```
- What the resulting index represents: The index of the final summary table represents the restaurant names. Instead of standard row numbers (0, 1, 2...), each row in our new table is labeled with the name of the restaurant.
<br>
<br>

# SCENARIO 3
## You are developing a monthly performance report for a food delivery startup. The report must present three pieces of information side by side: (a) total orders placed per month over a year, (b) the proportion of orders by cuisine type (Fast Food, Indian, Chinese, Desserts), and (c) the distribution of delivery times across all orders.
### Question: Identify the most appropriate Matplotlib chart type for each of the three metrics and justify each choice based on the nature of the data. Then explain how plt.subplots() would be configured to arrange all three charts in a single figure, and state whether a shared x-axis would or would not be appropriate for this layout — and why.
- Choosing the right chart types:
  - Total orders per month over a year: A Line Chart is used because it connects data points in order over time, making it easy to see upward or downward trends month by month.
  - Proportion of orders by cuisine type: A Pie Chart is used because it shows how 100% of our total orders are split up among different categories like Fast Food or Indian.
  - Distribution of delivery times: A Histogram is used because it groups delivery times into ranges (like 10 to 20 minutes) to show how many orders fall into each time bucket.
- Layout and Shared X-Axis: We use plt.subplots(1,3) to create three chart spaces side-by-side in one image. A shared x-axis is not appropriate here because each chart shows completely different information (months, food types, and minutes), so they do not share the same units or scale.
<br>
<br>

# SCENARIO 4
## You are optimising a Matplotlib line chart that shows daily order volume for a food delivery app over a 90-day period. The chart renders correctly but stakeholders keep asking 'which day had the spike?' during every review meeting. The spike is the single highest-value day in the array.
### Question: Describe how you would use plt.annotate() to programmatically identify and mark the maximum order day with an arrow pointing to the peak and a text label showing the day number and volume. Name at least two specific parameters you would pass to plt.annotate() and explain what each one controls in the rendered chart.
- How to use plt.annotate(): First find the specific day with the highest order number in our data. Then, you use plt.annotate() to draw an arrow pointing directly to that high point on the chart along with a text box.
- Key parameters to pass:
  - xy: Tells the function the exact position (the x and y coordinates) of the peak point where the tip of the arrow should touch.
  - xytext: Tells the function where the actual text words should be placed on the chart so they do not block the data point.
<br>
<br>

# SCENARIO 5
## You are designing a visual analysis of customer ratings for a food delivery app. Your dataset has 10,000 rows. Each row belongs to one of three restaurant categories (Fast Food, Fine Dining, Casual) and has a customer rating on a discrete 1–5 scale. Your manager wants to understand how ratings are distributed within each category and whether any category produces more extreme outliers.
### Question: Compare sns.boxplot() and sns.violinplot() for this specific task. Which would you recommend and why? Provide at least two data-specific reasons that reference properties of this dataset (10,000 rows, 3 categories, discrete 1–5 scale), and explain one situation where the other chart type would be preferable.
- Recommendation: Use sns.boxplot().
- Data-specific reasons:
  - Discrete 1–5 Scale: Customer ratings only use whole numbers (1,2,3,4,5). A boxplot uses clean lines and boxes that fit this type of step-by-step data well, whereas a violin plot tries to draw a smooth, curvy shape that looks awkward on whole-number ratings.
  - Outliers: Boxplots clearly show unusual high or low ratings as individual dots outside the box, which makes it easy to see if a category has extreme ratings.
- When a violin plot is preferable: A violin plot is better when we have smooth, continuous data (like exact delivery times in seconds or precise income amounts) where we want to see the exact shape of where most values cluster.
<br>
<br>

# SCENARIO 6
## You are building a feature analysis report for a food delivery platform's data science team before a regression model is trained. Your DataFrame contains eight numeric columns: order_value, distance_km, delivery_time_mins, rating, discount_applied, peak_hour_flag, restaurant_age_years, and driver_experience_years.
### Question: Explain how you would generate and interpret a Seaborn correlation heatmap to identify multicollinearity risks among these features. In your answer, describe what the colour scale in the heatmap represents, how to read a specific cell value, and what correlation magnitude threshold you would use to flag a potential multicollinearity problem — and why that threshold is conventionally chosen.
- What the colour scale represents: The colors show how closely two different data columns are related to each other. A strong positive color means when one column goes up, the other column reliably goes up too.
- How to read a cell: Find a feature name on the left side and match it with the same feature name at the top. The number in that matching box tells us how strongly those two specific features move together.
- Threshold and reasoning: Look for a high correlation number above 0.7 or 0.8. This threshold is chosen because a number that high means the two features are giving us almost the exact same information, which can confuse a prediction model, so we usually remove one of them.