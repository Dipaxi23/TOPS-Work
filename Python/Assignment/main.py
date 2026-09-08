from insta_utils import format_follower_count
sample_numbers=[850,1500,2300000]

print("--- Instagram Follower Count Formatter ---")
for count in sample_numbers:
    formatted = format_follower_count(count)
    print(f"Original: {count:<10} ➔ Formatted: {formatted}")