
# Ingredient
# Build the following methods on the Ingredient class
#
# Ingredient.all should return all of the ingredient instances
# Ingredient.most_common_allergen should return the ingredient instance that the highest number of users are allergic to

class Ingredient
  attr_accessor :name
  @@all_ingredients = []

  def initialize(name)
    @name = name
    @@all_ingredients << self
  end

  def self.all
    @@all_ingredients
  end

  def self.most_common_allergen
    grouped_ingreds = Allergen.all.group_by { |allergy| allergy.ingredient }
    grouped_ingreds.max_by { |ingred, users| users.length }[0]
  end

  def self.add_ingredient_by_list(arr)
    arr.map { |ingred| Ingredient.new(ingred) if !(Ingredient.find_ingredient_by_name(ingred)) }
  end

  def self.find_ingredient_by_name(name)
    Ingredient.all.select { |ingred| ingred.name == name }[0]
  end

  def self.find_ingredient_by_list(arr)
    arr.each_with_object([]) do |ingred, ingred_arr|
      ingred_arr << Ingredient.find_ingredient_by_name(ingred)
    end
  end
end
