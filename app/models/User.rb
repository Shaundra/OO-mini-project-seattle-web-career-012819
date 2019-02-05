# Build the following methods on the User class
#
# User.all should return all of the user instances
# User#recipes should return all of the recipes this user has recipe cards for
# User#add_recipe_card should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
# User#declare_allergen should accept an ingredient instance as an argument, and create a new allergen instance for this user and the given ingredient
# User#allergens should return all of the ingredients this user is allergic to
# User#top_three_recipes should return the top three highest rated recipes for this user.
# User#most_recent_recipe should return the recipe most recently added to the user's cookbook.


class User

  @@all_users = []

  def initialize(name)
    @name = name

    @@all_users << self
  end

  def self.all
    @@all_users
  end

  def recipes
    RecipeCard.all.each_with_object([]) { |rc, rec_arr| rec_arr << rc.recipe if rc.user == self }
  end

  def add_recipe_card(recipe, date, rating)
    new_recipe = RecipeCard.new(self, recipe, date)
    new_recipe.rating = rating
  end

  def declare_allergen(ingredient)
    Allergen.new(ingredient, self)
  end

  def allergens
    Allergen.all.each_with_object([]) { |allergy, a| a << allergy.ingredient if allergy.user == self }
  end

  def all_recipe_cards
    RecipeCard.all.select { |rc| rc.user == self }
  end

  def top_three_recipes
    sorted_recipe_cards = self.all_recipe_cards.sort_by { |rc| -rc.rating }
    sorted_recipe_cards.each_with_object([]) { |rc, a| a << rc.recipe }.first(3)
  end

  def most_recent_recipe
    self.all_recipe_cards.sort_by { |rc| rc.date }.last
  end

  def self_recipes
    # should return all recipes that do not contain ingredients the user is allergic to
    # all recipes and their ingredients
    rec_ingred = Recipe.all.each_with_object({}) { |rec, a| a[rec] = rec.ingredients }
    rec_ingred.select { |k, v| v - self.allergens == v }
  end
end
