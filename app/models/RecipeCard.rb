# RecipeCard
# A RecipeCard is the join between a user instance and a recipe instance. This is a has-many-through relationship. Build the following methods on the RecipeCard class:
#
# RecipeCard.all should return all of the RecipeCard instances
# RecipeCard#date should return the date of the entry
# RecipeCard#rating should return the rating (an integer) a user has given their entry
# RecipeCard#user should return the user to which the entry belongs
# RecipeCard#recipe should return the recipe to which the entry belongs

class RecipeCard
  attr_accessor :date, :rating, :user, :recipe

  @@all_recipe_cards = []

  def initialize(user, recipe, date=Date.today, rating=nil)
    @user = user
    @recipe = recipe
    @date = date
    @rating = rating
    @@all_recipe_cards << self
  end

  def self.all
    @@all_recipe_cards
  end
end
