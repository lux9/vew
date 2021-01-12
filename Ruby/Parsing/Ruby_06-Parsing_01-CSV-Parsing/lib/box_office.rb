require 'csv'

def most_successful(number, max_year, file_path)
  all_movies = load_movies(file_path, max_year)
  # movies.max_by(number) { |movie| movie[:earnings] }
  all_movies.sort_by { |movie| -movie[:earnings] }.take(number)
end

def load_movies(file_path, max_year)
  movies = []
  CSV.foreach(file_path) do |row|
    movies << { name: row[0], year: row[1].to_i, earnings: row[2].to_i } if row[1].to_i < max_year
  end
  movies
end
