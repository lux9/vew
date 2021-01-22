require_relative "calculator.rb"
# TODO: you can build your calculator program here!

# initialization with dummy value so that we enter the while loop
answer = "y"

until answer == "n"
  puts "What is your first number?"
  first_num = gets.chomp.to_i

  puts "What is your second number?"
  second_num = gets.chomp.to_i

  puts "What is your operator?"
  operator = gets.chomp

  result = calculate(first_num, second_num, operator)

  if result.nil?
    puts "You messed up!"
  else
    puts "Your result is #{result}"
  end

  puts "Do you want to calculate again? [y|n]"
  answer = gets.chomp
end
