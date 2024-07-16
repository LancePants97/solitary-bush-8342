require "rails_helper"

RSpec.describe "the ingredients index" do
  before(:each) do
    @ingredient1 = Ingredient.create!(name: "Salt", cost: 2)
    @ingredient2 = Ingredient.create!(name: "Pepper", cost: 3)
    @ingredient3 = Ingredient.create!(name: "Olive Oil", cost: 5)
  end
  
  # User Story 1
  it "displays a list of all ingredients including their name and cost" do 
    visit "/ingredients"

    within("#ingredient-#{@ingredient1.id}") do
      expect(page).to have_content("#{@ingredient1.name}: $#{@ingredient1.cost}")
    end

    within("#ingredient-#{@ingredient2.id}") do
      expect(page).to have_content("#{@ingredient2.name}: $#{@ingredient2.cost}")
    end

    within("#ingredient-#{@ingredient3.id}") do
      expect(page).to have_content("#{@ingredient3.name}: $#{@ingredient3.cost}")
    end
  end
end