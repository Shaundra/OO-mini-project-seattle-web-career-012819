# Recipe
# Build the following methods on the Recipe class
#
# Recipe.all should return all of the recipe instances
# Recipe.most_popular should return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
# Recipe#users should return the user instances who have recipe cards with this recipe
# Recipe#ingredients should return all of the ingredients in this recipe
# Recipe#allergens should return all of the ingredients in this recipe that are allergens
# Recipe#add_ingredients should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe

class Recipe
  attr_accessor :name

  @@all_recipes = []

  def initialize(name)
    @name = name
    @@all_recipes << self
  end

  def self.all
    @@all_recipes
  end

  def self.most_popular
    #
    self.all.each_with_object({}) { |a, new_hash| new_hash[a] = a.users.size }
        .max_by {|k,v| v }[0]
  end

  def users
    # Select all users from RecipeCard instances with recipe == self
    RecipeCard.all.each_with_object([]) { |rc, user_arr| user_arr << rc.user if rc.recipe == self }
  end

  def ingredients
    # Select all RecipeIngredient instances with recipe == self
    RecipeIngredient.all.each_with_object([]) { |ri, a| a << ri.ingredient if ri.recipe == self }
  end

  def allergens
    self.ingredients.select { |ingred| Allergen.is_allergen?(ingred) }
  end

  def add_ingredients(arr)
    arr.each { |ingred| RecipeIngredient.new(self, ingred) }
  end
end
