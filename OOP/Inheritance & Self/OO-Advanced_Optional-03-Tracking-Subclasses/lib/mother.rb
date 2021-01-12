class Mother
  @subclasses = []

  def self.inherited(subclass)
    @subclasses << subclass
  end

  def self.phone_kids
    @subclasses.each(&:phone)
  end
end

# Daughter and Son are classes inheriting from Mother. They are defined
# in the specs, no need to create them.
