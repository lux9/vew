# My hash of items and their respective price
store_items = { "milk" => 1, "bread" => 3, "cheese" => 2, "eggs" => 4 }

puts "Welcome to the shop!"

# Create an empy cart for the user
shopping_cart = []

# List the available items
puts "Today's available items:"
store_items.each do |item, price|
  puts "#{item}, #{price}€"
end

# Add things to the cart array until user wants to checkout
new_item = nil
until new_item == "checkout"
  puts ""
  puts "What do you want to buy? enter checkout to exit..."
  new_item = gets.chomp
  if store_items.key?(new_item)
    shopping_cart << new_item
    puts "You have #{shopping_cart.join(', ')} in your cart"
  else
    puts "Item not available"
  end
end

# Easy list of items in the cart using the join method
puts "Thank you for shopping at Rewe"
puts "You have #{shopping_cart.join(', ')} in your cart"

# Calculating the price of the items in the cart
total_price = 0
shopping_cart.each do |item|
  total_price += store_items[item]
end

# Displaying the total price to pay for the items in the cart
puts "You need to pay: #{total_price}€"
