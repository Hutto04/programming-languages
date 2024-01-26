# Step 2

# Sort name into alphabetical order
sorted_name = name.chars.sort_by(&:downcase).join
puts sorted_name

# Reverse your name
reversed_name = name.reverse
puts reversed_name

# Sort your name in reverse alphabetical order
reverse_sorted_name = name.chars.sort_by(&:downcase).reverse.join
puts reverse_sorted_name