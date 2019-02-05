require_relative '../config/environment.rb'


nneka = User.new("Nneka")
obinna = User.new("Obinna")
kesha = User.new("Kesha")
corey = User.new("Corey")
lamont = User.new("Lamont")

roast_chicken = Recipe.new("Roast Chicken with Spring Vegetables")
mac_cheese = Recipe.new("Macaroni & Cheese")
tom_kha = Recipe.new("Tom Kha Gai")
toast = Recipe.new("Buttered Toast")
lentil_soup = Recipe.new("Lentil Soup")
pep_pizza = Recipe.new("Pepperoni Pizza")

nneka_chicken = RecipeCard.new(nneka, roast_chicken, Date.today - 7, 5)
obinna_chicken = RecipeCard.new(obinna, roast_chicken)
nneka_mac = RecipeCard.new(nneka, mac_cheese, Date.today - 14, 2)
kesha_tom = RecipeCard.new(kesha, tom_kha)
obinna_toast = RecipeCard.new(obinna, toast)
lamont_toast = RecipeCard.new(lamont, toast)
nneka_toast = RecipeCard.new(nneka, toast, Date.today, 1)
nneka_pizza = RecipeCard.new(nneka, pep_pizza, Date.today, 5)

onion = Ingredient.new("onion")
butter = Ingredient.new("butter")

Ingredient.add_ingredient_by_list(%w(chicken lemon radish carrot onion olive_oil))
Ingredient.add_ingredient_by_list(%w(macaroni butter cheese))
Ingredient.add_ingredient_by_list(%w(coconut_milk mushroom galangal lemongrass onion chili lime cilantro))
Ingredient.add_ingredient_by_list(%w(bread butter))

roast_chicken.add_ingredients(Ingredient.find_ingredient_by_list(%w(chicken lemon radish carrot onion olive_oil)))
mac_cheese.add_ingredients(Ingredient.find_ingredient_by_list(%w(macaroni butter cheese)))
tom_kha.add_ingredients(Ingredient.find_ingredient_by_list(%w(coconut_milk mushroom galangal lemongrass onion chili lime cilantro)))
toast.add_ingredients(Ingredient.find_ingredient_by_list(%w(bread butter)))

kesha.add_recipe_card(mac_cheese, Date.today, 2)

nneka_onion_allergy = nneka.declare_allergen(onion)
nneka_butter_allergy = nneka.declare_allergen(butter)
lamont_onion_allergy = lamont.declare_allergen(onion)

binding.pry
