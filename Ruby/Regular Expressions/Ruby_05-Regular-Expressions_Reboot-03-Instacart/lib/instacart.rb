def add_to_cart(cart, product, product_qty)
  if cart.key?(product)
    cart[product] = cart[product] + (store_items[product]['price'] * product_qty)
  else
    cart[product] = store_items[product]['price'] * product_qty
  end
end

def cart_to_s(cart)
  cart_items = []
  cart.each_pair do |key, value|
    if value != store_items[key]['price']
      item_amount = value / store_items[key]['price']
    else
      item_amount = 1
    end
    cart_items << "#{key}: #{item_amount} x #{store_items[key]['price']}€ = #{value}€"
  end
  cart_items.join("\n")
end

def cart_total_price(cart)
  total_price = 0
  cart.each_value do |elem|
    total_price += elem
  end
  total_price
end

def product_in_store?(product)
  store_items.key?(product)
end

def store_items
  store = {
    "kiwi" => {'price' => 1.25, "quantity" => 5},
    "banana" => {'price' => 0.5, "quantity" => 4},
    "mango" => {'price' => 4, "quantity" => 1},
    "asparagus" => {'price' => 9, "quantity" => 5}
  }
  store
end

def store_items_to_s
  items = []
  store_items.each do |key, value|
    items << "> #{key}: #{value['price']}€ (#{value["quantity"]} available)"
  end
  items.join("\n")
end
# 1. Print Welcomes
puts "> -----------------"
puts "> Welcome to Instacart"
puts "> -----------------"
# 2. Define your store (what items are for sale?)
puts "In our store today:"
puts store_items_to_s
puts "> -----------------"
cart = {}

store = {
  "kiwi" => {'price' => 1.25, "quantity" => 5},
  "banana" => {'price' => 0.5, "quantity" => 4},
  "mango" => {'price' => 4, "quantity" => 1},
  "asparagus" => {'price' => 9, "quantity" => 5}
}

loop do
  # 3. Get items from the user (shopping)
  puts "Which item? (or 'quit' to checkout)"
  product = gets.chomp.downcase
  break if product == "quit"
  if product_in_store?(product)
    puts "How many?"
    product_qty = gets.chomp.to_i
    if store[product]["quantity"] > 0 && product_qty <= store[product]["quantity"]
      add_to_cart(cart, product, product_qty)
      store[product]["quantity"] = store[product]["quantity"] - product_qty
    else
      puts "Sorry we only have #{store_items[product]["quantity"]} of that!"
    end
  else
    puts "Sorry, we don't have #{product} today.."
  end
end
# 4. Print the bill (checkout)
puts "> -------BILL---------"
puts cart_to_s(cart)
total = cart_total_price(cart, store_items)
puts "TOTAL: #{total}€"
puts "> --------------------"



