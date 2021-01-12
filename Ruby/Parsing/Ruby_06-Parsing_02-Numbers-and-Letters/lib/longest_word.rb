#frozen_string_literal=true

require 'open-uri'
require 'json'

def generate_grid(grid_size)
  Array.new(grid_size) { ('A'..'Z').to_a.sample }
end

def run_game(attempt, grid, start_time, end_time)
  result = { time: end_time - start_time, score: 0 }
  if included?(attempt.upcase, grid)
    if valid_word?(attempt)
      result[:message] = 'Well Done!'
      result[:score] = attempt.length / result[:time]
    else
      result[:message] = 'not an english word'
    end
  else
    result[:message] = 'not in the grid'
  end
  result
end

def valid_word?(attempt)
  JSON.parse(open("https://wagon-dictionary.herokuapp.com/#{attempt}").read)['found']
end

def included?(attempt, grid)
  attempt.upcase.chars.all? { |char| attempt.count(char) <= grid.count(char) }
end
