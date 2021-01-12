class MealsView
  def display(meals)
    meals.each do |meal|
      puts "#{meal.id}. #{meal.name} : #{meal.price}€"
    end
  end

  def ask_user_for(stuff)
    puts "#{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end
end
