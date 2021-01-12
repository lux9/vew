class Animal
  def name(name)
    @name = name
    return self
  end

  def species(species)
    @species = species
    return self
  end

  def color(color)
    @color = color
    return self
  end

  def natural_habitat(natural_habitat)
    @natural_habitat = natural_habitat
    return self
  end

  def to_s
    "Name: #{@name}, Species: #{@species}, Color: #{@color}, Natural Habitat: #{@natural_habitat}"
  end
end
