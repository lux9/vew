# Define the horses
horses = ["Joe the Brave", "Black Stalion", "Ronny the Rat", "Tony Macaroni"]

# Define the initial user balance
balance = 100

# Display a welcome message
puts "Welcome to the horse race!"
puts "--------------------------"

# Start the loop
# Condition to loop: the user has at least 10 in his balance
while balance >= 10

  # Display the names of the horses that are running, with a number starting from 1
  puts "---------------------"
  puts "Today our horses are:"
  horses.each_with_index do |horse, index|
    puts "#{index + 1} - #{horse}"
  end

  # Ask the user which horse he wants to bet on
  puts "Which horse do you want to bet on?"
  print "> "

  # Shift the user choice by -1 to get his horse index
  user_horse_index = gets.chomp.to_i - 1

  # Display the name of the horse that the user bet on
  puts "You chose: #{horses[user_horse_index]}"

  # Run the race: randomly select the winner horse index
  winner_horse_index = rand(0...horses.length)

  # Compute the result: compare the index of the horse of the user with the winner horse index
  if user_horse_index == winner_horse_index

    # If the user won, add 50 to his balance and display the winning message
    balance += 50
    puts "You won! Your balance is now #{balance}€"
  else

    # If the user lost, substract 10 to his balance and display the losing message
    balance -= 10
    puts "You lost! The winner was #{horses[winner_horse_index]} Your balance is now #{balance}€"
  end
end

# Display an exit message
puts "-----------------------------------------"
puts "Thank you for playing! See you next time!"
