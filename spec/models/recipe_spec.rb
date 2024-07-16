require "rails_helper"

RSpec.describe Recipe, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe "relationships" do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

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

  describe "instance methods" do
    it "total_cost" do
      expect(@recipe1.total_cost).to eq(7)
      expect(@recipe2.total_cost).to eq(5)
    end
  end
end