require_relative "vending_machine"

# We instantiate a new vending machine selling 2.5 euros snacks. In the beginning
# this machine has a stock of 10 snacks.
vending_machine = VendingMachine.new(250, 10)
puts "Vending machine ready!"
puts vending_machine.display

# A client comes and inserts some coins
puts "Inserting 2€"
vending_machine.insert_coin(200)
puts vending_machine.display

3.times do
  puts "Inserting 0.2€"
  vending_machine.insert_coin(20)
  puts vending_machine.display
end

# Then the client pushes the Buy snack button
puts "Pushing 'Buy Snack' button"
vending_machine.buy_snack
puts vending_machine.display

# Then the client pushes the Buy snack button again (but forgot to insert some more coins!)
puts "Pushing 'Buy Snack' button"
vending_machine.buy_snack
puts vending_machine.display
