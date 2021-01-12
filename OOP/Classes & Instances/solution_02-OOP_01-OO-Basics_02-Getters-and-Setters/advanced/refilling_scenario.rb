require_relative "vending_machine"

# We instantiate an **empty** vending machine selling 2.5 euros snacks.
vending_machine = VendingMachine.new(250, 0)
puts "Vending machine ready!"
puts vending_machine.display

# A technician comes and refill the vending machine with 20 snacks.
puts "Technician filling machine with 20 snacks"
vending_machine.refill(20)
puts vending_machine.display

# It's better because it is "encapsulation-compliant"

# Writing a public method to refill the machines gives you
# control on the values that can be stored in @snack_count
# (here we forbid negative or null refill values for instance).

# Exposing @snack_count with a writer makes you lose all control
# on the values that can be stored in it.

# Enabling negative values in @snack_count would be a bug in your API,
# because it makes no sense in real life!

# Now, there's no risk for developers using your class to encounter this bug!
