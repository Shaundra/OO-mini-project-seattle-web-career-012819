# Allergen
# An Allergen is a join between a user and an ingredient. This is a has-many-through relationship. What methods should an instance of this model respond to?
#
# Allergen.all should return all of the Allergen instances

class Allergen
  attr_accessor :ingredient, :user

  @@all_allergens = []

  def initialize(ingredient, user)
    @ingredient = ingredient
    @user = user

    @@all_allergens << self
  end

  def self.all
    @@all_allergens
  end

  def self.is_allergen?(ingred)
    self.all.any? { |allergy| allergy.ingredient == ingred }
  end
end
