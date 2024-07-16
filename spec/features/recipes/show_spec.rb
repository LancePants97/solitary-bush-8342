require "rails_helper"

RSpec.describe "the recipes show page" do
  before(:each) do
    @ingredient1 = Ingredient.create!(name: "Salt", cost: 2)
    @ingredient2 = Ingredient.create!(name: "Pepper", cost: 3)
    @ingredient3 = Ingredient.create!(name: "Olive Oil", cost: 5)
    
    @recipe1 = Recipe.create!(name: "Salted Olive Oil", complexity: 2, genre: "Cooking")
    @recipe2 = Recipe.create!(name: "Salt and Pepper", complexity: 1, genre: "Seasoning")
    
    RecipeIngredient.create!(recipe: @recipe1, ingredient: @ingredient1)
    RecipeIngredient.create!(recipe: @recipe1, ingredient: @ingredient3)
    RecipeIngredient.create!(recipe: @recipe2, ingredient: @ingredient1)
    RecipeIngredient.create!(recipe: @recipe2, ingredient: @ingredient2)
  end

  # User Story 2
  it "displays the recipe's attributes and ingredients" do
    visit "/recipes/#{@recipe1.id}"

    expect(page).to have_content(@recipe1.name)
    expect(page).to have_content("Recipe Complexity Level: #{@recipe1.complexity}")
    expect(page).to have_content("Recipe Type: #{@recipe1.genre}")

    within("#ingredients") do
      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient3.name)
      expect(page).to_not have_content(@ingredient2.name)
    end
  end
end