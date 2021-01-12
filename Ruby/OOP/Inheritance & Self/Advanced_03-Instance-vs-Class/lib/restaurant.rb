class Restaurant
  attr_reader :average_rating, :city

  def initialize(city, name)
    @city = city
    @name = name
    @number_of_ratings = 0
    @sum_of_ratings = 0
  end

  # TODO: implement .filter_by_city and #rate methods
  def self.filter_by_city(restaurants, city)
    restaurants.select do |restaurant|
      restaurant.city == city
    end
  end

  def rate(rating)
    @number_of_ratings += 1
    @sum_of_ratings += rating
    @average_rating =  @sum_of_ratings.to_f / @number_of_ratings
  end
end
