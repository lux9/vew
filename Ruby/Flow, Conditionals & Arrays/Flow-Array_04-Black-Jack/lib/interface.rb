require_relative "croupier"

puts "*** WELCOME TO OUR FANCY BLACKJACK ***"


bank_score = pick_bank_score

player_score = 0
running = true

while running

  puts "Card? 'y' or 'yes' to get a new card"

  player_answer = gets.chomp

  if %w[y yes].include?(player_answer)

    player_score += pick_player_card

    puts state_of_the_game(player_score, bank_score)
    running = player_score < 21
  else
    running = false
  end

end

puts end_game_message(player_score, bank_score)
